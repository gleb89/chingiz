from typing import Optional, List

import ormar


from config.database import metadata, database


class Reason(ormar.Model):

    """ 
    Таблица модели привязана отношениями
    many to many к таблице product
    -Поле {name_reason} название повода для подарка
    """

    class Meta:
        tablename = "reason"
        metadata = metadata
        database = database

    id: int = ormar.Integer(primary_key=True)
    serial_number: int = ormar.Integer(null=True,nullable=True)
    name_reason: str = ormar.String(max_length=1000)
    icon: str = ormar.String(max_length=1000,null=True)


    class Config:
        orm_mode = True