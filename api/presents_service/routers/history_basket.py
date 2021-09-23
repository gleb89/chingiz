from models.users import Users
from fastapi import APIRouter
from fastapi.responses import RedirectResponse


from models.basket_users import Basket
from models.history_basket import HistoryBasket


history_router = APIRouter(
    prefix="/api/v1/present/history",
    tags=["История заказов"],
)

@history_router.get('/')
async def get_all():
    return await HistoryBasket.objects.all()

@history_router.get('/{basket_id}')
async def get_one(basket_id:int):
    return await HistoryBasket.objects.filter(basket_id=basket_id)

# @history_router.post('/add_history/{basket_id}')
async def add_basket_in_history(basket_id:int):
    history = await get_one(basket_id)
    basket = await Basket.objects.get(id=basket_id)
    user = await Users.objects.get(basket_user__id = basket_id)
    
    new_points = len(basket.count_present_item.get('presents'))*300
    if history:
        dict_history = history.history.get('baskets')
    else:
        history = await HistoryBasket(basket_id=basket_id,history={'baskets':[]}).save()
    dict_history = history.history.get('baskets')

    dict_history.append([basket.count_present_item.get('presents')])
    await basket.update(count_present_item={'presents':[]})
    await user.update(points = user.points + new_points)
    return await history.update(history = {'baskets':dict_history})

@history_router.get("/oplata/for_end/{basket_id}")
async def redirect_typer(basket_id:int):
    await add_basket_in_history(basket_id)
    return RedirectResponse("http://api-booking.ru/cabinet/oplata")

