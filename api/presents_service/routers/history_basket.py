from models.users import Users
from fastapi import APIRouter
from fastapi.responses import RedirectResponse
import datetime


from models.basket_users import Basket
from models.history_basket import HistoryBasket
from routers.bonus import *


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


@history_router.post("/oplata/{basket_id}")
async def add_basket_in_history(oplata_data:HistoryBasket,basket_id:int):
    
    oplata_data =  await HistoryBasket(**oplata_data.dict()).save()
    basket = await Basket.objects.get(id=basket_id)
    user = await Users.objects.get(basket_user__id = basket_id)
    
    new_points = len(basket.count_present_item.get('presents'))*500
    dict_basket = basket.count_present_item.get('presents')
    summ = [summ['price'] for summ in basket.count_present_item.get('presents')]
    await oplata_data.update(history = dict_basket)
    await basket.update(count_present_item={'presents':[]})
    await user.update(points = user.points + new_points)
    await Bonus(
        user_fairbase_id = user.uid_firebase,
        count_points = 500,
        enum_povod = f'заказ EL{oplata_data.id}',
        summ_check = sum(summ),
        ).save()
    await basket.history.add(oplata_data)
    return oplata_data

@history_router.get("/oplata/for_end/{basket_id}")
async def redirect_typer(basket_id:int):
    return RedirectResponse("http://api-booking.ru/cabinet/oplata")

