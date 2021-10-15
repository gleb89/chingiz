from typing import Optional, List

import ormar


from config.database import metadata, database


class SubCategories(ormar.Model):

    """ 
    Таблица модели привязана отношениями
    many to many к таблице product
    -Поле {name_category} название категории
    -Поле {slug_category} url slug категории
    """

    class Meta:
        tablename = "subcategories"
        metadata = metadata
        database = database

    id: int = ormar.Integer(primary_key=True)
    name_subcategory: str = ormar.String(max_length=1000, null=True)


    class Config:
        orm_mode = True