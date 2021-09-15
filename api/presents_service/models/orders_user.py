
from typing import Optional, List
import ormar


from config.config_cls import database,metadata


class Orders(ormar.Model):

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
        tablename = "orders"
        metadata = metadata
        database = database

    id: int = ormar.Integer(primary_key=True)
    name_precent: str = ormar.String(max_length=1000)
    body: str = ormar.String(max_length=1000,default='')
    image_precent: str = ormar.String(max_length=1000, nullable=True)
    composition: str = ormar.String(max_length=10000, nullable=True)