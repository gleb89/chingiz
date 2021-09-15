from typing import Optional

from fastapi.responses import JSONResponse
from fastapi.encoders import jsonable_encoder

from models.basket_users import Basket
from models.users import Users
from models.present import Present


async def remove_present_in_basket(
    basket_id: int,
    present_id: int,
    clear:Optional[str] = None
    )->JSONResponse:
    """
    Удаляет товары из корзины
    - **basket_id**   id корзины
    - **precent_id**   id подарка
    - Возвращает список подарков в данной корзине 
    и сумму всех подарков в корзине
    """
    basket = await Basket.objects.get(id=basket_id) 
    if clear:
        dict_basket = []
        summ = [0]
        message = 'remove_all'
    else:
        message = 'one_remove'
        dict_basket = [i for i in basket.count_present_item.get('presents') if i['id'] != present_id]
        summ = [summ['price'] for summ in dict_basket]
    await basket.update(count_present_item={'presents':dict_basket})
    cont = {
            "message":message,
            "basket_id": basket.id,
            "summa": sum(summ),
            "presents":dict_basket
          }
    
    json_compatible_item_data = jsonable_encoder(cont)
    return json_compatible_item_data


async def count_present_in_basket(id_basket,present_id):
    basket = await Basket.objects.get(id=id_basket)
    present = await Present.objects.get(id=present_id)
    basket_dict = basket.count_present_item.get('presents')
    item_present = {}
    for item in basket_dict:
            if present.id == item['id']:
                item['count'] = item['count'] + 1
                item['price'] = present.price*item['count']
                item_present = item
    await basket.update(count_present_item={'presents':basket_dict})
    basket =  await Basket.objects.get(id=basket.id)
    summ = [summ['price'] for summ in basket.count_present_item.get('presents')]
    cont = {
            "message":"add_count",
            "basket_id": basket.id,
            "summa": sum(summ),
            "item":item_present
          }
    json_compatible_item_data = jsonable_encoder(cont)
    return json_compatible_item_data 



async def remove_count_present_in_basket(id_basket,present_id):
    basket = await Basket.objects.get(id=id_basket)
    present = await Present.objects.get(id=present_id)
    basket_dict = basket.count_present_item.get('presents')
    item_present = {}
    for item in basket_dict:
            if present.id == item['id']:
                if item['count'] == 1:
                    item_present = item
                else:
                    item['count'] = item['count'] - 1
                    item['price'] = present.price*item['count']
                    item_present = item
    await basket.update(count_present_item={'presents':basket_dict})
    basket =  await Basket.objects.get(id=basket.id)
    summ = [summ['price'] for summ in basket.count_present_item.get('presents')]
    cont = {
            "message":"remove_count",
            "basket_id": basket.id,
            "summa": sum(summ),
            "item":item_present
          }
    json_compatible_item_data = jsonable_encoder(cont)
    return json_compatible_item_data 