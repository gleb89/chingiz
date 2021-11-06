from typing import Optional
import asyncio
import re
import json

from fastapi import APIRouter, File, UploadFile, Depends, Form
from fastapi.responses import JSONResponse
from fastapi.encoders import jsonable_encoder
import aioredis

from models.present import Present
from models.category import Categories
from models.form_precent import FormPresent
from models.reason_for_precent import Reason
from models.type_present import TypePresent
from logics.precents import image_add
from models.subcategories import SubCategories
from logics.jwt_token import jwt_auth
from logics.category import image_delete



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
    category_id:list = Form(None),
    form_precent_id: str = Form(None),
    type_precent_id: str = Form(None),
    reason_for_precent_id: list = Form(...),
    sub_list_id: list = Form(None),
    body :str = Form(None),
    image: UploadFile = File(...),
  
    ):
    if not  body:
        body = ''
    else:
        body = body
    if not  composition:
        composition = ''
    else:
        composition = composition
    origin_image, dubl_image = await image_add(image)
    if not prevue_name:
        prevue_name = ''
    new_present = await Present.objects.create(
        prevue_name = prevue_name,
        name_precent = name_precent,
        price = price,
        composition = composition,
        image_precent = dubl_image,
        image_origin = origin_image,
        body = body,
        popular = 0
        
    )


    if type_precent_id:
        type_precent = await TypePresent.objects.get_or_none(id=type_precent_id)
        await new_present.type_precent.add(type_precent)
    
    if form_precent_id:
        form_precent = await FormPresent.objects.get_or_none(id=form_precent_id)
        await new_present.form_precent.add(form_precent)
  

    if sub_list_id:
        list_id_sub = re.findall(r'\d+', sub_list_id[0])
        list_id_sub = [int(i) for i in list_id_sub]
        for sub_id in list_id_sub:
            subcategory = await SubCategories.objects.get(id = sub_id)
            await new_present.subcategory.add(subcategory)

    list_id_category = re.findall(r'\d+', category_id[0])
    list_id_category = [int(i) for i in list_id_category]
    for id_category in list_id_category:
        category = await Categories.objects.get_or_none(id=id_category)
        await new_present.category.add(category)
    
    list_id_reason = re.findall(r'\d+', reason_for_precent_id[0])
    list_id_reason = [int(i) for i in list_id_reason]
    for reason_id in list_id_reason:
        reason_for_precent = await Reason.objects.get_or_none(id=reason_id)
        await new_present.reason_for_precent.add(reason_for_precent)
    await new_present.update(sort_id_catalog = new_present.id)
    return new_present


#
@precent_router.post('/add-image')
async def add_image(
    id: int,
    image: UploadFile = File(...),
    
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
async def get_all_admin():

    presents =  await Present.objects.prefetch_related(
            [
                "category__subcategory",
                "form_precent",
                "subcategory",
                "type_precent",
                "reason_for_precent"
            ]
            ).exclude_fields(
    [
        'presentformpresent',
        'presenttypepresent',
        'presentcategories',
        'presentreason',
        'presentsubcategories'
        ]).order_by("sort_id_catalog").all()
    return presents 


@precent_router.get('/catalog')
async def get_all_catalog():
    redis = await aioredis.Redis.from_url("redis://redis", max_connections=10, decode_responses=True)
    cache = await redis.get('presents_list')

    if cache :
        return json.loads(cache)
    else:
      
        presents = await Present.objects.prefetch_related(
            [
            "category",
            "form_precent",
            "subcategory",
            "type_precent",
            "reason_for_precent"
            ]
            ).exclude_fields(
            [
            'presentformpresent',
            'presenttypepresent',
            'presentcategories',
            'presentreason',
            'presentsubcategories'
            ]).order_by("sort_id_catalog").all()

            # await redis.set('presents_list',json.dumps(presents,default=jsonable_encoder) ,ex=360)
            # await redis.close()
        return presents


@precent_router .get('/{id}')
async def get_one(id: int):
    return await Present.objects.prefetch_related(
            [
                "category__subcategory",
                "form_precent",
                "subcategory",
                "type_precent",
                "reason_for_precent"
            ]
            ).exclude_fields(
    [
        'presentformpresent',
        'presenttypepresent',
        'presentcategories',
        'presentreason',
        'presentsubcategories'
        ]).get_or_none(id=id)


@precent_router.put('/{id}') 
async def update_one(
    id:int,
    prevue_name: str = Form(None),
    name_precent: str = Form(None),
    price: int = Form(None),
    composition: str = Form(None),
    category_id: list = Form(...),
    form_precent_id: int = Form(None),
    type_precent_id: int= Form(None),
    body: str = Form(None),
    reason_for_precent_id: list = Form(...),
    sub_list_id: list = Form(None),
    image: UploadFile = File(None),
    # admin = Depends(jwt_auth)

    ):
    present = await Present.objects.prefetch_related(
            [
                "category__subcategory",
                "form_precent",
                "subcategory",
                "type_precent",
                "reason_for_precent"
            ]
            ).exclude_fields(
    [
        'presentformpresent',
        'presenttypepresent',
        'presentcategories',
        'presentreason',
        'presentsubcategories'
        ]).get_or_none(id=id)
    if image:
        try:
            await image_delete(present.image_precent)
        except:
            pass
        origin_image, dubl_image = await image_add(image)
        await present.update(
                    image_precent = dubl_image
        )
        await present.update(
            image_origin = origin_image,
        )
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
        list_id_category = re.findall(r'\d+', category_id[0])
        list_id_category = [int(i) for i in list_id_category]
        await present.category.clear()
        for id_category in list_id_category:
            category = await Categories.objects.get_or_none(id=id_category)
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

    if sub_list_id:
        list_id_sub = re.findall(r'\d+', sub_list_id[0])
        list_id_sub = [int(i) for i in list_id_sub]
        await present.subcategory.clear()
        for sub_id in list_id_sub:
            subcategory = await SubCategories.objects.get(id = sub_id)
            await present.subcategory.add(subcategory)
    else:
        await present.subcategory.clear()

        
        
    return await get_one(id)
    


@precent_router.delete('/{id}')
async def delete_one(id: int):
    try:
        product = await Present.objects.get_or_none(id=id)
        await image_delete(product.image_precent)
        await product.delete()
        return True
    except:
        pass
 
@precent_router.post('/addsubcategory/{id}')
async def add_subcategory(id:int, sub_list_id: list = Form(None)):
    present =  await Present.objects.select_related(
        [
            "category",
            "form_precent",
            "type_precent",
            "subcategory",
            "reason_for_precent"
        ]
    ).get_or_none(id=id)
    if not sub_list_id:
        await present.subcategory.clear()
    else:
        list_id_sub = re.findall(r'\d+', sub_list_id[0])
        list_id_sub = [int(i) for i in list_id_sub]
        await present.subcategory.clear()
        for sub_id in list_id_sub:
            subcategory = await SubCategories.objects.get(id = sub_id)
            await present.subcategory.add(subcategory)
    return await get_one(id)


@precent_router.get('/filter/all')
async def get_all_filter():
    categories = await Categories.objects.select_related(
        [
            "subcategory",
        ]
    ).order_by("serial_number").all()
    form_precent = await FormPresent.objects.all()
    type_precent = await TypePresent.objects.all()
    reason_for_precent = await Reason.objects.order_by("serial_number").all()
    subcategories = await SubCategories.objects.all()
    data = {
        'categories':categories,
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

@precent_router.get('/sort/catalog')
async def get_all_sort_catalog():
    return await Present.objects.order_by("sort_id_catalog").all()


@precent_router.put(
    '/update/sort_id_catalog/{id_one}/{id_two}'
    )
async def update_sort_id_catalog(
    id_one:int,
    id_two:int
    ):
    present_one = await Present.objects.get(id = id_one)
    sort_id_catalog_one = present_one.sort_id_catalog
    present_two = await Present.objects.get(id = id_two)
    sort_id_catalog_two = present_two.sort_id_catalog 
    await present_one.update(sort_id_catalog = sort_id_catalog_two)
    await present_two.update(sort_id_catalog = sort_id_catalog_one)
    return await Present.objects.order_by("sort_id_catalog").all()


