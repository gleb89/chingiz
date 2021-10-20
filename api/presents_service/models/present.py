from typing import Optional, List
import ormar



from config.database import metadata, database
from models.category import Categories
from models.form_precent import  FormPresent
from models.reason_for_precent import Reason
from models.type_present import TypePresent
from models.subcategories import SubCategories


class Present(ormar.Model):

    """ 
    Таблица продукты
    many to many к таблице endpoints
    -Поле {name_precent} название корзины подарочной
    -Поле {body} описание корзины подарочной
    -Поле {price} цена корзины подарочной
    -Поле {category} категория корзины подарочной
    -Поле {image_precent} изображение корзины подарочной
    -Поле {composition} Состав корзины подарочной
    -Поле {form_product} форма корзины подарочной
    -Поле {reason_for_precent} повод для подарочной корзины
    -Поле {type_precent} тип для подарочной корзины
    -Поле {rating} рейтинг продукта(
        оценку может ставить только юсер купивший товар
        )

    """

    class Meta:
        tablename = "present"
        metadata = metadata
        database = database

    id: int = ormar.Integer(primary_key=True)
    sort_id_catalog: int = ormar.Integer(null=True,nullable=True)
    sort_id_popularnoe: int = ormar.Integer(null=True,nullable=True)
    sort_id_novinki: int = ormar.Integer(null=True,nullable=True)
    prevue_name: str = ormar.String(max_length=1000,nullable=True,default='')
    name_precent: str = ormar.String(max_length=1000)
    body: str = ormar.String(max_length=1000,nullable=True,default='')
    price: int = ormar.Integer()
    image_precent: str = ormar.String(max_length=1000, nullable=True)
    composition: str = ormar.String(max_length=10000, nullable=True)
    category: Optional[List[Categories]] = ormar.ManyToMany(
        Categories,  related_name="self_present",nullable=True
    )
    subcategory: Optional[List[SubCategories]] = ormar.ManyToMany(
        SubCategories,  related_name="self_sub_present",nullable=True
    )
    form_precent: Optional[List[ FormPresent]] = ormar.ManyToMany(
         FormPresent,nullable=True,skip_reverse=True
    )
    type_precent: Optional[List[TypePresent]] = ormar.ManyToMany(
        TypePresent,nullable=True,skip_reverse=True
    )
    reason_for_precent: Optional[List[Reason]] = ormar.ManyToMany(
        Reason,nullable=True, skip_reverse=True
    )


    class Config:
        orm_mode = True
