import json

import ormar


from config.database import metadata, database




class HistoryBasket(ormar.Model):

    """ 
    """

    class Meta:
        tablename = "history_basket"
        metadata = metadata
        database = database

    id: int = ormar.Integer(primary_key=True)
    basket_id = ormar.Integer()
    history = ormar.JSON(default=[],nullable=True)
    end_zakaz_num: str = ormar.String(max_length=1000, null=True)