
from fastapi import APIRouter, File, UploadFile


from models.orders import Orders
from models.couriers import Couriers
from logics.orders import image_add

orders_router = APIRouter(
    prefix="/api/v1/couriers/orders",
    tags=["Заказы"],

)


@orders_router.post('/{history_id}/{courier_id}')
async def create(history_id: int, courier_id:int):
    courier = await Couriers.objects.get(id = courier_id)
    order = await Orders(
        history_id = history_id,
        ).save()
    await courier.orders.add(order)
    return order



@orders_router.get('/')
async def get_all():
    return await Orders.objects.all()


@orders_router.get('/{id}')
async def get_one(id: int):
    return await Orders.objects.get_or_none(id=id)


@orders_router.put('/{id}')
async def update_one(id: int, image: UploadFile = File(...)):
    order =  await Orders.objects.get_or_none(id=id)
    photo_dostavka = await image_add(image)
    return await order.update(dostavleno = True,photo_dostavka = photo_dostavka)

@orders_router.delete('/{id}')
async def delete(id: int):
    orders = await Orders.objects.get_or_none(id=id)
    try:
        await orders.delete()
        return {'message': 'delete true'}
    except:
        return {'message': 'not delete'}