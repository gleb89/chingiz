from typing import Optional, List

import ormar


from config.database import metadata, database


class TypePresent(ormar.Model):

    """ 
    Таблица модели привязана отношениями
    many to many к таблице product
    -Поле {name_type} название типа подарка
    """

    class Meta:
        tablename = "type"
        metadata = metadata
        database = database

    id: int = ormar.Integer(primary_key=True)
    name_type: str = ormar.String(max_length=1000)


    class Config:
        orm_mode = True