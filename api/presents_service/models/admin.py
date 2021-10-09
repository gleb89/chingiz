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
    password:str = ormar.String(max_length=1000)
    superuser:bool = ormar.Boolean(nullable=True,default=False)
    history_basket_read:bool = ormar.Boolean(nullable=True,default=False)
    present_read:bool = ormar.Boolean(nullable=True,default=False)
    filters_present_read:bool = ormar.Boolean(nullable=True,default=False)
    users_read:bool = ormar.Boolean(nullable=True,default=False)
    comments_read:bool = ormar.Boolean(nullable=True,default=False)
    podpiska_read:bool = ormar.Boolean(nullable=True,default=False)
    courer_read:bool = ormar.Boolean(nullable=True,default=False)

    courer_change:bool = ormar.Boolean(nullable=True,default=False)
    history_basket_change:bool = ormar.Boolean(nullable=True,default=False)
    present_change:bool = ormar.Boolean(nullable=True,default=False)
    filters_present_change:bool = ormar.Boolean(nullable=True,default=False)
    users_change:bool = ormar.Boolean(nullable=True,default=False)
    comments_change:bool = ormar.Boolean(nullable=True,default=False)
    podpiska_change:bool = ormar.Boolean(nullable=True,default=False)
    courer_change:bool = ormar.Boolean(nullable=True,default=False)

    @validator('password')
    def hash_password(cls, pw: str) -> str:
        if is_hash(pw):
            return pw
        return hash_password(pw)



    class Config:
        orm_mode = True