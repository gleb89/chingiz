from typing import Optional, List

import ormar

import datetime
from config.database import metadata, database



class Insta(ormar.Model):

    """ 
    Таблица модели привязана отношениями
    many to many к таблице product
    -Поле {name_category} название категории
    -Поле {slug_category} url slug категории
    """

    class Meta:
        tablename = "insta"
        metadata = metadata
        database = database

    id: int = ormar.Integer(primary_key=True)
    link:str = ormar.String(max_length=10000)
    moderation:bool = ormar.Boolean(nullable=True,default=False)
    timestamp: datetime.datetime = ormar.DateTime(
                default=datetime.datetime.now()
                                                )

    class Config:
        orm_mode = True