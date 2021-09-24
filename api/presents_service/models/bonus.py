import ormar
import datetime
from enum import Enum

from config.database import metadata, database


class Bonus(ormar.Model):

    """ 
    Таблица комментариев к определенному подарку
    {id}: id комментария
    {present_id} - id подарка для комментария
    {user_id id} - пользователя оставившего комментарий,
    если такой имеется
    {name_user}- имя юсера оставившего комментарий
    {phone_user} - телефон юсера оставившего комментарий
    {email_user} - email юсера оставившего комментарий
    """

    class Meta:
        tablename = "bonus"
        metadata = metadata
        database = database

    id: int = ormar.Integer(primary_key=True)
    user_fairbase_id:str = ormar.String(max_length=100)
    count_points = ormar.Integer(nullable=True,default=0)
    enum_povod: str = ormar.String(max_length=100)
    summ_check: int = ormar.Integer(default=0)
    timestamp: datetime.datetime = ormar.DateTime(
                default=datetime.datetime.now()
                                                )