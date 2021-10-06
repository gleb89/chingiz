from fastapi import APIRouter,Depends, File, UploadFile,Form



from models.reason_for_precent import Reason
from logics.jwt_token import jwt_auth
from logics.category import image_add


reason_precent = APIRouter(
    prefix="/api/v1/present/reason",
    tags=["Поводы для подарков"],

)


@reason_precent.post('/')
async def create(name_reason: str,image: UploadFile = File(...),admin = Depends(jwt_auth)):
    icon = await image_add(image)
    return await Reason.objects.create(
        name_reason = name_reason,
        icon = icon
    )


@reason_precent.get('/')
async def get_all():
    return await Reason.objects.all()


@reason_precent.get('/{id}')
async def get_one(id: int):
    return await Reason.objects.get_or_none(id=id)


@reason_precent.put('/update/{id}')
async def update_one(
    id:int,
    name_reason: str = Form(None),
    image: UploadFile = File(None),
    admin = Depends(jwt_auth)
    ):
    reason = await Reason.objects.get_or_none(id=id)
    if image:
        icon = await image_add(image)
        await reason.update(icon = icon)
    if name_reason:
        await reason.update(
            name_reason = name_reason,
            )
    return await Reason.objects.all()


@reason_precent.delete('/{id}')
async def delete(id: int,admin = Depends(jwt_auth)):
    form = await Reason.objects.get_or_none(id=id)
    try:
        await form.delete()
        return {'message': 'delete true'}
    except:
        return {'message': 'not category'}