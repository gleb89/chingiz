import ormar
import datetime

from config.database import metadata, database



class Mailing(ormar.Model):

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
        tablename = "mailing"
        metadata = metadata
        database = database

    id: int = ormar.Integer(primary_key=True)
    email_user:str = ormar.String(max_length=100)