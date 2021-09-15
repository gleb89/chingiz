from fastapi import APIRouter, Depends



from models.category import Categories
from shemas.categories import CreateCategory
from logics.jwt_token import jwt_auth

categories_router = APIRouter(
    prefix="/api/v1/present/categories",
    tags=["Категории"],

)


@categories_router.post('/')
async def create(category: CreateCategory,admin = Depends(jwt_auth)):
    if admin:
        new_category = Categories.objects.create(
            name_category=category.name_category,
            slug_category = "".join(category.name_category.split())
            )
        return await new_category


@categories_router.get('/')
async def get_all():
    return await Categories.objects.all()


@categories_router.get('/{id}')
async def get_one(id: int):
    return await Categories.objects.get_or_none(id=id)


@categories_router.get('/update/{id}')
async def update_one(id:int,name_category:str,admin = Depends(jwt_auth)):
    category = await Categories.objects.get(id=id)
    
    return await category.update(name_category=name_category)


@categories_router.delete('/{id}')
async def delete(id: int,admin = Depends(jwt_auth)):
    category = await Categories.objects.get_or_none(id=id)
    try:
        await category.delete()
        return {'message': 'delete true'}
    except:
        return {'message': 'not category'}
