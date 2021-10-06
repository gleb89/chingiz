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
        new_category = Categories.objects.create(
            name_category=category_name,
            slug_category = "".join(category_name.split()),
            icon = icon
            )
        return await new_category


@categories_router.get('/')
async def get_all():
    return await Categories.objects.all()


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
    return await Categories.objects.get_or_none(id=id)


@categories_router.delete('/{id}')
async def delete(id: int,admin = Depends(jwt_auth)):
    category = await Categories.objects.get_or_none(id=id)
    try:
        await category.delete()
        return {'message': 'delete true'}
    except:
        return {'message': 'not category'}
