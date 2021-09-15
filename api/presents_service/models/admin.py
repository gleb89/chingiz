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

    @validator('password')
    def hash_password(cls, pw: str) -> str:
        if is_hash(pw):
            return pw
        return hash_password(pw)



    class Config:
        orm_mode = True