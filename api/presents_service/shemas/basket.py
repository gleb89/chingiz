from pydantic import BaseModel

class AddBasketAnonim(BaseModel):
    id_basket:int
    precent_id:int


class AddBasketUser(BaseModel):
    id_user :str
    precent_id:int


