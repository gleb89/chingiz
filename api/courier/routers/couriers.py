from fastapi import APIRouter, Depends
from fastapi.responses import JSONResponse
from fastapi.encoders import jsonable_encoder

from models.couriers import Couriers
from logics.admin_hash import verify_password
from logics.jwt_token import admin_token
from shemas.couriers import AdminLogin
from logics.jwt_token import jwt_auth

couriers_router = APIRouter(
    prefix="/api/v1/couriers",
    tags=["Курьеры"],

)


@couriers_router.post('/')
async def create(courier: Couriers):
    return await courier.save()

@couriers_router.post('/login')
async def create_token_jwt(admin:AdminLogin):
    user = await Couriers.objects.get_or_none(email=admin.email)
    print(user)
    # if verify_password(user.password, admin.password):
    #     access_token, access_token_expires =  await admin_token.token_password(user.password)
    #     cont = {
    #         'status':True,
    #         "access_token": access_token,
    #         "access_token_expires": access_token_expires,
    #         }
    #     json_compatible_item_data = jsonable_encoder(cont)
    #     return JSONResponse(
    #     status_code=200,
    #     content=json_compatible_item_data
    #     )
    # else:
    #     cont = {
    #         'status':False,
    #         "detail": " Неверный логин или пароль",
    #     }
    #     json_compatible_item_data = jsonable_encoder(cont)
    #     return JSONResponse(
    #     status_code=400,
    #     content=json_compatible_item_data
    #     )


@couriers_router.get('/')
async def get_all():
    return await Couriers.objects.prefetch_related(['orders']).all()


@couriers_router.get('/data_courier')
async def get_one_courier(admin = Depends(jwt_auth)):
    return await Couriers.objects.prefetch_related(['orders']).get_or_none(password=admin)




@couriers_router.delete('/{id}')
async def delete(id: int):
    couriers = await Couriers.objects.get_or_none(id=id)
    try:
        await couriers.delete()
        return {'message': 'delete true'}
    except:
        return {'message': 'not delete'}