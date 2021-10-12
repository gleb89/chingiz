from fastapi import APIRouter, Depends,File, UploadFile,Form



from models.category import Categories
from shemas.categories import CreateCategory
from logics.jwt_token import jwt_auth
from logics.category import image_add

categories_router = APIRouter(
    prefix="/api/v1/present/categories",
    tags=["Категории"],

)


@categories_router.post('/')
async def create(category_name: str,image: UploadFile = File(...),admin = Depends(jwt_auth)):
    if admin:
        icon = await image_add(image)
        new_category = await Categories.objects.create(
            name_category=category_name,
            slug_category = "".join(category_name.split()),
            icon = icon
            )

        await new_category.update(serial_number = new_category.id)
        return new_category

@categories_router.put(
    '/update/serial/{serial_number_one}/{id_one}/{serial_number_two}/{id_two}'
    )
async def update_serial(
    serial_number_one:int,
    id_one:int,
    serial_number_two:int,
    id_two:int
    ):
    category_one = await Categories.objects.get(id = id_one)
    await category_one.update(serial_number = serial_number_one)
    category_two = await Categories.objects.get(id = id_two)
    await category_two.update(serial_number = serial_number_two)
    return await Categories.objects.order_by("serial_number").all()

@categories_router.get('/')
async def get_all():
    return await Categories.objects.order_by("serial_number").all()


@categories_router.get('/{id}')
async def get_one(id: int):
    return await Categories.objects.get_or_none(id=id)


@categories_router.post('/update/{id}')
async def update_one(
    id:int,
    name_category: str = Form(None),
    image: UploadFile = File(None),
    admin = Depends(jwt_auth)
    ):
    category = await Categories.objects.get_or_none(id=id)
    if image:
        icon = await image_add(image)
        await category.update(icon = icon)
    if name_category:
        await category.update(
            name_category = name_category,
            slug_category = "".join(name_category.split()),
            )
    return await Categories.objects.order_by("serial_number").all()


@categories_router.delete('/{id}')
async def delete(id: int,admin = Depends(jwt_auth)):
    category = await Categories.objects.get_or_none(id=id)
    try:
        await category.delete()
        return {'message': 'delete true'}
    except:
        return {'message': 'not category'}
