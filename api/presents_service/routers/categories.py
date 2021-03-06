from fastapi import APIRouter, Depends,File, UploadFile,Form



from models.category import Categories
from shemas.categories import CreateCategory
from logics.jwt_token import jwt_auth
from logics.category import image_add, image_delete

categories_router = APIRouter(
    prefix="/api/v1/present/categories",
    tags=["Категории"],

)


@categories_router.post('/')
async def create(category_name: str,image: UploadFile = File(...)):
 
    icon = await image_add(image)
    new_category = await Categories.objects.create(
        name_category=category_name,
        slug_category = "".join(category_name.split()),
        icon = icon
        )

    await new_category.update(serial_number = new_category.id)
    return new_category

@categories_router.put(
    '/update/serial/{id_one}/{id_two}'
    )
async def update_serial(
    id_one:int,
    id_two:int
    ):
    category_one = await Categories.objects.get(id = id_one)
    serial_number_one = category_one.serial_number 
    category_two = await Categories.objects.get(id = id_two)
    serial_number_two = category_two.serial_number 
    await category_one.update(serial_number = serial_number_two)
    await category_two.update(serial_number = serial_number_one)
    return await Categories.objects.select_related(
            [
                "subcategory",
            ]
        ).order_by("serial_number").all()

@categories_router.get('/')
async def get_all():
    return await Categories.objects.select_related(
            [
                "subcategory__self_category",
            ]
        ).order_by("serial_number").all()


@categories_router.get('/{id}')
async def get_one(id: int):
    return await Categories.objects.select_related(
            [
                "subcategory",
            ]
        ).get_or_none(id=id)


@categories_router.post('/update/{id}')
async def update_one(
    id:int,
    name_category: str = Form(None),
    image: UploadFile = File(None),
    ):
    category = await Categories.objects.select_related(
            [
                "subcategory",
            ]
        ).get_or_none(id=id)
    
    
    if image:
        try:
            await image_delete(category.icon)
        except:
            pass
        icon = await image_add(image)
        await category.update(icon = icon)
    if name_category:
        await category.update(
            name_category = name_category,
            slug_category = "".join(name_category.split()),
            )
    return await Categories.objects.select_related(
            [
                "subcategory",
            ]
        ).order_by("serial_number").all()


@categories_router.delete('/{id}')
async def delete(id: int):
    category = await Categories.objects.select_related(
            [
                "subcategory",
            ]
        ).get_or_none(id=id)
    
    try:
        
        
        await image_delete(category.icon)
        await category.delete()
        return await Categories.objects.select_related(
            [
                "subcategory",
            ]
        ).order_by("serial_number").all()
    except:
        return {'message': 'not category'}
       
