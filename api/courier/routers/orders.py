from fastapi import APIRouter, File, UploadFile,BackgroundTasks
import httpx

from models.orders import Orders
from models.couriers import Couriers
from logics.orders import image_add
from routers.email import simple_send

orders_router = APIRouter(
    prefix="/api/v1/couriers/orders",
    tags=["Заказы"],

)


@orders_router.post('/create/{courier_id}')
async def create(order_new:Orders, courier_id:int,background_tasks: BackgroundTasks):
    courier = await Couriers.objects.get(id = courier_id)
    order = await order_new.save()
    await courier.orders.add(order)
    httpx.put(
        f'http://present_api:8000/api/v1/present/history/send_curer/{order_new.history_id}',
         json={
            'courier_id': int(courier_id),
            'courier_name': str(courier.name)
             }
         )
    background_tasks.add_task(simple_send, courier, order_new)
    return order



@orders_router.get('/')
async def get_all():
    return await Orders.objects.all()


@orders_router.get('/{id}')
async def get_one(id: int):
    return await Orders.objects.get_or_none(id=id)
    


@orders_router.put('/{id}')
async def update_one(id: int, image: UploadFile = File(...)):
    order =  await Orders.objects.prefetch_related(['self_zakaz']).get_or_none(id=id)
    photo_dostavka = await image_add(image)
    await order.update(dostavleno = True,photo_dostavka = photo_dostavka)
    id_user =  order.self_zakaz[0].id
    httpx.put(
        f'http://present_api:8000/api/v1/present/history/otchet_photo_curer/{order.history_id}',
        json={'image': photo_dostavka}
         )
    return await Couriers.objects.prefetch_related(['orders']).get_or_none(id=id_user)

@orders_router.delete('/{id}')
async def delete(id: int):
    orders = await Orders.objects.get_or_none(id=id)
    try:
        await orders.delete()
        return {'message': 'delete true'}
    except:
        return {'message': 'not delete'}