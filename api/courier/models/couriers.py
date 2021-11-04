from typing import Optional, List
import binascii
import hashlib
import os


import ormar


from pydantic import BaseModel, validator


from config.database import metadata, database
from models.orders import Orders




def hash_password(password: str) -> str:
    """Hash a password for storing."""
    salt = b'__hash__' + hashlib.sha256(os.urandom(60)).hexdigest().encode('ascii')
    pwdhash = hashlib.pbkdf2_hmac('sha512', password.encode('utf-8'),
                                  salt, 100000)
    pwdhash = binascii.hexlify(pwdhash)
    return (salt + pwdhash).decode('ascii')


def is_hash(pw: str) -> bool:
    return pw.startswith('__hash__') and len(pw) == 200


def verify_password(stored_password: str, provided_password: str) -> bool:
    """Verify a stored password against one provided by user"""
    salt = stored_password[:72]
    stored_password = stored_password[72:]
    pwdhash = hashlib.pbkdf2_hmac('sha512',
                                  provided_password.encode('utf-8'),
                                  salt.encode('ascii'),
                                  100000)
    pwdhash = binascii.hexlify(pwdhash).decode('ascii')
    return pwdhash == stored_password





class Couriers(ormar.Model):

    """ 
    """

    class Meta:
        tablename = "courier"
        metadata = metadata
        database = database

    id: int = ormar.Integer(primary_key=True)
    name: str = ormar.String(max_length=100,nullable=True, null=True)
    password:str = ormar.String(max_length=1000,nullable=True, null=True)
    norm_password:str = ormar.String(max_length=1000,nullable=True, null=True)
    email:str = ormar.String(max_length=100,nullable=True, null=True)
    adress_propiski:str = ormar.String(max_length=1000)
    adress_prozjivania:str = ormar.String(max_length=1000)
    phone_courier:str = ormar.String(max_length=1000)
    phone_family_people:str = ormar.String(max_length=1000,nullable=True, null=True)
    orders: Optional[Orders] = ormar.ManyToMany(
        Orders,  related_name="self_zakaz",nullable=True
    )

    # @validator('password')
    # def hash_password(cls, pw: str) -> str:
    #     if is_hash(pw):
    #         return pw
    #     return hash_password(pw)

    class Config:
        orm_mode = True