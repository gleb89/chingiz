from pydantic import BaseModel

class CreatePresent(BaseModel):
    id:int
    name_precent:str
    price:int
    body:str
    image_precent: str
    composition: str
