from distutils import core
from re import U
from urllib import response
from fastapi import Depends, FastAPI,HTTPException,status,File,UploadFile
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse
from fastapi.exceptions import HTTPException
from pydantic import BaseModel
from fastapi_jwt_auth import AuthJWT
import uuid
from typing import Optional,Lis
import os
from models import *
from repositories import *
import uvicorn



IMAGEDIR = os.path.abspath(os.getcwd()) + '/api/images/'

app = FastAPI()

# Static Config
app.mount("/images/", StaticFiles(directory="api/images"), name="static")
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


# Methods
# @app.get('/items')
# def get_items(category_id:Optional[int] = None,search:Optional[str] = None):
#     response_items:list[Item] = []
    
#     # Category Query
#     if category_id is None:
#         response_items = items
#     else:
#         for i in items:
#             if i.category_uuid == category_id:
#                 response_items.append(i)
    
#     # Search Query
#     if search is not None:
#         for i in response_items.copy():
#             if search not in i.title and search not in i.description:
#                 response_items.remove(i)

#     return response_items

# @app.get('/categories')
# def get_categories():
#     return categories

# @app.get('/item/{item_uuid}')
# def get_item_by_id(item_uuid:str):
#     for i in items:
#         if i.uuid == item_uuid:
#             return i
#     return {}

# @app.get('/favorites')
# def get_favories_by_user(authorize:AuthJWT=Depends()):
#     check_auth(authorize)
#     current_user_uuid = authorize.get_jwt_subject()
#     response_list:list[Item] = []
#     for i in favorites:
#         if i.user_uuid == current_user_uuid:
#             for x in items:
#                 if x.uuid == i.item_uuid:
#                     response_list.append(x)
#     return response_list

# @app.get('/cart')
# def get_cart_by_user(authorize:AuthJWT=Depends()):
#     check_auth(authorize)
#     current_user_uuid = authorize.get_jwt_subject()
#     response_list:list[Item] = []
#     for i in carts:
#         if i.user_uuid == current_user_uuid:
#             for x in i.cart_item_uuids:
#                 for y in cart_items:
#                     if x == y.uuid:
#                         for z in items:
#                             if z.uuid == y.item_uuid:
#                                 item = z.copy()
#                                 item.cart_item_uuid = y.uuid
#                                 # item.selected_option = y.selected_option
#                                 item.selected_size_option = y.selected_size_option
#                                 item.selected_color_option = y.selected_color_option
#                                 response_list.append(item)
#     return response_list

# @app.post('/favorite/{item_uuid}')
# def add_fovorite(item_uuid:str,authorize:AuthJWT=Depends()):
#     check_auth(authorize)
#     current_user_uuid = authorize.get_jwt_subject()
#     for i in items:
#         if i.uuid == item_uuid:
#             favorite:Favorite = Favorite()
#             favorite.user_uuid = current_user_uuid
#             favorite.item_uuid = i.uuid
#             favorites.append(favorite)
#             return True
#     return False

# @app.post('/cart')
# def add_cart(item:Item,authorize:AuthJWT=Depends()):
#     check_auth(authorize)
#     current_user_uuid = authorize.get_jwt_subject()
#     for i in items:
#         if i.uuid == item.uuid:
#             for x in carts:
#                 if x.user_uuid == current_user_uuid:
#                     cart_item = CartItem()
#                     cart_item.uuid = str(uuid.uuid4())
#                     item.cart_item_uuid = cart_item.uuid
#                     item.price = i.price
#                     cart_item.item_uuid = item.uuid
#                     # cart_item.selected_option = item.selected_option
#                     cart_item.selected_size_option = item.selected_size_option
#                     cart_item.selected_color_option = item.selected_color_option
#                     cart_items.append(cart_item)
#                     x.cart_item_uuids.append(cart_item.uuid)
#                     return item
                    
#             cart_item = CartItem()
#             cart_item.uuid = str(uuid.uuid4())
#             item.cart_item_uuid = cart_item.uuid
#             item.price = i.price
#             cart_item.item_uuid = item.uuid
#             # cart_item.selected_option = item.selected_option
#             cart_item.selected_size_option = item.selected_size_option
#             cart_item.selected_color_option = item.selected_color_option
#             cart_items.append(cart_item)
#             cart = Cart()
#             cart.user_uuid = current_user_uuid
#             cart.cart_item_uuids = [cart_item.uuid]
#             carts.append(cart)
#             return item
#     # return False
#     return item

# @app.delete('/favorite/{item_uuid}')
# def delete_favorite(item_uuid:str,authorize:AuthJWT=Depends()):
#     check_auth(authorize)
#     current_user_uuid = authorize.get_jwt_subject()
#     for i in favorites:
#         if i.user_uuid == current_user_uuid and i.item_uuid == item_uuid:
#             favorites.remove(i)
#             return True
#     return False


# @app.delete('/cart/{cart_item_uuid}')
# def delete_cart(cart_item_uuid:str,authorize:AuthJWT=Depends()):
#     check_auth(authorize)
#     current_user_uuid = authorize.get_jwt_subject()
#     for i in carts:
#         if i.user_uuid == current_user_uuid:
#             for x in i.cart_item_uuids:
#                 if x == cart_item_uuid:
#                     for y in cart_items:
#                         if y.uuid == cart_item_uuid:
#                             cart_items.remove(y)
#                             i.cart_item_uuids.remove(cart_item_uuid)
#                             return True
#     return False

# if __name__ == "__main__":
#     # Debug için
#     uvicorn.run(app, host="127.0.0.1", port=8000)