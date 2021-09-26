import json
import datetime
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
    history = ormar.JSON(default=[],nullable=True)
    dostavka:bool = ormar.Boolean(nullable=True,default=False)
    name_user:str = ormar.String(max_length=100,nullable=True, null=True)
    famaly_name_user:str = ormar.String(max_length=100,nullable=True, null=True)
    fiz_oplata:bool = ormar.Boolean(nullable=True,default=False)
    ur_oplata:bool = ormar.Boolean(nullable=True,default=False)
    summa: int = ormar.Integer()
    phone_user:str = ormar.String(max_length=100,nullable=True, null=True)
    email_user:str = ormar.String(max_length=1000,nullable=True, null=True)
    adress_user:str = ormar.String(max_length=100,nullable=True, null=True)
    comment_user:str = ormar.String(max_length=1000,nullable=True, null=True)
    oplata_user:str = ormar.String(max_length=1000,nullable=True, null=True)
    bonus_user:str = ormar.String(max_length=1000,nullable=True, null=True)
    name_company:str = ormar.String(max_length=1000,nullable=True, null=True)
    bank_benefic:str = ormar.String(max_length=1000,nullable=True, null=True)
    bin_bank:str = ormar.String(max_length=1000,nullable=True, null=True)
    bik_bank:str = ormar.String(max_length=1000,nullable=True, null=True)
    iik_bank:str = ormar.String(max_length=1000,nullable=True, null=True)
    cod_platezh:str = ormar.String(max_length=1000,nullable=True, null=True)
    cod_platezh:str = ormar.String(max_length=1000,nullable=True, null=True)
    kbe:str = ormar.String(max_length=1000,nullable=True, null=True)
    timestamp: datetime.datetime = ormar.DateTime(
                default=datetime.datetime.now()
                                                )
    data_dostavki:str = ormar.String(max_length=1000,nullable=True, null=True)