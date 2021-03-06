from typing import Optional, List
import ormar


from pydantic import BaseModel, validator


from config.database import metadata, database
from logics.admin_hash import is_hash, hash_password


class Admin(ormar.Model):

    """ 
    """

    class Meta:
        tablename = "admin"
        metadata = metadata
        database = database

    id: int = ormar.Integer(primary_key=True)
    name: str = ormar.String(max_length=1000)
    email: str = ormar.String(max_length=1000,nullable=True)
    password:str = ormar.String(max_length=1000)
    normpassword:str = ormar.String(max_length=1000,nullable=True)
    superuser:bool = ormar.Boolean(nullable=True,default=False)

    admins_read:bool = ormar.Boolean(nullable=True,default=False)
    history_basket_read:bool = ormar.Boolean(nullable=True,default=False)
    present_read:bool = ormar.Boolean(nullable=True,default=False)
    filters_present_read:bool = ormar.Boolean(nullable=True,default=False)
    users_read:bool = ormar.Boolean(nullable=True,default=False)
    comments_read:bool = ormar.Boolean(nullable=True,default=False)
    podpiska_read:bool = ormar.Boolean(nullable=True,default=False)
    courer_read:bool = ormar.Boolean(nullable=True,default=False)
    sort_present_read:bool = ormar.Boolean(nullable=True,default=False)
    sort_category_read:bool = ormar.Boolean(nullable=True,default=False)
    akcia_read:bool = ormar.Boolean(nullable=True,default=False)

    admins_change:bool = ormar.Boolean(nullable=True,default=False)
    courer_change:bool = ormar.Boolean(nullable=True,default=False)
    history_basket_change:bool = ormar.Boolean(nullable=True,default=False)
    present_change:bool = ormar.Boolean(nullable=True,default=False)
    filters_present_change:bool = ormar.Boolean(nullable=True,default=False)
    users_change:bool = ormar.Boolean(nullable=True,default=False)
    comments_change:bool = ormar.Boolean(nullable=True,default=False)
    podpiska_change:bool = ormar.Boolean(nullable=True,default=False)
    sort_present_change:bool = ormar.Boolean(nullable=True,default=False)
    sort_category_change:bool = ormar.Boolean(nullable=True,default=False)
    akcia_change:bool = ormar.Boolean(nullable=True,default=False)

    admins_delete:bool = ormar.Boolean(nullable=True,default=False)
    courer_delete:bool = ormar.Boolean(nullable=True,default=False)
    history_basket_delete:bool = ormar.Boolean(nullable=True,default=False)
    present_delete:bool = ormar.Boolean(nullable=True,default=False)
    filters_present_delete:bool = ormar.Boolean(nullable=True,default=False)
    users_delete:bool = ormar.Boolean(nullable=True,default=False)
    comments_delete:bool = ormar.Boolean(nullable=True,default=False)
    podpiska_delete:bool = ormar.Boolean(nullable=True,default=False)
    akcia_delete:bool = ormar.Boolean(nullable=True,default=False)

    @validator('password')
    def hash_password(cls, pw: str) -> str:
        if is_hash(pw):
            return pw
        return hash_password(pw)



    class Config:
        orm_mode = True