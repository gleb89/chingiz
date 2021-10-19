from fastapi import APIRouter,BackgroundTasks
from fastapi.responses import RedirectResponse
import datetime


from models.basket_users import Basket
from models.history_basket import HistoryBasket
from routers.bonus import *
from models.users import Users
from logics.history import image_add
from routers.email import simple_send

history_router = APIRouter(
    prefix="/api/v1/present/history",
    tags=["История заказов"],
)

@history_router.get('/')
async def get_all():
    return await HistoryBasket.objects.all()

@history_router.get('/{basket_id}')
async def get_one_history_for_basket(basket_id:int):
    history = await HistoryBasket.objects.filter(self_basket__id=basket_id).all()
    return history

@history_router.get('/onehistory/{pk}')
async def get_one_history(pk:int):
    print(444)
    history = await HistoryBasket.objects.get_or_none(id=pk)
    return history
    
@history_router.delete('/{pk}')
async def get_one(pk:int):
    history = await HistoryBasket.objects.get_or_none(id=pk)
    await history.delete()

async def get_history(basket_id:int):
    return await HistoryBasket.objects.get_or_none(basket_id=basket_id)

@history_router.get('/artikl/{history_art}/basket/{basket_id}')
async def get_history_one_artical(history_art:str,basket_id:int):
    history =  await HistoryBasket.objects.get_or_none(basket_id = basket_id)
    history_zakaz = [zakaz for zakaz in history.history if zakaz['dict_basket']['zakaz_num']== history_art][0]
    return history_zakaz

async def spic_bonus_update_bonus(history):
    dict_basket = history.history
    new_points = len(dict_basket)*500
    user_id = history.self_basket[0].user.id
    user = await Users.objects.get(id = user_id)
    await user.update(points = user.points + new_points)
    await user.update(points = user.points - history.spisbonuys)
    summ = [summ['price'] for summ in dict_basket]
    
    await Bonus(
        user_fairbase_id = user.uid_firebase,
        count_points = history.bonus_user,
        enum_povod = f'заказ EL{history.id}',
        summ_check = sum(summ),
        ).save()
   

@history_router.post("/oplata/{basket_id}")
async def add_basket_in_history(
    oplata_data:HistoryBasket,
    basket_id:int,
    background_tasks: BackgroundTasks
    ):
    
    oplata_data =  await HistoryBasket(**oplata_data.dict()).save()
    basket = await Basket.objects.get(id=basket_id)
    user = await Users.objects.get(basket_user__id = basket_id)
    
    
    dict_basket = basket.count_present_item.get('presents')
    
    await oplata_data.update(history = dict_basket)
    await basket.update(count_present_item={'presents':[]})

    await basket.history.add(oplata_data)
    if oplata_data.oplata_user == 'Оплатить картой Visa / Master Card':
        await oplata_data.update(succes_oplata = True)
        await spic_bonus_update_bonus(oplata_data )
    if oplata_data.oplata_user != 'Оплатить картой Visa / Master Card':
        background_tasks.add_task(simple_send, oplata_data.email_user,oplata_data)
    return oplata_data

@history_router.get("/oplata/for_end/{basket_id}")
async def redirect_typer(basket_id:int):
    return RedirectResponse("http://giftcity.kz/cabinet/oplata")


@history_router.put('/send_curer/{pk}')
async def send_curer_history_data(pk:int, data:dict):
    history = await HistoryBasket.objects.get_or_none(id=pk)
    name = str(data['courier_name'])
    pk_curer = int(data['courier_id'])
    return await history.update(
        admin_send_curer = True,
        send_id_curer = pk_curer,
        send_name_curer = name
        )

@history_router.put('/otchet_photo_curer/{pk}')
async def photo_otchet_curer(pk:int,photo:dict):
    history = await HistoryBasket.objects.get_or_none(id=pk)
    return await history.update(
        photo_otchet = photo['image'],
        succes_dostavka_curer = True
        )
   

@history_router.put('admin_bool_dostavka/{pk}')
async def boll_admin_dostavka(pk:int):
    history = await HistoryBasket.objects.get_or_none(id=pk)
    return await history.update(
        admin_bool_dostavka = True
        )

@history_router.put('/succes_olata/{pk}/{oplata}')
async def succes_oplata_history(pk:int, oplata:int):
    history = await HistoryBasket.objects.select_related(['self_basket__user']).get_or_none(id=pk)
    print(history)
    await spic_bonus_update_bonus(history)
    return await history.update(succes_oplata = oplata)
