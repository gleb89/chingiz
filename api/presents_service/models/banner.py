# import ormar
# import datetime

# from config.database import metadata, database



# class Banner(ormar.Model):

#     """ 
#     Таблица комментариев к определенному подарку
#     {id}: id комментария
#     {present_id} - id подарка для комментария
#     {user_id id} - пользователя оставившего комментарий,
#     если такой имеется
#     {name_user}- имя юсера оставившего комментарий
#     {phone_user} - телефон юсера оставившего комментарий
#     {email_user} - email юсера оставившего комментарий
#     """

#     class Meta:
#         tablename = "banner"
#         metadata = metadata
#         database = database

#     id: int = ormar.Integer(primary_key=True)
