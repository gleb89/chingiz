from fastapi import APIRouter,Depends



from models.reason_for_precent import Reason
from logics.jwt_token import jwt_auth


reason_precent = APIRouter(
    prefix="/api/v1/present/reason",
    tags=["Поводы для подарков"],

)


@reason_precent.post('/')
async def create(newformproduct: Reason,admin = Depends(jwt_auth)):
    return await newformproduct.save()


@reason_precent.get('/')
async def get_all():
    return await Reason.objects.all()


@reason_precent.get('/{id}')
async def get_one(id: int):
    return await Reason.objects.get_or_none(id=id)


@reason_precent.get('/update/{id}')
async def update_one(id:int,name_reason:str,admin = Depends(jwt_auth)):
    types = await Reason.objects.get(id=id)
    return await types.update(name_reason = name_reason)


@reason_precent.delete('/{id}')
async def delete(id: int,admin = Depends(jwt_auth)):
    form = await Reason.objects.get_or_none(id=id)
    try:
        await form.delete()
        return {'message': 'delete true'}
    except:
        return {'message': 'not category'}