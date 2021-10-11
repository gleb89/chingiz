from fastapi import APIRouter, Form
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
    user = await Admin.objects.get_or_none(email=admin.email)
    if user:

        cont = {
            'message':'Администратор с таким email уже существует ',
        }
        json_compatible_item_data = jsonable_encoder(cont)
        return JSONResponse(
        status_code=400,
        content=json_compatible_item_data
        )
    else:
        return await admin.save()


@admin_router.get('/')
async def get_all():
    return await Admin.objects.all()

@admin_router.post('/token-auth')
async def create_token_jwt(admin:AdminLogin):
    user = await Admin.objects.get_or_none(email=admin.email)
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

@admin_router.get('/{email}')
async def get_all(email:str,password:str):
    user = await Admin.objects.get_or_none(email=email)
    return verify_password(user.password, password)


@admin_router.delete('/{id}')
async def delete_one(id:int):
    user = await Admin.objects.get_or_none(id = id)
    return await user.delete()

@admin_router.put('/{id}')
async def update_one(
    id:int,
    history_basket_read:bool = Form(None),
    present_read:bool = Form(None),
    filters_present_read:bool = Form(None),
    users_read:bool = Form(None),
    comments_read:bool = Form(None),
    podpiska_read:bool = Form(None),
    courer_read:bool = Form(None),

    courer_change:bool = Form(None),
    history_basket_change:bool = Form(None),
    present_change:bool = Form(None),
    filters_present_change:bool = Form(None),
    users_change:bool = Form(None),
    comments_change:bool = Form(None),
    podpiska_change:bool = Form(None),
):
    user = await Admin.objects.get_or_none(id = id)
    if history_basket_read != None:
        await user.update(history_basket_read = history_basket_read)

    if present_read != None:
        await user.update(present_read = present_read)

    if filters_present_read != None:
        await user.update(filters_present_read = filters_present_read)

    if users_read != None:
        await user.update(users_read = users_read)

    if comments_read != None:
        
        await user.update(comments_read = comments_read)

    if podpiska_read != None:
        await user.update(podpiska_read = podpiska_read)

    if courer_read != None:
        await user.update(courer_read = courer_read)

    if courer_change != None:
        await user.update(courer_change = courer_change)

    if history_basket_change != None:
        await user.update(history_basket_change = history_basket_change)

    if present_change != None:
        await user.update(present_change= present_change)

    if filters_present_change != None:
        await user.update(filters_present_change = filters_present_change)

    if users_change != None:
        await user.update(users_change= users_change)
        
    if comments_change != None:
        
        await user.update(comments_change = comments_change)

    if podpiska_change != None:
        await user.update(podpiska_change = podpiska_change)

    return await Admin.objects.all()


@admin_router.put('/password/{id}')
async def update_password(id:int,password:str = Form(...)):
    user = await Admin.objects.get_or_none(id = id)
    return await user.update(password = password)
    