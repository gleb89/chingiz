import ormar


from config.database import metadata, database



class Comments(ormar.Model):

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
        tablename = "coments"
        metadata = metadata
        database = database

    id: int = ormar.Integer(primary_key=True)
    present_id:int = ormar.Integer()
    user_id:int = ormar.Integer(nullable=True,default=None)
    name_user:str = ormar.String(max_length=100)
    phone_user:str = ormar.String(max_length=100)
    email_user:str = ormar.String(max_length=100)
    body:str = ormar.String(max_length=10000)
    moderation:bool = ormar.Boolean(nullable=True,default=False)