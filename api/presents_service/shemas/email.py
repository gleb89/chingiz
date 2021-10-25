from pydantic import BaseModel
from typing import Optional

class EmailContact(BaseModel):
    name:str
    phone:str
    text:str

