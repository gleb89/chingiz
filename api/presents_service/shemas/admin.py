from pydantic import BaseModel
from typing import Optional

class AdminLogin(BaseModel):
    name:str
    password:str

