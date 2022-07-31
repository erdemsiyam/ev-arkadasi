from distutils import core
from hashlib import new
from re import U
from select import select
from urllib import response
import uu
from fastapi import Depends, FastAPI, HTTPException, status, File, UploadFile, BackgroundTasks
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse
from fastapi.exceptions import HTTPException
from pydantic import BaseModel
from fastapi_jwt_auth import AuthJWT
import uuid
from typing import Optional,List
import os
from models import *
from repositories import *
import uvicorn
from PIL import Image
import io



IMAGEDIR = os.path.abspath(os.getcwd()) + '/images/'

app = FastAPI()

# Static Config
app.mount("/images/", StaticFiles(directory="../api/images"), name="static")
#uvicorn main:app --reload

# JWT Ayarı
class Settings(BaseModel):
    authjwt_secret_key:str = "f5747ed10eea1386427b8afa4a58cbf05e991857015bef2f0d7da047e98837d8"
@AuthJWT.load_config
def get_config():
    return Settings()

# Auth Methods
def check_auth(authorize:AuthJWT):
    try:
        authorize.jwt_required()
    except Exception as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED,detail="Invalid Token")

@app.get('/')
def index(authorize:AuthJWT=Depends()):
    check_auth(authorize=authorize)
    return {"message":True}

@app.post('/token')
def token(user:User,authorize:AuthJWT=Depends()):
    for u in users:
        if (user.phone == u.phone) and (user.sms_code == u.sms_code):
            u.access_token = authorize.create_access_token(subject=u.uuid) # token üretilir
            u.refresh_token = authorize.create_refresh_token(subject=u.uuid)
            response_user = u.copy()
            # response_user.password = None
            return response_user
    return HTTPException(status_code='401',detail='Invalid Username or Password')

@app.get('/refresh_token')
def refresh_token(authorize:AuthJWT=Depends()):
    try:
        authorize.jwt_refresh_token_required()
    except Exception as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED,detail="Invalid Token")
    current_user_uuid = authorize.get_jwt_subject()
    for u in users:
        if (u.uuid == current_user_uuid):
            user = User()
            user.uuid = u.uuid
            user.phone = u.phone
            user.sms_code = u.sms_code
            # user.password = None
            user.access_token = authorize.create_access_token(subject=u.uuid) # token üretilir
            user.refresh_token = u.refresh_token
            return user
    return HTTPException(status_code='401',detail='Invalid Username or Password')

@app.post('/signup',status_code=201)
def signup(user:User,authorize:AuthJWT=Depends()):
    user.uuid = str(uuid.uuid4())
    users.append(user)
    return token(user=user,authorize=authorize)

# User
@app.get("/user")
def user(user_uuid:str,authorize:AuthJWT=Depends()):
    check_auth(authorize)
    for i in users:
        if i.uuid == user_uuid:
            user_images : List[MyImage] = []
            for x in images:
                if x.user_uuid == user_uuid:
                    user_images.append(x)
            user_images.sort(key=lambda x: x.index, reverse=False)
            i.images = user_images
            i2 = i.copy()
            i2.access_token = None
            i2.refresh_token = None
            return i2
    return {"error":True,"message":"User Not Founded."}

@app.put('/user_update')
def user_update(user:User,authorize:AuthJWT=Depends()):
    check_auth(authorize)
    current_user_uuid = authorize.get_jwt_subject()
    for u in users:
        if u.uuid == current_user_uuid:
            u.name = user.name
            u.surname = user.surname
            u.country_code = user.country_code
            u.age = user.age
            u.gender = user.gender
            u.job = user.job
            u.instagram = user.instagram
            u.facebook = user.facebook
            u.description = user.description
            # User Geri Dönüş
            user_images : List[MyImage] = []
            for x in images:
                if x.user_uuid == u.uuid:
                    user_images.append(x)
            user_images.sort(key=lambda x: x.index, reverse=False)
            u.images = user_images
            i2 = u.copy()
            i2.access_token = None
            i2.refresh_token = None
            return i2
            # return {"error":False,"message":"Successfully Updated."}
    return {"error":True,"message":"User Not Founded."}
@app.post("/user_image_add")
def user_image_add(background_tasks: BackgroundTasks, file: UploadFile = File(...),authorize:AuthJWT=Depends()):
    check_auth(authorize)
    current_user_uuid = authorize.get_jwt_subject()
    myImage = image_add(background_tasks=background_tasks,file=file)
    myImage.user_uuid = current_user_uuid
    myImage.rent_uuid = None

    users_images_count = 0
    for i in images:
        if i.user_uuid == current_user_uuid:
            users_images_count += 1
    myImage.index = users_images_count + 1
    images.append(myImage)
    return myImage # {"error":False,"message":"Successfully Added."}
@app.delete("/user_image_delete")
def user_image_delete(image_uuid:str,authorize:AuthJWT=Depends()):
    check_auth(authorize)
    current_user_uuid = authorize.get_jwt_subject()

    for i in images:
        if i.user_uuid == current_user_uuid and i.uuid == image_uuid:
            image_delete(i)
            images.remove(i)
            break
        
    # reorder
    user_images:List[MyImage] = []
    for i in images:
        if i.user_uuid == current_user_uuid:
            user_images.append(i)
    user_images.sort(key=lambda x: x.index, reverse=False)
    index = 1
    for u in user_images:
        u.index = index
        index += 1
    return {"error":False,"message":"Image Successfully Deleted."}

@app.put("/user_image_reorder")
def user_image_reorder(image_uuid:str,new_index:int,authorize:AuthJWT=Depends()):
    check_auth(authorize)
    current_user_uuid = authorize.get_jwt_subject()

    user_images:List[MyImage] = []
    for i in images:
        if i.user_uuid == current_user_uuid:
            user_images.append(i)
    user_images.sort(key=lambda x: x.index, reverse=False)

    for i in user_images:
        if i.uuid == image_uuid:
            selected_image = i
            break
    
    user_images.remove(selected_image)
    user_images.insert(new_index-1,selected_image)

    index = 1
    for i in user_images:
        i.index = index
        index += 1
    return {"error":False,"message":"User Images Successfully Reordered."}
    

# Rent
@app.get("/rent")
def rent(rent_uuid:str):
    for i in rents:
        if i.uuid == rent_uuid:
            rent_images : List[MyImage] = []
            for x in images:
                if x.rent_uuid == rent_uuid:
                    rent_images.append(x)
            rent_images.sort(key=lambda x: x.index, reverse=False)
            i.images = rent_images
            return i
    return {"error":True,"message":"Rent Not Founded."}
        
@app.get("/rent_search")
def rent_search(latitude:float=41.015137,longitude:float=28.979530,latitude_delta:float=0.03,longitude_delta:float=0.03):
    rent_list: List[Rent] = []
    for r in rents:
        if (r.latitude <= latitude + latitude_delta and r.latitude >= latitude - latitude_delta) and (r.longitude <= longitude + longitude_delta and r.longitude >= longitude - longitude_delta):
            rent_list.append(r)
    return rent_list

@app.post("/rent_create")
def rent_create(rent:Rent,authorize:AuthJWT=Depends()):
    check_auth(authorize)
    current_user_uuid = authorize.get_jwt_subject()
    rent.uuid = str(uuid.uuid4())
    rent.user_uuid = current_user_uuid
    rents.append(rent)
    return rent # {"error":False,"message":"Successfully Created."}

@app.put("/rent_update")
def rent_update(rent:Rent,authorize:AuthJWT=Depends()):
    check_auth(authorize)
    current_user_uuid = authorize.get_jwt_subject()

    for i in rents:
        if i.uuid == rent.uuid and i.user_uuid == current_user_uuid:
            i.country_code = rent.country_code
            i.title = rent.title
            i.latitude = rent.latitude
            i.longitude = rent.longitude
            i.created_date = rent.created_date
            i.price = rent.price
            i.person_living_count = rent.person_living_count
            i.building_age = rent.building_age
            i.building_type = rent.building_type
            i.spot = rent.spot
            i.meter_square = rent.meter_square
            i.rooms_count = rent.rooms_count
            i.halls_count = rent.halls_count
            i.is_furnished = rent.is_furnished
            i.is_furnished_to_new_person = rent.is_furnished_to_new_person
            i.shared_bathroom = rent.shared_bathroom
            i.shared_room = rent.shared_room
            i.deposit_price = rent.deposit_price
            i.dues_price = rent.dues_price
            i.description = rent.description
            i.internet = rent.internet
            i.fridge = rent.fridge
            i.washing_machine = rent.washing_machine
            i.dishwasher = rent.dishwasher
            i.tv = rent.tv
            i.radiator = rent.radiator
            i.stove = rent.stove
            i.bus_stop = rent.bus_stop
            i.subway = rent.subway
            i.outdoor_parking = rent.outdoor_parking
            i.parking_garage = rent.parking_garage
            i.security = rent.security
            i.site = rent.site
            i.gym = rent.gym
            i.elevator = rent.elevator
            i.swimming_pool = rent.swimming_pool
            i.age_min = rent.age_min
            i.age_max = rent.age_max
            i.gender = rent.gender
            i.job_student = rent.job_student
            i.job_worker = rent.job_worker
            i.job_self_emp = rent.job_self_emp
            i.job_officer = rent.job_officer
            i.job_teacher = rent.job_teacher
            i.job_private_sector_emp = rent.job_private_sector_emp
            i.job_police_army = rent.job_police_army
            i.smoke = rent.smoke
            i.alcohol = rent.alcohol
            i.pet_cat = rent.pet_cat
            i.pet_dog = rent.pet_dog
            i.pet_bird = rent.pet_bird
            i.pet_others = rent.pet_others
            i.vegan = rent.vegan
            i.child = rent.child
            return i # {"error":False,"message":"Successfully Updated."}
    return {"error":True,"message":"Rent Not Founded."}

@app.delete("/rent_delete")
def rent_delete(rent_uuid:str,authorize:AuthJWT=Depends()):
    check_auth(authorize)
    current_user_uuid = authorize.get_jwt_subject()

    for i in rents:
        if i.uuid == rent_uuid and i.user_uuid == current_user_uuid:
            rents.remove(i)
            print(rents)
            return {"error":False,"message":"Successfully Deleted."}
    return {"error":True,"message":"Rent Not Founded."}

@app.post("/rent_image_add")
def rent_image_add(rent_uuid:str,background_tasks: BackgroundTasks, file: UploadFile = File(...),authorize:AuthJWT=Depends()):
    check_auth(authorize)
    current_user_uuid = authorize.get_jwt_subject()

    # rent var mı user a mı ait kontrol
    selectedRent = None
    for i in rents:
        if i.uuid == rent_uuid and i.user_uuid == current_user_uuid:
            selectedRent = i
            break
    if selectedRent is None:
        return {"error":True,"message":"Rent Not Founded."}
    
    myImage = image_add(background_tasks=background_tasks,file=file)
    myImage.user_uuid = None
    myImage.rent_uuid = rent_uuid

    rent_images_count = 0
    for i in images:
        if i.rent_uuid == selectedRent.uuid:
            rent_images_count += 1
    myImage.index = rent_images_count + 1
    images.append(myImage)
    return myImage # {"error":False,"message":"Successfully Added."}

@app.delete("/rent_image_delete")
def rent_image_delete(rent_uuid:str,image_uuid:str,authorize:AuthJWT=Depends()):
    check_auth(authorize)
    current_user_uuid = authorize.get_jwt_subject()

    # rent user a mı ait kontrol
    selectedRent = None
    for i in rents:
        if i.uuid == rent_uuid and i.user_uuid == current_user_uuid:
            selectedRent = i
            break
    if selectedRent is None:
        return {"error":True,"message":"Rent Not Founded."}
    
    for i in images:
        if i.rent_uuid == rent_uuid and i.uuid == image_uuid:
            image_delete(i)
            images.remove(i)
            break
        
    # reorder
    rent_images:List[MyImage] = []
    for i in images:
        if i.rent_uuid == selectedRent.uuid:
            rent_images.append(i)
    rent_images.sort(key=lambda x: x.index, reverse=False)
    index = 1
    for u in rent_images:
        u.index = index
        index += 1
    return {"error":False,"message":"Image Successfully Deleted."}

@app.put("/rent_image_reorder")
def rent_image_reorder(rent_uuid:str, image_uuid:str, new_index:int, authorize:AuthJWT=Depends()):
    check_auth(authorize)
    current_user_uuid = authorize.get_jwt_subject()

    # rent user a mı ait kontrol
    selected_rent = None
    for i in rents:
        if i.uuid == rent_uuid and i.user_uuid == current_user_uuid:
            selected_rent = i
            break
    if selected_rent is None:
        return {"error":True,"message":"Rent Not Founded."}

    rent_images:List[MyImage] = []
    for i in images:
        if i.rent_uuid == selected_rent.uuid:
            rent_images.append(i)
    rent_images.sort(key=lambda x: x.index, reverse=False)

    selected_image = None
    for i in rent_images:
        if i.uuid == image_uuid:
            selected_image = i
            break
    if selected_rent is None:
        return {"error":True,"message":"Rent Image Not Founded."}
    
    rent_images.remove(selected_image)
    rent_images.insert(new_index-1,selected_image)

    index = 1
    for i in rent_images:
        i.index = index
        index += 1
    return {"error":False,"message":"Rent Images Successfully Reordered."}


# Favorite
@app.get("/favorite")
def favorite(authorize:AuthJWT=Depends()):
    check_auth(authorize)
    current_user_uuid = authorize.get_jwt_subject()
    
    favories_list: List[Favorite] = []
    for i in favories:
        if i.user_uuid == current_user_uuid:
            favories_list.append(i)
    return favories_list

@app.post("/favorite_add")
def favorite_add(rent_uuid:str, authorize:AuthJWT=Depends()):
    check_auth(authorize)
    current_user_uuid = authorize.get_jwt_subject()
    
    for i in rents:
        if i.uuid == rent_uuid:

            # varsa ekleme
            for x in favories:
                if x.user_uuid == current_user_uuid and x.rent_uuid == i.uuid:
                    return {"error":False,"message":"Rent Already In Favories."}

            favorite = Favorite()
            favorite.user_uuid = current_user_uuid
            favorite.rent_uuid = i.uuid
            favories.append(favorite)
            return {"error":False,"message":"Favorite Successfully Added."}
    return {"error":True,"message":"Rent Not Founded."}

@app.delete("/favorite_delete")
def favorite_delete(rent_uuid:str, authorize:AuthJWT=Depends()):
    check_auth(authorize)
    current_user_uuid = authorize.get_jwt_subject()

    selected_rent = None
    for i in rents:
        if i.uuid == rent_uuid:
            selected_rent = i
            break
    
    if selected_rent is None:
        return {"error":True,"message":"Rent Not Founded."}
    
    for i in favories:
        if i.user_uuid == current_user_uuid and i.rent_uuid == selected_rent.uuid:
            favories.remove(i)
            return {"error":False,"message":"Favorite Successfully Deleted."}

    return {"error":True,"message":"Rent Not Founded."}



# Image (Common)
async def resize_image(name: str, file: UploadFile):
    sizes = [{
        "name":"big",
        "width": 1280,
        "height": 720
    }, {
        "name":"small",
        "width": 640,
        "height": 480
    }]

    request_object_content = await file.read()
    for size in sizes:
        image = Image.open(io.BytesIO(request_object_content))
        image.thumbnail((size['width'], size['height']))
        image.save(IMAGEDIR + name + "_" + size['name'] + ".jpg",quality=60)

def image_add(background_tasks: BackgroundTasks, file: UploadFile = File(...)) -> MyImage:
    myImage = MyImage()
    myImage.uuid = str(uuid.uuid4())
    myImage.big_url = myImage.uuid + '_big.jpg'
    myImage.small_url = myImage.uuid + '_small.jpg'
    myImage.created_date = datetime.datetime.now()
    # RESIZE IMAGES
    background_tasks.add_task(resize_image, name=myImage.uuid, file=file)
    return myImage

def image_delete(image: MyImage):
    os.remove(IMAGEDIR + image.big_url)
    os.remove(IMAGEDIR + image.small_url)

