from typing import List, Optional

from fastapi import APIRouter
from fastapi.responses import JSONResponse
from fastapi.encoders import jsonable_encoder

from models.basket_users import Basket
from models.users import Users
from models.present import Present
from shemas.basket import AddBasketAnonim, AddBasketUser

app = APIRouter(
    prefix="/api/v1/present/users/basket",
    tags=["Корзина"],

)


@app.post('/')
async def create()->Basket:
    """
    Создается корзина
    """
    new_basket = Basket(count_present_item={'presents':[]})
    return await new_basket.save()


async def add_present_for_basket(present_id:int,basket)->Basket:
    """
    Создается корзина
    """
    present = await Present.objects.get(id=present_id)
    basket_dict = basket.count_present_item.get('presents')
    
    if present.id in [item['id'] for item in basket_dict]:
        for item in basket_dict:
            if present.id == item['id']:
                item['count'] = item['count'] + 1
                item['price'] = present.price*item['count']
    else:
        _present_dict = present.dict()
        _present_dict.update({'count':1})
        basket_dict.append(_present_dict)
    return await basket.update(count_present_item={'presents':basket_dict})
  
    

@app.post('/anonim_basket/add/{count_pres}')
async def add_present_anonim(data:AddBasketAnonim, count_pres:int)->JSONResponse:
    """
    Добавляет товары в корзину от анонимного
    пользователя
    - если id_basket = 0 создает пустую  корзину и присваивает ей id
    - **id_basket**   id корзины
    - **precent_id**   id подарка
    - Возвращает id корзины и сумму всех подарков в корзине
    """
    if data.id_basket > 0:
        basket = await Basket.objects.get(id=data.id_basket)
    else: 
        basket = await create()
    for pres in range(count_pres):
        await  add_present_for_basket(data.precent_id, basket)
    basket =  await Basket.objects.get(id=basket.id)
    summ = [summ['price'] for summ in basket.count_present_item.get('presents')]
    cont = {"basket_id": basket.id,
           "summa": sum(summ),
          }
    json_compatible_item_data = jsonable_encoder(cont)
    return JSONResponse(
        status_code=200,
        content=json_compatible_item_data
    )


@app.post('/user_basket/add/{count_pres}')
async def add_present_user(data:AddBasketUser, count_pres:int)->JSONResponse:
    """
    Добавляет товары в корзину от зарегистрированного
    пользователя
    - **id_user**   id пользователя firebase
    - **precent_id**   id подарка
    - Возвращает id корзины и сумму всех подарков в корзине
    """
    user = await Users.objects.get(uid_firebase=data.id_user)
    basket = await Basket.objects.get(user__id=user.id)
    for pres in range(count_pres):
        await  add_present_for_basket(data.precent_id, basket)
    basket = await Basket.objects.get(user__id=user.id)
    summ = [summ['price'] for summ in basket.count_present_item.get('presents')]
    cont = {"basket_id": basket.id,
           "summa": sum(summ),
          }
    json_compatible_item_data = jsonable_encoder(cont)
    return JSONResponse(
        status_code=200,
        content=json_compatible_item_data
    )


@app.get('/')
async def get_all()->List[Basket]:
    return await Basket.objects.all()


@app.get('/{id}')
async def get_one(id: int)->Basket:
    return await Basket.objects.get_or_none(id=id)


@app.delete('/{id}')
async def delete(id: int)->None:
    basket = await Basket.objects.get_or_none(id=id)
    await basket.delete()




