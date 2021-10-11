import json
import datetime
import ormar


from config.database import metadata, database




class HistoryBasket(ormar.Model):

    """ 
    Таблица Заказов
    """

    class Meta:
        tablename = "history_basket"
        metadata = metadata
        database = database

    id: int = ormar.Integer(primary_key=True)
    history = ormar.JSON(default=[],nullable=True)
    admin_bool_dostavka:bool = ormar.Boolean(nullable=True,default=False)
    admin_send_curer:bool = ormar.Boolean(nullable=True,default=False)
    photo_otchet:str = ormar.String(max_length=1000,nullable=True, null=True)
    send_id_curer: int = ormar.Integer(nullable=True, null=True)
    send_name_curer:str = ormar.String(max_length=100,nullable=True, null=True)
    name_user:str = ormar.String(max_length=100,nullable=True, null=True)
    famaly_name_user:str = ormar.String(max_length=100,nullable=True, null=True)
    fiz_oplata:bool = ormar.Boolean(nullable=True,default=False)
    ur_oplata:bool = ormar.Boolean(nullable=True,default=False)
    summa: int = ormar.BigInteger(default=0)
    phone_user:str = ormar.String(max_length=100,nullable=True, null=True)
    email_user:str = ormar.String(max_length=1000,nullable=True, null=True)
    adress_user:str = ormar.String(max_length=100,nullable=True, null=True)
    comment_user:str = ormar.String(max_length=1000,nullable=True, null=True)
    oplata_user:str = ormar.String(max_length=1000,nullable=True, null=True)
    bonus_user:str = ormar.String(max_length=1000,nullable=True, null=True)
    spisbonuys:int = ormar.BigInteger(default=0,nullable=True, null=True)
    name_company:str = ormar.String(max_length=1000,nullable=True, null=True)
    bank_benefic:str = ormar.String(max_length=1000,nullable=True, null=True)
    bin_bank:str = ormar.String(max_length=1000,nullable=True, null=True)
    bik_bank:str = ormar.String(max_length=1000,nullable=True, null=True)
    iik_bank:str = ormar.String(max_length=1000,nullable=True, null=True)
    cod_platezh:str = ormar.String(max_length=1000,nullable=True, null=True)
    cod_platezh:str = ormar.String(max_length=1000,nullable=True, null=True)
    kbe:str = ormar.String(max_length=1000,nullable=True, null=True)
    succes_oplata:bool = ormar.Boolean(nullable=True, null=True,default=False)
    timestamp: datetime.datetime = ormar.DateTime(
                default=datetime.datetime.now()
                                                )
    data_dostavki:str = ormar.String(max_length=1000,nullable=True, null=True)

