from typing import List

from fastapi import APIRouter
from fastapi.responses import JSONResponse
from fastapi.encoders import jsonable_encoder

from models.users import Users
from models.basket_users import Basket


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


@app.get('/{fairbase_id}')
async def get_one(fairbase_id: str)->Users:
    """
    - Возвращает юсера по **fairbase_id**
    """
    return await Users.objects.get_or_none(uid_firebase=fairbase_id)


@app.delete('/{fairbase_id}')
async def delete(fairbase_id: int)->None:
    """
    - Удаляет юсера по **fairbase_id**
    """
    user =  await Users.objects.get_or_none(id=fairbase_id)
    return await user.delete()