from typing import Optional, List

import ormar


from config.database import metadata, database
from models.subcategories import SubCategories


class Categories(ormar.Model):

    """ 
    Таблица модели привязана отношениями
    many to many к таблице product
    -Поле {name_category} название категории
    -Поле {slug_category} url slug категории
    """

    class Meta:
        tablename = "categories"
        metadata = metadata
        database = database

    id: int = ormar.Integer(primary_key=True)
    serial_number: int = ormar.Integer(null=True,nullable=True)
    name_category: str = ormar.String(max_length=1000, null=True)
    slug_category: str = ormar.String(max_length=250,default='slug')
    icon: str = ormar.String(max_length=1000,null=True)
    subcategory: Optional[List[SubCategories]] = ormar.ManyToMany(
        SubCategories,  related_name="self_category",nullable=True
    )

    class Config:
        orm_mode = True
