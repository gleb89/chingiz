from pydantic import BaseModel

class AdminLogin(BaseModel):
    name:str
    password:str