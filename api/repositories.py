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


users:List[User] = []
# categories:List[Category] = []
# items:List[Item] = []
# favorites:List[Favorite] = []
# cart_items:List[CartItem] = []
# carts:List[Cart] = []

# URL = "http://127.0.0.1:8000/images/"


# # USERS
# user1 = User()
# user1.uuid="b0e27d14-f6c3-45e3-b9dc-da4c106cba75"
# user1.username="erdem"
# user1.email = "erdem@erdem.com"
# user1.password = "123"
# users.append(user1)
# user2 = User()
# user2.uuid="c0e27d14-f6c3-45e3-b9dc-da4c106cba75"
# user2.username="siyam"
# user2.email = "siyam@erdem.com"
# user2.password = "123"
# users.append(user2)


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
