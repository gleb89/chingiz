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
async def get_one_history(basket_id:int):
    history = await HistoryBasket.objects.filter(basket_id=basket_id).all()
    if len(history)> 0:
        
         
         return [history[0].history[0].values()]
    else:
         return history
    
@history_router.delete('/{basket_id}')
async def get_one(basket_id:int):
    history = await HistoryBasket.objects.get_or_none(basket_id=basket_id)
    await history.delete()

async def get_history(basket_id:int):
    return await HistoryBasket.objects.get_or_none(basket_id=basket_id)

@history_router.get('/artikl/{history_art}/basket/{basket_id}')
async def get_history_one_artical(history_art:str,basket_id:int):
    history =  await HistoryBasket.objects.get_or_none(basket_id = basket_id)
    history_zakaz = [zakaz for zakaz in history.history if zakaz['dict_basket']['zakaz_num']== history_art][0]
    return history_zakaz

async def add_basket_in_history(basket_id:int):
    history = await get_history(basket_id)
    basket = await Basket.objects.get(id=basket_id)
    user = await Users.objects.get(basket_user__id = basket_id)
    
    new_points = len(basket.count_present_item.get('presents'))*500
    if history:
        element_num = history.end_zakaz_num[-1]
        zakaz_num = str(history.id)+str(basket.id)+str(user.id)+'-'+str(int(element_num) + 1)
    else:
        history = await HistoryBasket(basket_id=basket_id,end_zakaz_num='',history=[]).save()
        zakaz_num = str(history.id)+str(basket.id)+str(user.id)+'-'+'1'
    await history.update(end_zakaz_num = zakaz_num)
    dict_basket = basket.count_present_item.get('presents')
    list_history = history.history
    summ = [summ['price'] for summ in basket.count_present_item.get('presents')]
    list_history.append(
                   {
                'dict_basket':{
                    'present_basket':dict_basket,
                    'date':str(datetime.datetime.now()),
                    'zakaz_num':zakaz_num ,
                    'summa':sum(summ),
                    }
                }
            )
    
    await basket.update(count_present_item={'presents':[]})
    await user.update(points = user.points + new_points)
    await Bonus(
        user_fairbase_id = user.uid_firebase,
        count_points = 500,
        enum_povod = f'заказ EL{zakaz_num}',
        summ_check = sum(summ),
        ).save()
    return await history.update(
        history = list_history
        )

@history_router.get("/oplata/for_end/{basket_id}")
async def redirect_typer(basket_id:int):
    await add_basket_in_history(basket_id)
    return RedirectResponse("http://api-booking.ru/cabinet/oplata")

