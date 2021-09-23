from typing import List

from fastapi import APIRouter
from fastapi.responses import JSONResponse
from fastapi.encoders import jsonable_encoder

from models.users import Users
from models.basket_users import Basket
from routers.basket import add_present_for_basket


app = APIRouter(
    prefix="/api/v1/present/users",
    tags=["Users"]
    )

@app.post('/')
async def create(user:Users)->Users:
    """
    -Создает пользователя если такого еще нет в базе
    - Возвращает юсера
    """
    get_user = await Users.objects.get_or_none(uid_firebase=user.uid_firebase)
    if get_user:
        basket_id = await Users.objects.select_related(
            ["basket_user"]
        ).get_or_none(uid_firebase=user.uid_firebase)
        basket =  await Basket.objects.get(id=basket_id.basket_user[0].id)
        summ = [summ['price'] for summ in basket.count_present_item.get('presents')]
        cont = {"basket_id": basket.id,
                "summa": sum(summ),
                'user':basket_id 
            }
       

    else:
        new_user =  await user.save()
        basket = await Basket(count_present_item={'presents':[]}).save()
        await new_user.basket_user.add(basket)
        user = await Users.objects.get_or_none(id=new_user.id)
        cont = {"basket_id": basket.id,
                "summa": 0,
                'user':user
        }
    json_compatible_item_data = jsonable_encoder(cont)

    return JSONResponse(
        status_code=200,
        content=json_compatible_item_data
    )

@app.get('/')
async def get_all()->List[Users]:
    """
    - Возвращает всех юсеров
    """
    return await Users.objects.select_related(
            ["basket_user"]
        ).all()

@app.post('/anonim/{basket_id}')
async def create_user_for_anonim_basketadd(
    form_user:Users, basket_id:str
    )->Users:
    """
    - Создание юсера после анонимного добавления в корзину
    """
    user = await Users.objects.select_related(
            ["basket_user"]
        ).get_or_none(uid_firebase = form_user.uid_firebase)
    basket = await Basket.objects.get(id=basket_id)
    if user:
        print('user')
        user_basket =  await Basket.objects.get(id=user.basket_user[0].id)
        for present in basket.count_present_item.get('presents'):
            await add_present_for_basket(present['id'], user_basket)
        user = await Users.objects.select_related(
            ["basket_user"]
        ).get_or_none(uid_firebase = form_user.uid_firebase)
        summ = [summ['price'] for summ in user_basket.count_present_item.get('presents')]
        basket_id = user_basket.id

    else:
        new_user =  await form_user.save()
        await new_user.basket_user.add(basket)
        summ = [summ['price'] for summ in basket.count_present_item.get('presents')]
        user = await Users.objects.select_related(
            ["basket_user"]
        ).get_or_none(id = new_user.id)
        basket_id = basket.id

    cont = {"basket_id": basket_id,
            "user":user,
            "summa": sum(summ),
        }
    json_compatible_item_data = jsonable_encoder(cont)
    return JSONResponse(
    status_code=200,
    content=json_compatible_item_data
    )


@app.get('/{fairbase_id}')
async def get_one(fairbase_id: str)->Users:
    """
    - Возвращает юсера по **fairbase_id**
    """
    return await Users.objects.get_or_none(uid_firebase=fairbase_id)


@app.delete('/{fairbase_id}')
async def delete(fairbase_id: str)->None:
    """
    - Удаляет юсера по **fairbase_id**
    """
    user =  await Users.objects.get_or_none(uid_firebase=fairbase_id)
    return await user.delete()