from typing import Optional
import asyncio


from fastapi import APIRouter, File, UploadFile, Depends, Form
from fastapi.responses import JSONResponse
from fastapi.encoders import jsonable_encoder


from models.present import Present
from models.category import Categories
from models.form_precent import FormPresent
from models.reason_for_precent import Reason
from models.type_present import TypePresent
from logics.precents import image_add
from shemas.precent import CreatePresent
from logics.jwt_token import jwt_auth



precent_router = APIRouter(
    prefix="/api/v1/present",
    tags=["подарки"],
)

headers = {
    "Content-Type": "application/json",
}

@precent_router.post('/')
async def create(
    name_precent: str = Form(...),
    price: int = Form(...),
    composition: str = Form(...),
    category_id: str = Form(...),
    form_precent_id: str = Form(...),
    type_precent_id: str = Form(...),
    reason_for_precent_id: str = Form(...),
    body :str = Form(...),
    image: UploadFile = File(...),
    # admin = Depends(jwt_auth)
    ):
    new_image = await image_add(image)
    new_present = await Present.objects.create(
        name_precent = name_precent,
        price = price,
        composition = composition,
        image_precent = new_image,
        body = body
    )
    type_precent = await TypePresent.objects.get_or_none(id=type_precent_id)
    reason_for_precent = await Reason.objects.get_or_none(id=reason_for_precent_id)
    category = await Categories.objects.get_or_none(id=category_id)
    form_precent = await FormPresent.objects.get_or_none(id=form_precent_id)
    await new_present.type_precent.add(type_precent)
    await new_present.reason_for_precent.add(reason_for_precent)
    await new_present.category.add(category)
    await new_present.form_precent.add(form_precent)
    return new_present


@precent_router.post('/add-image')
async def add_image(
    id: int,
    image: UploadFile = File(...),
    admin = Depends(jwt_auth)
    ):
    product = await Present.objects.get_or_none(
        id=id
    )
    if product:
        image_product = await image_add(image, id)
        await product.update(image_product=image_product)
        return image_product
    else:
        return {'message': 'error'}



@precent_router.get('/')
async def get_all(slug_category: Optional[str] = None):
    if slug_category:
        presents  =  await Present.objects.select_related(
            [
                "category",
                "form_precent",
                "type_precent",
                "reason_for_precent"
            ]
        ).filter(category__slug_category=slug_category).all()
        
    else:
        presents =  await Present.objects.select_related(
            [
                "category",
                "form_precent",
                "type_precent",
                "reason_for_precent"
            ]
            ).all()
    return presents 
    


@precent_router .get('/{id}')
async def get_one(id: int):
    return await Present.objects.select_related(
        [
            "category",
            "form_precent",
            "type_precent",
            "reason_for_precent"
            ]
        ).get_or_none(id=id)


@precent_router.put('/{id}') 
async def update_one(
    id:int,
    name_precent: str = Form(None),
    price: int = Form(None),
    composition: str = Form(None),
    category_id: int= Form(None),
    form_precent_id: int = Form(None),
    type_precent_id: int= Form(None),
    body: str = Form(None),
    reason_for_precent_id: int = Form(None),
    image: UploadFile = File(None),
    admin = Depends(jwt_auth)

    ):
    present = await Present.objects.select_related(
        [
            "category",
            "form_precent",
            "type_precent",
            "reason_for_precent"
        ]
    ).get_or_none(id=id)
    if image:
        new_image = await image_add(image)
        await present.update(image_precent = new_image)
    if body:
        await present.update(body= body)
    if name_precent:
        await present.update(name_precent = name_precent)
    if price:
        await present.update(price = price)
    if composition:
        await present.update(composition = composition)
    if category_id:
        category = await Categories.objects.get_or_none(
                                        id=category_id
                                        )
        await present.category.remove(present.category[0])
        await present.category.add(category)

    if type_precent_id:
        type_precent = await TypePresent.objects.get_or_none(
                                        id=type_precent_id
                                        )
        await present.type_precent.remove(present.type_precent[0])
        await present.type_precent.add(type_precent)

    if form_precent_id:
        form_precent = await FormPresent.objects.get_or_none(
                                        id=form_precent_id
                                        )
        await present.form_precent.remove(present.form_precent[0])
        await present.form_precent.add(form_precent)

    if reason_for_precent_id:
        reason_for_precent = await Reason.objects.get_or_none(
                                    id=reason_for_precent_id
                                    )
        await present.reason_for_precent.remove(
                    present.reason_for_precent[0]
                    )
        await present.reason_for_precent.add(reason_for_precent)
        
    return await get_all()
    


@precent_router.delete('/{id}')
async def delete_one(id: int, admin = Depends(jwt_auth)):
    try:
        product = await Present.objects.get_or_none(id=id)
        await product.delete()
        return await get_all()
    except:
        pass
 


@precent_router.get('/filter/all')
async def get_all_filter():
    categories = await Categories.objects.all()
    form_precent = await FormPresent.objects.all()
    type_precent = await TypePresent.objects.all()
    reason_for_precent = await Reason.objects.all()
    data = {
        'categories':categories,
        'form_precent':form_precent,
        'type_precent':type_precent,
        'reason_for_precent':reason_for_precent 
    }
    json_compatible_item_data = jsonable_encoder(data)
    return JSONResponse(
    status_code=200,
    content=json_compatible_item_data
    )
