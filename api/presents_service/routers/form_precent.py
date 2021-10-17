from fastapi import APIRouter, Depends



from models.form_precent import  FormPresent
from logics.jwt_token import jwt_auth



form_router = APIRouter(
    prefix="/api/v1/present/form_product",
    tags=["Формы подарков"],

)


@form_router.post('/')
async def create(newformreason:  FormPresent):
    return await newformreason.save()


@form_router.get('/')
async def get_all():
    return await  FormPresent.objects.all()


@form_router.get('/{id}')
async def get_one(id: int):
    return await  FormPresent.objects.get_or_none(id=id)


@form_router.get('/update/{id}')
async def update_one(id:int,name_form:str):
    form = await FormPresent.objects.get(id=id)
    
    return await form.update(name_form=name_form)


@form_router.delete('/{id}')
async def delete(id: int):
    form = await  FormPresent.objects.get_or_none(id=id)
    try:
        await form.delete()
        return {'message': 'delete true'}
    except:
        return {'message': 'not category'}