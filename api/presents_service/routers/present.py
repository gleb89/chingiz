from typing import Optional
import asyncio
import re

from fastapi import APIRouter, File, UploadFile, Depends, Form
from fastapi.responses import JSONResponse
from fastapi.encoders import jsonable_encoder


from models.present import Present
from models.category import Categories
from models.form_precent import FormPresent
from models.reason_for_precent import Reason
from models.type_present import TypePresent
from logics.precents import image_add
from models.subcategories import SubCategories
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
    prevue_name: str = Form(None),
    name_precent: str = Form(...),
    price: int = Form(...),
    composition: str = Form(None),
    category_id: str = Form(...),
    form_precent_id: str = Form(None),
    type_precent_id: str = Form(None),
    reason_for_precent_id: list = Form(...),
    subcategory_list_id: list = Form(None),
    body :str = Form(None),
    image: UploadFile = File(...),
    # admin = Depends(jwt_auth)
    ):
    if not  body:
        body = ''
    else:
        body = body
    if not  composition:
        composition = ''
    else:
        composition = composition
    new_image = await image_add(image)
    if not prevue_name:
        prevue_name = ''
    new_present = await Present.objects.create(
        prevue_name = prevue_name,
        name_precent = name_precent,
        price = price,
        composition = composition,
        image_precent = new_image,
        body = body
        
    )
    if subcategory_list_id:
        list_id_subcategory = re.findall(r'\d+', subcategory_list_id[0])
        list_id_subcategory  = [int(i) for i in list_id_subcategory]
        for sub_id in list_id_subcategory:
            subcategory_for_precent = await SubCategories.objects.get_or_none(id=sub_id)
            await new_present.subcategory.add(subcategory_for_precent)

    if type_precent_id:
        type_precent = await TypePresent.objects.get_or_none(id=type_precent_id)
        await new_present.type_precent.add(type_precent)
    
    if form_precent_id:
        form_precent = await FormPresent.objects.get_or_none(id=form_precent_id)
        await new_present.form_precent.add(form_precent)
    category = await Categories.objects.get_or_none(id=category_id)
    await new_present.category.add(category)
    
    list_id_reason = re.findall(r'\d+', reason_for_precent_id[0])
    list_id_reason = [int(i) for i in list_id_reason]
    for reason_id in list_id_reason:
        reason_for_precent = await Reason.objects.get_or_none(id=reason_id)
        await new_present.reason_for_precent.add(reason_for_precent)
    return new_present


#
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
                "category__subcategory",
                "form_precent",
                "subcategory",
                "type_precent",
                "reason_for_precent"
            ]
        ).filter(category__slug_category=slug_category).all()
        
    else:
        presents =  await Present.objects.all()
    return presents 
    


@precent_router .get('/{id}')
async def get_one(id: int):
    return await Present.objects.select_related(
        [
            "category__subcategory",
            "form_precent",
            "type_precent",
            "subcategory",
            "reason_for_precent"
            ]
        ).get_or_none(id=id)


@precent_router.put('/{id}') 
async def update_one(
    id:int,
    prevue_name: str = Form(None),
    name_precent: str = Form(None),
    price: int = Form(None),
    composition: str = Form(None),
    category_id: int= Form(None),
    form_precent_id: int = Form(None),
    type_precent_id: int= Form(None),
    body: str = Form(None),
    reason_for_precent_id: list = Form(...),
    image: UploadFile = File(None),
    # admin = Depends(jwt_auth)

    ):
    present = await Present.objects.select_related(
        [
            "category__subcategory",
            "form_precent",
            "type_precent",
            "subcategory",
            "reason_for_precent"
        ]
    ).exclude_fields("presentreason").get_or_none(id=id)
    if image:
        new_image = await image_add(image)
        await present.update(image_precent = new_image)
    if body:
        await present.update(body= body)
    if not body:
        await present.update(body= '')
    if prevue_name:
        await present.update(prevue_name = prevue_name)
    if name_precent:
        await present.update(name_precent = name_precent)
    if price:
        await present.update(price = price)
    if composition:
        await present.update(composition = composition)
    if not composition:
        await present.update(composition = '')
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
        if present.type_precent:
            await present.type_precent.remove(present.type_precent[0])
        await present.type_precent.add(type_precent)

    if form_precent_id:
        form_precent = await FormPresent.objects.get_or_none(
                                        id=form_precent_id
                                        )
        if present.form_precent:
            await present.form_precent.remove(present.form_precent[0])
        await present.form_precent.add(form_precent)

    if reason_for_precent_id:
        list_id_reason = re.findall(r'\d+', reason_for_precent_id[0])
        list_id_reason = [int(i) for i in list_id_reason]
        await present.reason_for_precent.clear()
        for reason_id in list_id_reason:
            reason_for_precent = await Reason.objects.get_or_none(id=reason_id)
            await present.reason_for_precent.add(reason_for_precent)

        
        
    return await get_one(id)
    


@precent_router.delete('/{id}')
async def delete_one(id: int, admin = Depends(jwt_auth)):
    try:
        product = await Present.objects.get_or_none(id=id)
        await product.delete()
        return True
    except:
        pass
 


@precent_router.get('/filter/all')
async def get_all_filter():
    categories = await Categories.objects.order_by("serial_number").all()
    form_precent = await FormPresent.objects.all()
    type_precent = await TypePresent.objects.all()
    reason_for_precent = await Reason.objects.order_by("serial_number").all()
    subcategories = await SubCategories.objects.all()
    data = {
        'category__subcategory':categories,
        'subcategories':subcategories,
        'form_precent':form_precent,
        'type_precent':type_precent,
        'reason_for_precent':reason_for_precent 
    }
    json_compatible_item_data = jsonable_encoder(data)
    return JSONResponse(
    status_code=200,
    content=json_compatible_item_data
    )

