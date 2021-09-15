from typing import Optional, List

import ormar


from config.database import metadata, database


class FormPresent(ormar.Model):

    """ 
    Таблица модели привязана отношениями
    many to many к таблице product
    -Поле {name_form} название формы подарка
    """

    class Meta:
        tablename = "form"
        metadata = metadata
        database = database

    id: int = ormar.Integer(primary_key=True)
    name_form: str = ormar.String(max_length=1000)

    class Config:
        orm_mode = True