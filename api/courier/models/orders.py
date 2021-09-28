from typing import Optional, List

import ormar




from config.database import metadata, database



class Orders(ormar.Model):

    """ 
    """

    class Meta:
        tablename = "orders"
        metadata = metadata
        database = database

    id: int = ormar.Integer(primary_key=True)
    history_id: str = ormar.Integer()
    dostavleno:bool = ormar.Boolean(nullable=True,default=False)
    photo_dostavka:str = ormar.String(max_length=100,nullable=True,null=True)




    class Config:
        orm_mode = True