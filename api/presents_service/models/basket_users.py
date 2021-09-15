import json

import ormar
from typing import Optional, List

from .users import Users
from config.database import metadata, database
from .present import Present



class Basket(ormar.Model):

    """ 
    """

    class Meta:
        tablename = "basket"
        metadata = metadata
        database = database

    id: int = ormar.Integer(primary_key=True)
    user: Optional[Users] = ormar.ForeignKey(Users, related_name="basket_user")
    count_present_item = ormar.JSON(default={},nullable=True,)

