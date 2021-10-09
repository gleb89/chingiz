from fastapi import APIRouter
from fastapi.responses import JSONResponse
from fastapi.encoders import jsonable_encoder

from models.admin import Admin
from logics.admin_hash import verify_password
from logics.jwt_token import admin_token
from shemas.admin import AdminLogin


admin_router = APIRouter(
    prefix="/api/v1/present/admin",
    tags=["администраторы"],
)

@admin_router.post('/')
async def create_admin(admin: Admin):
    return await admin.save()


@admin_router.get('/')
async def get_all():
    return await Admin.objects.all()

@admin_router.post('/token-auth')
async def create_token_jwt(admin:AdminLogin):
    user = await Admin.objects.get_or_none(name=admin.name)
    if verify_password(user.password, admin.password):
        access_token, access_token_expires =  await admin_token.token_password(user.password)
        cont = {
            'status':True,
            "access_token": access_token,
            "access_token_expires": access_token_expires,
            "admin_data":user
            }
        json_compatible_item_data = jsonable_encoder(cont)
        return JSONResponse(
        status_code=200,
        content=json_compatible_item_data
        )
    else:
        cont = {
            'status':False,
            "detail": " Неверный логин или пароль",
        }
        json_compatible_item_data = jsonable_encoder(cont)
        return JSONResponse(
        status_code=400,
        content=json_compatible_item_data
        )

@admin_router.get('/{name}')
async def get_all(name:str,password:str):
    user = await Admin.objects.get_or_none(name=name)
    return verify_password(user.password, password)


@admin_router.delete('/{id}')
async def delete_one(id:int):
    user = await Admin.objects.get_or_none(id = id)
    return await user.delete()

@admin_router.put('/{id}')
async def update_one(id:int,admin_key:str,admin_value:bool):
    user = await Admin.objects.get_or_none(id = id)
    return await user.update(admin_key = admin_value)
    