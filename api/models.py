from distutils import core
from re import U
from urllib import response
from fastapi import Depends, FastAPI,HTTPException,status,File,UploadFile
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse
from fastapi.exceptions import HTTPException
from pydantic import BaseModel, validator
from fastapi_jwt_auth import AuthJWT
import uuid
from typing import Optional,List
import os
from datetime import datetime


class CustomDatetime(datetime):
    @classmethod
    def __get_validators__(cls):
        yield cls.validate
    @classmethod
    def validate(cls, v):
        return cls.strptime(str(v), '%Y-%m-%d %H:%M:%S')
    @staticmethod
    def to_str(dt:datetime) -> str:
        return dt.strftime("%Y-%m-%d %H:%M:%S")

class MyBaseModel(BaseModel):
    class Config:
        json_encoders = {
            CustomDatetime: CustomDatetime.to_str
        }


class RentPhoto(MyBaseModel):
    uuid:Optional[str]
    rent_uuid:Optional[str]
    index:Optional[int] #  0:  vitrin foto
    big_url:Optional[str]
    small_url:Optional[str]
    created_date:Optional[CustomDatetime]


class UserPhoto(MyBaseModel):
    uuid:Optional[str]
    user_uuid:Optional[str]
    index:Optional[int] #  0:  vitrin foto
    big_url:Optional[str]
    small_url:Optional[str]
    created_date:Optional[CustomDatetime]


class User(MyBaseModel):
    uuid:Optional[str]
    name:Optional[str]
    surname:Optional[str]
    country_code:Optional[str]
    phone:Optional[str]
    sms_code:Optional[str]
    sms_code_expiration_datetime:Optional[CustomDatetime]
    age:Optional[int]
    gender:Optional[int] # 0:no_inf 1:male 2:famele
    job:Optional[int] # 0:no_inf 1:öğrenci, 2:işçi, 3:serbest, 4:memur, 5:öğretmen, 6:özel sektör, 7:polis/asker
    register_datetime:Optional[CustomDatetime]
    last_login_datetime:Optional[CustomDatetime]
    instagram:Optional[str]
    facebook:Optional[str]
    description:Optional[str]
    access_token:Optional[str]
    refresh_token:Optional[str]
    # Only For Json
    photos: Optional[list[UserPhoto]]


class Rent(MyBaseModel):
    uuid:Optional[str]
    user_uuid:Optional[str]
    country_code:Optional[str]
    title:Optional[str]
    latitude:Optional[float]
    longitude:Optional[float]
    created_date:Optional[CustomDatetime]
    expiration_date:Optional[CustomDatetime]
    discount_coupon:Optional[str]
    price:Optional[float]
    person_living_count:Optional[int]
    building_age:Optional[int]
    building_type:Optional[int] # 0:no_inf 1:daire 2:rezidans 3:müstakil
    spot:Optional[int] # bulunduğu kat
    meter_square:Optional[int]
    rooms_count:Optional[int]
    is_furnished:Optional[bool]
    is_furnished_to_new_person:Optional[bool]
    shared_bathroom:Optional[bool]
    shared_room:Optional[bool]
    deposit_price:Optional[float]
    dues_price:Optional[float]
    description:Optional[str]
    # Details
    internet:Optional[bool]
    fridge:Optional[bool]
    washing_machine:Optional[bool]
    dishwasher:Optional[bool]
    tv:Optional[bool]
    radiator:Optional[bool]
    stove:Optional[bool]
    bus_stop:Optional[bool]
    subway:Optional[bool]
    outdoor_parking:Optional[bool]
    parking_garage:Optional[bool]
    security:Optional[bool]
    site:Optional[bool]
    gym:Optional[bool]
    elevator:Optional[bool]
    swimming_pool:Optional[bool]
    # Required Personalities
    age_min:Optional[int]
    age_max:Optional[int]
    gender:Optional[int] # 0:either, 1:male, 2:famele
    job_student:Optional[bool] # 0:yes 1:no
    job_worker:Optional[bool] # 0:yes 1:no
    job_self_emp:Optional[bool] # 0:yes 1:no
    job_officer:Optional[bool] # 0:yes 1:no
    job_teacher:Optional[bool] # 0:yes 1:no
    job_private_sector_emp:Optional[bool] # 0:yes 1:no
    job_police_army:Optional[bool] # 0:yes 1:no
    smoke:Optional[bool] # 0:yes 1:no
    alcohol:Optional[bool] # 0:yes 1:no
    pet_cat:Optional[bool] # 0:yes 1:no
    pet_dog:Optional[bool] # 0:yes 1:no
    pet_bird:Optional[bool] # 0:yes 1:no
    pet_others:Optional[bool] # 0:yes 1:no
    vegan:Optional[bool] # 0:yes 1:no
    child:Optional[bool] # 0:yes 1:no
    # Only For Json
    small_photo: UserPhoto
    photos: Optional[list[UserPhoto]]



class RentPaymentDetail(MyBaseModel):
    rent_uuid:Optional[str]
    start_datetime:Optional[CustomDatetime]
    expiration_datetime:Optional[CustomDatetime]
    price:Optional[float]   # 1 -USD- or 0 -USD-
    currency:Optional[str]  # USD TRY
    country_code:Optional[str]
    discount_coupon:Optional[str]   # null or COUPONXX
    discount_rate:Optional[float]   # 0 or 0.5 or 1


class CountryPrice(MyBaseModel):
    country_code:Optional[str]
    price:Optional[float]   # 1 -USD- or 0 -USD-


class Coupon(MyBaseModel):
    discount_coupon:Optional[str]
    discount_rate:Optional[float]   # 1 -USD- or 0 -USD-
    user_uuid:Optional[str] # null(herkese), user_id tek kişiye
    expiration_datetime:Optional[CustomDatetime]


class FavoriesRent(MyBaseModel):
    user_uuid:Optional[str]
    rent_uuid:Optional[str]