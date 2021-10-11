from typing import Optional, List

import ormar


from config.database import metadata, database


class Stocks(ormar.Model):

    """ 
    Таблица модели привязана отношениями
    many to many к таблице product
    -Поле {name_reason} название повода для подарка
    """

    class Meta:
        tablename = "stocks"
        metadata = metadata
        database = database

    id: int = ormar.Integer(primary_key=True)
    name_stock: str = ormar.String(max_length=1000)
    body_stock: str = ormar.String(max_length=1000)
    image: str = ormar.String(max_length=1000,null=True)
    conditions: str = ormar.String(max_length=1000,null=True)


    class Config:
        orm_mode = True