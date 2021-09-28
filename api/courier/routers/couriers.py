from fastapi import APIRouter, Depends

from models.couriers import Couriers

couriers_router = APIRouter(
    prefix="/api/v1/couriers",
    tags=["Курьеры"],

)


@couriers_router.post('/')
async def create(courier: Couriers):
    return await courier.save()


@couriers_router.get('/')
async def get_all():
    return await Couriers.objects.prefetch_related(['orders']).all()


@couriers_router.get('/{id}')
async def get_one(id: int):
    return await Couriers.objects.get_or_none(id=id)




@couriers_router.delete('/{id}')
async def delete(id: int):
    couriers = await Couriers.objects.get_or_none(id=id)
    try:
        await couriers.delete()
        return {'message': 'delete true'}
    except:
        return {'message': 'not delete'}