from typing import Optional, List
import ormar
from pydantic import validator
import datetime

from config.database import metadata, database


class Users(ormar.Model):

    """ 
    """

    class Meta:
        tablename = "users"
        metadata = metadata
        database = database

    id: int = ormar.Integer(primary_key=True)
    uid_firebase: str = ormar.String(max_length=100)
    phone:str = ormar.String(max_length=100, nullable=True)
    email:str = ormar.String(max_length=100, nullable=True)
    firstname:str = ormar.String(max_length=100, nullable=True)
    last_name:str = ormar.String(max_length=100, nullable=True)
    father_name:str = ormar.String(max_length=100, nullable=True)
    avatar: str = ormar.String(max_length=1000, nullable=True)
    points:int = ormar.Integer(nullable=True,default=0)
    timestamp: datetime.datetime = ormar.DateTime(
                default=datetime.datetime.now()
                                                )
    