from fastapi import APIRouter,Depends, File, UploadFile,Form



from models.reason_for_precent import Reason
from logics.jwt_token import jwt_auth
from logics.category import image_add
from logics.category import image_delete


reason_precent = APIRouter(
    prefix="/api/v1/present/reason",
    tags=["Поводы для подарков"],

)


@reason_precent.post('/')
async def create(name_reason: str,image: UploadFile = File(...)):
    icon = await image_add(image)
    new_reason =  await Reason.objects.create(
        name_reason = name_reason,
        icon = icon
    )
    await new_reason.update(serial_number = new_reason.id)
    return new_reason

@reason_precent.get('/')
async def get_all():
    return await Reason.objects.order_by("serial_number").all()

@reason_precent.put(
    '/update/serial/{id_one}/{id_two}'
    )
async def update_serial(
    id_one:int,
    id_two:int
    ):
    reason_one = await Reason.objects.get(id = id_one)
    serial_number_one = reason_one.serial_number 
    reason_two = await Reason.objects.get(id = id_two)
    serial_number_two = reason_two.serial_number 
    await reason_one.update(serial_number = serial_number_two)
    await reason_two.update(serial_number = serial_number_one)
    return await Reason.objects.order_by("serial_number").all()

@reason_precent.get('/{id}')
async def get_one(id: int):
    return await Reason.objects.get_or_none(id=id)


@reason_precent.put('/update/{id}')
async def update_one(
    id:int,
    name_reason: str = Form(None),
    image: UploadFile = File(None),
    
    ):
    reason = await Reason.objects.get_or_none(id=id)
    
    if image:
        
        await image_delete(reason.icon)
        icon = await image_add(image)
        await reason.update(icon = icon)
    if name_reason:
        await reason.update(
            name_reason = name_reason,
            )
    return await Reason.objects.order_by("serial_number").all()


@reason_precent.delete('/{id}')
async def delete(id: int):
    form = await Reason.objects.get_or_none(id=id)
    await image_delete(form.icon)
    try:
        await form.delete()
        return await Reason.objects.order_by("serial_number").all()
    except:
        return {'message': 'not category'}