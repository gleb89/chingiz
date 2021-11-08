from typing import Optional, List

import ormar


from config.database import metadata, database



class Counter(ormar.Model):

    """ 
    Таблица модели привязана отношениями
    many to many к таблице product
    -Поле {name_category} название категории
    -Поле {slug_category} url slug категории
    """

    class Meta:
        tablename = "counter"
        metadata = metadata
        database = database

    id: int = ormar.Integer(primary_key=True)
    counter:int = ormar.Integer(null=True,default=0)

    class Config:
        orm_mode = True