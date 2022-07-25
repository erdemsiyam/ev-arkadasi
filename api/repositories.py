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
from typing import Optional,List
import os
from models import *
import datetime

users : List[User] = []
images : List[MyImage] = []
rents : List[Rent] = []
favories : List[Favorite] = []
# categories : List[Category] = []
# items = ""List[Item] = []
# favorites = ""List[Favorite] = []
# cart_items = ""List[CartItem] = []
# carts = ""List[Cart] = []

# URL = "http = ""//127.0.0.1 = ""8000/images/"


# User
user1 = User()
user1.uuid = "b99cc2d9-88bf-4a69-a878-0c1f9eff7b5b"
user1.name = "Ahmet"
user1.surname = "Yılmaz"
user1.country_code = "TR"
user1.phone = "+905511231234"
user1.sms_code = "1234"
user1.sms_code_expiration_datetime = datetime.datetime(2022, 7, 15,1,0,0)
user1.age = 34
user1.gender = 1
user1.job = 4
user1.register_datetime = datetime.datetime(2022, 7, 15,2,0,0)
user1.last_login_datetime = datetime.datetime(2022, 7, 15,3,0,0)
user1.instagram = "insta1"
user1.facebook = "face1"
user1.description = "desc2"
users.append(user1)
user2 = User()
user2.uuid = "156aeb0c-067f-11ed-b939-0242ac120002"
user2.name = "Mehmet"
user2.surname = "Çelik"
user2.country_code = "TR"
user2.phone = "+905521231234"
user2.sms_code = "1234"
user2.sms_code_expiration_datetime = datetime.datetime(2022, 7, 16,1,0,0)
user2.age = 35
user2.gender = 1
user2.job = 5
user2.register_datetime = datetime.datetime(2022, 7, 16,2,0,0)
user2.last_login_datetime = datetime.datetime(2022, 7, 16,3,0,0)
user2.instagram = "insta2"
user2.facebook = "face2"
user2.description = "desc2"
users.append(user2)
user3 = User()
user3.uuid = "820143ec-067f-11ed-b939-0242ac120002"
user3.name = "Hazal Leyla"
user3.surname = "Kaya"
user3.country_code = "TR"
user3.phone = "+905531231234"
user3.sms_code = "1234"
user3.sms_code_expiration_datetime = datetime.datetime(2022, 7, 17,1,0,0)
user3.age = 36
user3.gender = 2
user3.job = 3
user3.register_datetime = datetime.datetime(2022, 7, 17,2,0,0)
user3.last_login_datetime = datetime.datetime(2022, 7, 17,3,0,0)
user3.instagram = "insta3"
user3.facebook = "face3"
user3.description = "desc3"
users.append(user3)

# Rent
rent1 = Rent()
rent1.uuid = "055dc3fc-0683-11ed-b939-0242ac120002"
rent1.user_uuid = "b99cc2d9-88bf-4a69-a878-0c1f9eff7b5b"
rent1.country_code = "TR"
rent1.title = "Başlık 1"
rent1.latitude = 41.012739
rent1.longitude = 28.966655
rent1.created_date = datetime.datetime(2022, 7, 18,13,19,0)
rent1.expiration_date = datetime.datetime(2022, 8, 18,13,19,0)
rent1.discount_coupon = None
rent1.price = 3000
rent1.person_living_count = 1
rent1.building_age = 5
rent1.building_type = 1
rent1.spot = 3
rent1.meter_square = 120
rent1.rooms_count = 3
rent1.halls_count = 1
rent1.is_furnished = True
rent1.is_furnished_to_new_person = True
rent1.shared_bathroom = True
rent1.shared_room = False
rent1.deposit_price = 5000
rent1.dues_price = 250
rent1.description = "Açıklama 1"
rent1.internet = True
rent1.fridge = True
rent1.washing_machine = True
rent1.dishwasher = False
rent1.tv = True
rent1.radiator = True
rent1.stove = False
rent1.bus_stop = False
rent1.subway = False
rent1.outdoor_parking = True
rent1.parking_garage = False
rent1.security = False
rent1.site = False
rent1.gym = False
rent1.elevator = True
rent1.swimming_pool = False
rent1.age_min = 20
rent1.age_max = 50
rent1.gender = 1
rent1.job_student = True
rent1.job_worker = True
rent1.job_self_emp = True
rent1.job_officer = True
rent1.job_teacher = True
rent1.job_private_sector_emp = True
rent1.job_police_army = True
rent1.smoke = True
rent1.alcohol = True
rent1.pet_cat = True
rent1.pet_dog = True
rent1.pet_bird = True
rent1.pet_others = True
rent1.vegan = False
rent1.child = False
rents.append(rent1)
#rent2
rent2 = Rent()
rent2.uuid = "4b162450-0685-11ed-b939-0242ac120002"
rent2.user_uuid = "156aeb0c-067f-11ed-b939-0242ac120002"
rent2.country_code = "TR"
rent2.title = "Başlık 2"
rent2.latitude = 41.005240
rent2.longitude = 28.970103
rent2.created_date = datetime.datetime(2022, 7, 18,13,19,0,10101)
rent2.expiration_date = datetime.datetime(2022, 8, 18,13,19,0)
rent2.discount_coupon = None
rent2.price = 4500
rent2.person_living_count = 1
rent2.building_age = 2
rent2.building_type = 2
rent2.spot = 5
rent2.meter_square = 130
rent2.rooms_count = 3
rent2.halls_count = 1
rent2.is_furnished = True
rent2.is_furnished_to_new_person = True
rent2.shared_bathroom = True
rent2.shared_room = False
rent2.deposit_price = 6000
rent2.dues_price = 650
rent2.description = "Açıklama 2"
rent2.internet = True
rent2.fridge = True
rent2.washing_machine = True
rent2.dishwasher = True
rent2.tv = True
rent2.radiator = True
rent2.stove = False
rent2.bus_stop = True
rent2.subway = False
rent2.outdoor_parking = True
rent2.parking_garage = True
rent2.security = True
rent2.site = True
rent2.gym = True
rent2.elevator = True
rent2.swimming_pool = False
rent2.age_min = 22
rent2.age_max = 45
rent2.gender = 1
rent2.job_student = True
rent2.job_worker = True
rent2.job_self_emp = True
rent2.job_officer = True
rent2.job_teacher = True
rent2.job_private_sector_emp = True
rent2.job_police_army = True
rent2.smoke = True
rent2.alcohol = True
rent2.pet_cat = True
rent2.pet_dog = True
rent2.pet_bird = True
rent2.pet_others = True
rent2.vegan = False
rent2.child = False
rents.append(rent2)
#rent3
rent3 = Rent()
rent3.uuid = "1dde1694-0687-11ed-b939-0242ac120002"
rent3.user_uuid = "820143ec-067f-11ed-b939-0242ac120002"
rent3.country_code = "TR"
rent3.title = "Başlık 3"
rent3.latitude = 41.027953
rent3.longitude = 28.883121
rent3.created_date = datetime.datetime(2022, 7, 18,13,19,0)
rent3.expiration_date = datetime.datetime(2022, 8, 18,13,19,0)
rent3.discount_coupon = None
rent3.price = 2500
rent3.person_living_count = 2
rent3.building_age = 11
rent3.building_type = 1
rent3.spot = 1
rent3.meter_square = 134
rent3.rooms_count = 3
rent3.halls_count = 1
rent3.is_furnished = True
rent3.is_furnished_to_new_person = True
rent3.shared_bathroom = True
rent3.shared_room = True
rent3.deposit_price = 3000
rent3.dues_price = 200
rent3.description = "Açıklama 3"
rent3.internet = True
rent3.fridge = True
rent3.washing_machine = True
rent3.dishwasher = True
rent3.tv = True
rent3.radiator = True
rent3.stove = False
rent3.bus_stop = True
rent3.subway = False
rent3.outdoor_parking = True
rent3.parking_garage = False
rent3.security = False
rent3.site = False
rent3.gym = False
rent3.elevator = True
rent3.swimming_pool = False
rent3.age_min = 18
rent3.age_max = 28
rent3.gender = 2
rent3.job_student = True
rent3.job_worker = True
rent3.job_self_emp = True
rent3.job_officer = True
rent3.job_teacher = True
rent3.job_private_sector_emp = True
rent3.job_police_army = False
rent3.smoke = False
rent3.alcohol = False
rent3.pet_cat = True
rent3.pet_dog = True
rent3.pet_bird = True
rent3.pet_others = True
rent3.vegan = False
rent3.child = False
rents.append(rent3)
#rent4
rent4 = Rent()
rent4.uuid = "5a05a91a-0688-11ed-b939-0242ac120002"
rent4.user_uuid = "820143ec-067f-11ed-b939-0242ac120002"
rent4.country_code = "TR"
rent4.title = "Başlık 4"
rent4.latitude = 41.039624
rent4.longitude = 28.769476
rent4.created_date = datetime.datetime(2022, 7, 18,13,19,0)
rent4.expiration_date = datetime.datetime(2022, 8, 18,13,19,0)
rent4.discount_coupon = None
rent4.price = 6000
rent4.person_living_count = 2
rent4.building_age = 8
rent4.building_type = 3
rent4.spot = 0
rent4.meter_square = 160
rent4.rooms_count = 3
rent4.halls_count = 2
rent4.is_furnished = True
rent4.is_furnished_to_new_person = True
rent4.shared_bathroom = True
rent4.shared_room = True
rent4.deposit_price = 6000
rent4.dues_price = 350
rent4.description = "Açıklama 4"
rent4.internet = True
rent4.fridge = True
rent4.washing_machine = True
rent4.dishwasher = True
rent4.tv = True
rent4.radiator = True
rent4.stove = False
rent4.bus_stop = True
rent4.subway = True
rent4.outdoor_parking = True
rent4.parking_garage = True
rent4.security = False
rent4.site = False
rent4.gym = False
rent4.elevator = False
rent4.swimming_pool = True
rent4.age_min = 18
rent4.age_max = 28
rent4.gender = 2
rent4.job_student = True
rent4.job_worker = True
rent4.job_self_emp = True
rent4.job_officer = True
rent4.job_teacher = True
rent4.job_private_sector_emp = True
rent4.job_police_army = True
rent4.smoke = True
rent4.alcohol = True
rent4.pet_cat = True
rent4.pet_dog = True
rent4.pet_bird = True
rent4.pet_others = True
rent4.vegan = True
rent4.child = False
rents.append(rent4)

# Image User
image1 = MyImage()
image1.uuid = "275edb07-c5cc-4a76-b769-4cae66ab0be9"
image1.user_uuid = "b99cc2d9-88bf-4a69-a878-0c1f9eff7b5b"
image1.rent_uuid = None
image1.index = 1
image1.big_url = "275edb07-c5cc-4a76-b769-4cae66ab0be9_big.jpg"
image1.small_url = "275edb07-c5cc-4a76-b769-4cae66ab0be9_small.jpg"
image1.created_date = datetime.datetime(2022, 7, 18,13,7,7)
images.append(image1)
image2 = MyImage()
image2.uuid = "a8082160-300c-4795-aed4-efce9e3c313f"
image2.user_uuid = "156aeb0c-067f-11ed-b939-0242ac120002"
image2.rent_uuid = None
image2.index = 1
image2.big_url = "a8082160-300c-4795-aed4-efce9e3c313f_big.jpg"
image2.small_url = "a8082160-300c-4795-aed4-efce9e3c313f_small.jpg"
image2.created_date = datetime.datetime(2022, 7, 18,13,11,47)
images.append(image2)
image3 = MyImage()
image3.uuid = "78faac69-b768-4d12-9a40-3b9fd71d7eee"
image3.user_uuid = "820143ec-067f-11ed-b939-0242ac120002"
image3.rent_uuid = None
image3.index = 1
image3.big_url = "78faac69-b768-4d12-9a40-3b9fd71d7eee_big.jpg"
image3.small_url = "78faac69-b768-4d12-9a40-3b9fd71d7eee_small.jpg"
image3.created_date = datetime.datetime(2022, 7, 18,13,13,55)
images.append(image3)
image4 = MyImage()
image4.uuid = "c9fce3eb-801f-41d4-a114-fb84e2f1fba4"
image4.user_uuid = "820143ec-067f-11ed-b939-0242ac120002"
image4.rent_uuid = None
image4.index = 2
image4.big_url = "c9fce3eb-801f-41d4-a114-fb84e2f1fba4_big.jpg"
image4.small_url = "c9fce3eb-801f-41d4-a114-fb84e2f1fba4_small.jpg"
image4.created_date = datetime.datetime(2022, 7, 18,13,15,27)
images.append(image4)
# Image Rent
#rent1
image5 = MyImage()
image5.uuid = "18fa832e-ca3d-476c-80a6-722246fff5c7"
image5.user_uuid = None
image5.rent_uuid = "055dc3fc-0683-11ed-b939-0242ac120002"
image5.index = 1
image5.big_url = "18fa832e-ca3d-476c-80a6-722246fff5c7_big.jpg"
image5.small_url = "18fa832e-ca3d-476c-80a6-722246fff5c7_small.jpg"
image5.created_date = datetime.datetime(2022, 7, 18,13,28,38)
images.append(image5)
image5 = MyImage()
image5.uuid = "c6f5f3fc-ae9c-4660-9c78-87be28db4392"
image5.user_uuid = None
image5.rent_uuid = "055dc3fc-0683-11ed-b939-0242ac120002"
image5.index = 2
image5.big_url = "c6f5f3fc-ae9c-4660-9c78-87be28db4392_big.jpg"
image5.small_url = "c6f5f3fc-ae9c-4660-9c78-87be28db4392_small.jpg"
image5.created_date = datetime.datetime(2022, 7, 18,13,30,9)
images.append(image5)
image6 = MyImage()
image6.uuid = "63eeadc0-d6a6-45b0-b5c6-9968a21d4aea"
image6.user_uuid = None
image6.rent_uuid = "055dc3fc-0683-11ed-b939-0242ac120002"
image6.index = 3
image6.big_url = "63eeadc0-d6a6-45b0-b5c6-9968a21d4aea_big.jpg"
image6.small_url = "63eeadc0-d6a6-45b0-b5c6-9968a21d4aea_small.jpg"
image6.created_date = datetime.datetime(2022, 7, 18,13,31,44)
images.append(image6)
#rent2
image7 = MyImage()
image7.uuid = "13e64ea1-2029-441f-8345-b6184c980f04"
image7.user_uuid = None
image7.rent_uuid = "4b162450-0685-11ed-b939-0242ac120002"
image7.index = 1
image7.big_url = "13e64ea1-2029-441f-8345-b6184c980f04_big.jpg"
image7.small_url = "13e64ea1-2029-441f-8345-b6184c980f04_small.jpg"
image7.created_date = datetime.datetime(2022, 7, 18,13,40,18)
images.append(image7)
image8 = MyImage()
image8.uuid = "c1dd5e23-7e85-4746-aacb-e0fde6c2aca0"
image8.user_uuid = None
image8.rent_uuid = "4b162450-0685-11ed-b939-0242ac120002"
image8.index = 2
image8.big_url = "c1dd5e23-7e85-4746-aacb-e0fde6c2aca0_big.jpg"
image8.small_url = "c1dd5e23-7e85-4746-aacb-e0fde6c2aca0_small.jpg"
image8.created_date = datetime.datetime(2022, 7, 18,13,42,44)
images.append(image8)
image9 = MyImage()
image9.uuid = "dc04fb6f-e9c7-4f3b-8441-4b760563f76d"
image9.user_uuid = None
image9.rent_uuid = "4b162450-0685-11ed-b939-0242ac120002"
image9.index = 3
image9.big_url = "dc04fb6f-e9c7-4f3b-8441-4b760563f76d_big.jpg"
image9.small_url = "dc04fb6f-e9c7-4f3b-8441-4b760563f76d_small.jpg"
image9.created_date = datetime.datetime(2022, 7, 18,13,43,55)
images.append(image9)
#rent3
image10 = MyImage()
image10.uuid = "661797b4-e283-43c9-a60f-eaa882329ec1"
image10.user_uuid = None
image10.rent_uuid = "1dde1694-0687-11ed-b939-0242ac120002"
image10.index = 1
image10.big_url = "661797b4-e283-43c9-a60f-eaa882329ec1_big.jpg"
image10.small_url = "661797b4-e283-43c9-a60f-eaa882329ec1_small.jpg"
image10.created_date = datetime.datetime(2022, 7, 18,13,52,24)
images.append(image10)
image11 = MyImage()
image11.uuid = "45ecd623-ead0-4d60-8877-682daaa88b60"
image11.user_uuid = None
image11.rent_uuid = "1dde1694-0687-11ed-b939-0242ac120002"
image11.index = 2
image11.big_url = "45ecd623-ead0-4d60-8877-682daaa88b60_big.jpg"
image11.small_url = "45ecd623-ead0-4d60-8877-682daaa88b60_small.jpg"
image11.created_date = datetime.datetime(2022, 7, 18,13,53,58)
images.append(image11)
image12 = MyImage()
image12.uuid = "350a7d90-0a8e-4bc9-adfd-ebe1a79e162c"
image12.user_uuid = None
image12.rent_uuid = "1dde1694-0687-11ed-b939-0242ac120002"
image12.index = 3
image12.big_url = "350a7d90-0a8e-4bc9-adfd-ebe1a79e162c_big.jpg"
image12.small_url = "350a7d90-0a8e-4bc9-adfd-ebe1a79e162c_small.jpg"
image12.created_date = datetime.datetime(2022, 7, 18,13,54,55)
images.append(image12)
image13 = MyImage()
image13.uuid = "1fcb57de-7702-4c09-b1a7-6ac6a4b6218f"
image13.user_uuid = None
image13.rent_uuid = "1dde1694-0687-11ed-b939-0242ac120002"
image13.index = 4
image13.big_url = "1fcb57de-7702-4c09-b1a7-6ac6a4b6218f_big.jpg"
image13.small_url = "1fcb57de-7702-4c09-b1a7-6ac6a4b6218f_small.jpg"
image13.created_date = datetime.datetime(2022, 7, 18,13,55,29)
images.append(image13)
#rent4
image14 = MyImage()
image14.uuid = "3c687b67-db33-466e-81d0-4310a21704bc"
image14.user_uuid = None
image14.rent_uuid = "5a05a91a-0688-11ed-b939-0242ac120002"
image14.index = 1
image14.big_url = "3c687b67-db33-466e-81d0-4310a21704bc_big.jpg"
image14.small_url = "3c687b67-db33-466e-81d0-4310a21704bc_small.jpg"
image14.created_date = datetime.datetime(2022, 7, 18,14,3,25)
images.append(image14)
image15 = MyImage()
image15.uuid = "3a6bd83b-369d-49e5-8809-d2c03e1c7de3"
image15.user_uuid = None
image15.rent_uuid = "5a05a91a-0688-11ed-b939-0242ac120002"
image15.index = 2
image15.big_url = "3a6bd83b-369d-49e5-8809-d2c03e1c7de3_big.jpg"
image15.small_url = "3a6bd83b-369d-49e5-8809-d2c03e1c7de3_small.jpg"
image15.created_date = datetime.datetime(2022, 7, 18,14,4,46)
images.append(image15)
image16 = MyImage()
image16.uuid = "58f67a6c-a3cd-44bb-9149-304ad0234979"
image16.user_uuid = None
image16.rent_uuid = "5a05a91a-0688-11ed-b939-0242ac120002"
image16.index = 3
image16.big_url = "58f67a6c-a3cd-44bb-9149-304ad0234979_big.jpg"
image16.small_url = "58f67a6c-a3cd-44bb-9149-304ad0234979_small.jpg"
image16.created_date = datetime.datetime(2022, 7, 18,14,5,55)
images.append(image16)
image17 = MyImage()
image17.uuid = "19381c4e-4cb9-4b7e-b820-67145911c244"
image17.user_uuid = None
image17.rent_uuid = "5a05a91a-0688-11ed-b939-0242ac120002"
image17.index = 4
image17.big_url = "19381c4e-4cb9-4b7e-b820-67145911c244_big.jpg"
image17.small_url = "19381c4e-4cb9-4b7e-b820-67145911c244_small.jpg"
image17.created_date = datetime.datetime(2022, 7, 18,14,6,45)
images.append(image17)
image18 = MyImage()
image18.uuid = "dfbfde6b-de3d-4632-b5e4-fc92000a05b0"
image18.user_uuid = None
image18.rent_uuid = "5a05a91a-0688-11ed-b939-0242ac120002"
image18.index = 5
image18.big_url = "dfbfde6b-de3d-4632-b5e4-fc92000a05b0_big.jpg"
image18.small_url = "dfbfde6b-de3d-4632-b5e4-fc92000a05b0_small.jpg"
image18.created_date = datetime.datetime(2022, 7, 18,14,10,0)
images.append(image18)
image19 = MyImage()
image19.uuid = "1a014dcf-5348-43cc-990a-0ac600072b5c"
image19.user_uuid = None
image19.rent_uuid = "5a05a91a-0688-11ed-b939-0242ac120002"
image19.index = 6
image19.big_url = "1a014dcf-5348-43cc-990a-0ac600072b5c_big.jpg"
image19.small_url = "1a014dcf-5348-43cc-990a-0ac600072b5c_small.jpg"
image19.created_date = datetime.datetime(2022, 7, 18,14,11,13)
images.append(image19)

# Favorite
favorite1 = Favorite()
favorite1.user_uuid = "b99cc2d9-88bf-4a69-a878-0c1f9eff7b5b"
favorite1.rent_uuid = "4b162450-0685-11ed-b939-0242ac120002"
favories.append(favorite1)
favorite2 = Favorite()
favorite2.user_uuid = "b99cc2d9-88bf-4a69-a878-0c1f9eff7b5b"
favorite2.rent_uuid = "5a05a91a-0688-11ed-b939-0242ac120002"
favories.append(favorite2)

# uuid:Optional[str]
# user_uuid:Optional[str]
# rent_uuid:Optional[str]
# index:Optional[int] #  0:  vitrin foto
# big_url:Optional[str]
# small_url:Optional[str]
# created_date:Optional[CustomDatetime]


# # CATEGORIES
# cat1 = Category()
# cat1.uuid = "1"
# cat1.image = URL + "1.jpg"
# cat1.title = "Sneakers"
# categories.append(cat1)
# cat2 = Category()
# cat2.uuid = "2"
# cat2.image = URL + "2.jpg"
# cat2.title = "Jacket"
# categories.append(cat2)
# cat3 = Category()
# cat3.uuid = "3"
# cat3.image = URL + "3.jpg"
# cat3.title = "Watch"
# categories.append(cat3)


# # ITEMS
# item1 = Item()
# item1.uuid = "4"
# item1.category_uuid = "1"
# item1.small_image = URL + "4.jpg"
# item1.images = [URL + "5.jpg",URL + "6.jpg"]
# item1.title = "Shoes 1"
# item1.description = "Shoes 1 Description"
# item1.price = 100
# item1.point = 3
# item1.size_options = ["40","41"]
# item1.color_options = ["BLUE","RED","BLACK"]
# # item1.option_types = [OptionTypes.SHOES_NUMBER,OptionTypes.COLOR]
# # item1.options = [
# #     ShoesNumberOption.custom_init(
# #         new_value=Numbers.N40,
# #         new_options=[
# #             ColorOption().custom_init(new_value=Colors.BLUE),
# #             ColorOption().custom_init(new_value=Colors.RED),
# #         ],
# #     ),
# #     ShoesNumberOption.custom_init(
# #         new_value=Numbers.N41,
# #         new_options=[
# #             ColorOption().custom_init(new_value=Colors.BLACK),
# #         ],
# #     ),
# # ]
# items.append(item1)
# item2 = Item()
# item2.uuid = "5"
# item2.category_uuid = "1"
# item2.small_image = URL + "7.jpg"
# item2.images = [URL + "8.jpg",URL + "9.jpg"]
# item2.title = "Shoes 2"
# item2.description = "Shoes 2 Description"
# item2.price = 200
# item2.point = 4
# item2.size_options = ["40","41"]
# item2.color_options = ["ORANGE","PINK","WHITE"]
# # item2.option_types = [OptionTypes.SHOES_NUMBER,OptionTypes.COLOR]
# # item2.options = [
# #     ShoesNumberOption.custom_init(
# #         new_value=Numbers.N40,
# #         new_options=[
# #             ColorOption().custom_init(new_value=Colors.ORANGE),
# #             ColorOption().custom_init(new_value=Colors.PINK),
# #         ],
# #     ),
# #     ShoesNumberOption.custom_init(
# #         new_value=Numbers.N41,
# #         new_options=[
# #             ColorOption().custom_init(new_value=Colors.WHITE),
# #         ],
# #     ),
# # ]
# items.append(item2)
# item3 = Item()
# item3.uuid = "6"
# item3.category_uuid = "1"
# item3.small_image = URL + "10.jpg"
# item3.images = [URL + "11.jpg",URL + "12.jpg"]
# item3.title = "Shoes 3"
# item3.description = "Shoes 3 Description"
# item3.price = 250
# item3.point = 5
# item3.size_options = ["39","41","44"]
# item3.color_options = ["ORANGE","YELLOW","BLACK"]
# # item3.option_types = [OptionTypes.SHOES_NUMBER,OptionTypes.COLOR]
# # item3.options = [
# #     ShoesNumberOption.custom_init(
# #         new_value=Numbers.N39,
# #         new_options=[
# #             ColorOption().custom_init(new_value=Colors.ORANGE),
# #         ],
# #     ),
# #     ShoesNumberOption.custom_init(
# #         new_value=Numbers.N41,
# #         new_options=[
# #             ColorOption().custom_init(new_value=Colors.YELLOW),
# #         ],
# #     ),
# #     ShoesNumberOption.custom_init(
# #         new_value=Numbers.N44,
# #         new_options=[
# #             ColorOption().custom_init(new_value=Colors.BLACK),
# #         ],
# #     ),
# # ]
# items.append(item3)
# item4 = Item()
# item4.uuid = "7"
# item4.category_uuid = "2"
# item4.small_image = URL + "13.jpg"
# item4.images = [URL + "14.jpg",URL + "15.jpg"]
# item4.title = "Jacket 1"
# item4.description = "Jacket 1 Description"
# item4.price = 300
# item4.point = 3
# item4.size_options = ["54","60","64"]
# item4.color_options = ["BLUE","RED","BLACK"]
# # item4.option_types = [OptionTypes.BODY_NUMBER,OptionTypes.SIZE]
# # item4.options = [
# #     BodyNumberOption.custom_init(
# #         new_value=Numbers.N54,
# #         new_options=[
# #             SizeOption().custom_init(new_value=Sizes.SMALL),
# #         ],
# #     ),
# #     BodyNumberOption.custom_init(
# #         new_value=Numbers.N60,
# #         new_options=[
# #             SizeOption().custom_init(new_value=Sizes.MEDIUM),
# #         ],
# #     ),
# #     BodyNumberOption.custom_init(
# #         new_value=Numbers.N64,
# #         new_options=[
# #             SizeOption().custom_init(new_value=Sizes.LARGE),
# #         ],
# #     ),
# # ]
# items.append(item4)
# item5 = Item()
# item5.uuid = "8"
# item5.category_uuid = "2"
# item5.small_image = URL + "16.jpg"
# item5.images = [URL + "17.jpg",URL + "18.jpg"]
# item5.title = "Jacket 2"
# item5.description = "Jacket 2 Description"
# item5.price = 350
# item5.point = 4
# item5.size_options = ["54","60","64"]
# item5.color_options = ["BLUE","RED","BLACK"]
# # item5.option_types = [OptionTypes.BODY_NUMBER,OptionTypes.SIZE]
# # item5.options = [
# #     BodyNumberOption.custom_init(
# #         new_value=Numbers.N54,
# #         new_options=[
# #             SizeOption().custom_init(new_value=Sizes.SMALL),
# #         ],
# #     ),
# #     BodyNumberOption.custom_init(
# #         new_value=Numbers.N60,
# #         new_options=[
# #             SizeOption().custom_init(new_value=Sizes.MEDIUM),
# #         ],
# #     ),
# #     BodyNumberOption.custom_init(
# #         new_value=Numbers.N64,
# #         new_options=[
# #             SizeOption().custom_init(new_value=Sizes.LARGE),
# #         ],
# #     ),
# # ]
# items.append(item5)
# item6 = Item()
# item6.uuid = "9"
# item6.category_uuid = "2"
# item6.small_image = URL + "19.jpg"
# item6.images = [URL + "20.jpg",URL + "21.jpg"]
# item6.title = "Jacket 3"
# item6.description = "Jacket 3 Description"
# item6.price = 400
# item6.point = 5
# item6.size_options = ["54","60","64"]
# item6.color_options = ["BLUE","RED","BLACK"]
# # item6.option_types = [OptionTypes.BODY_NUMBER,OptionTypes.SIZE]
# # item6.options = [
# #     BodyNumberOption.custom_init(
# #         new_value=Numbers.N54,
# #         new_options=[
# #             SizeOption().custom_init(new_value=Sizes.SMALL),
# #         ],
# #     ),
# #     BodyNumberOption.custom_init(
# #         new_value=Numbers.N60,
# #         new_options=[
# #             SizeOption().custom_init(new_value=Sizes.MEDIUM),
# #         ],
# #     ),
# #     BodyNumberOption.custom_init(
# #         new_value=Numbers.N64,
# #         new_options=[
# #             SizeOption().custom_init(new_value=Sizes.LARGE),
# #         ],
# #     ),
# # ]
# items.append(item6)
# item7 = Item()
# item7.uuid = "10"
# item7.category_uuid = "3"
# item7.small_image = URL + "22.jpg"
# item7.images = [URL + "23.jpg",URL + "24.jpg"]
# item7.title = "Watch 1"
# item7.description = "Watch 1 Description"
# item7.price = 120
# item7.point = 3
# item7.size_options = ["54","60","64"]
# item7.color_options = ["BLUE","RED","BLACK"]
# # item7.option_types = [OptionTypes.WRIST_NUMBER,OptionTypes.MATERIAL]
# # item7.options = [
# #     WristNumberOption.custom_init(
# #         new_value=Numbers.N10,
# #         new_options=[
# #             MaterialOption().custom_init(new_value=Materials.GOLD),
# #         ],
# #     ),
# #     WristNumberOption.custom_init(
# #         new_value=Numbers.N11,
# #         new_options=[
# #             MaterialOption().custom_init(new_value=Materials.PLATINIUM),
# #         ],
# #     ),
# #     WristNumberOption.custom_init(
# #         new_value=Numbers.N12,
# #         new_options=[
# #             MaterialOption().custom_init(new_value=Materials.SILVER),
# #         ],
# #     ),
# # ]
# items.append(item7)
# item8 = Item()
# item8.uuid = "11"
# item8.category_uuid = "3"
# item8.small_image = URL + "25.jpg"
# item8.images = [URL + "26.jpg",URL + "27.jpg"]
# item8.title = "Watch 2"
# item8.description = "Watch 2 Description"
# item8.price = 160
# item8.point = 4
# item8.size_options = ["54","60","64"]
# item8.color_options = ["BLUE","RED","BLACK"]
# # item8.option_types = [OptionTypes.WRIST_NUMBER,OptionTypes.MATERIAL]
# # item8.options = [
# #     WristNumberOption.custom_init(
# #         new_value=Numbers.N10,
# #         new_options=[
# #             MaterialOption().custom_init(new_value=Materials.GOLD),
# #         ],
# #     ),
# #     WristNumberOption.custom_init(
# #         new_value=Numbers.N11,
# #         new_options=[
# #             MaterialOption().custom_init(new_value=Materials.PLATINIUM),
# #         ],
# #     ),
# #     WristNumberOption.custom_init(
# #         new_value=Numbers.N12,
# #         new_options=[
# #             MaterialOption().custom_init(new_value=Materials.SILVER),
# #         ],
# #     ),
# # ]
# items.append(item8)
# item9 = Item()
# item9.uuid = "12"
# item9.category_uuid = "3"
# item9.small_image = URL + "28.jpg"
# item9.images = [URL + "29.jpg",URL + "30.jpg"]
# item9.title = "Watch 3"
# item9.description = "Watch 3 Description"
# item9.price = 180
# item9.point = 5
# item9.size_options = ["54","60","64"]
# item9.color_options = ["BLUE","RED","BLACK"]
# # item9.option_types = [OptionTypes.WRIST_NUMBER,OptionTypes.MATERIAL]
# # item9.options = [
# #     WristNumberOption.custom_init(
# #         new_value=Numbers.N10,
# #         new_options=[
# #             MaterialOption().custom_init(new_value=Materials.GOLD),
# #         ],
# #     ),
# #     WristNumberOption.custom_init(
# #         new_value=Numbers.N11,
# #         new_options=[
# #             MaterialOption().custom_init(new_value=Materials.PLATINIUM),
# #         ],
# #     ),
# #     WristNumberOption.custom_init(
# #         new_value=Numbers.N12,
# #         new_options=[
# #             MaterialOption().custom_init(new_value=Materials.SILVER),
# #         ],
# #     ),
# # ]
# items.append(item9)
