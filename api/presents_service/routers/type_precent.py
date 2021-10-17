from fastapi import APIRouter,Depends



from models.type_present import TypePresent
from logics.jwt_token import jwt_auth

type_router = APIRouter(
    prefix="/api/v1/present/type",
    tags=["Типы подарков"],

)


@type_router.post('/')
async def create(new_type: TypePresent):
    return await new_type.save()


@type_router.get('/')
async def get_all():
    return await TypePresent.objects.all()


@type_router.get('/{id}')
async def get_one(id: int):
    return await TypePresent.objects.get_or_none(id=id)


@type_router.get('/update/{id}')
async def update_one(id:int,name_type:str):
    types = await TypePresent.objects.get(id=id)
    
    return await types.update(name_type = name_type)


@type_router.delete('/{id}')
async def delete(id: int):
    form = await TypePresent.objects.get_or_none(id=id)
    try:
        await form.delete()
        return {'message': 'delete true'}
    except:
        return {'message': 'not category'}