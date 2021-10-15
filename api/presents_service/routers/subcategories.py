from fastapi import APIRouter, Depends,File, UploadFile,Form



from models.subcategories import SubCategories
from models.category import Categories

from logics.jwt_token import jwt_auth
from logics.category import image_add

app = APIRouter(
    prefix="/api/v1/present/subcategories",
    tags=["Податегории"],

)


@app.post('/')
async def create(name_subcategory: str,id_category:int):
    category = await Categories.objects.get(id = id_category)
    new_subcategory = await SubCategories.objects.create(
        name_subcategory = name_subcategory,
        )
    await category.subcategory.add(new_subcategory)
    return new_subcategory


@app.put('/{id}')
async def create(name_subcategory: str,id:int):
    subcategory = await SubCategories.objects.get(id = id)
    return await subcategory.update(name_subcategory = name_subcategory)




@app.get('/')
async def get_all():
    return await SubCategories.objects.all()


@app.get('/{id}')
async def get_one(id: int):
    return await SubCategories.objects.get_or_none(id=id)


@app.post('/update/{id}')
async def update_one(
    id:int,
    name_subcategory: str,
    admin = Depends(jwt_auth)
    ):
    subcategory = await SubCategories.objects.get_or_none(id=id)
    
    await subcategory.update(
            name_subcategory = name_subcategory,
            )
    return await SubCategories.objects.all()


@app.delete('/{id}')
async def delete(id: int,admin = Depends(jwt_auth)):
    subcategory = await SubCategories.objects.get_or_none(id=id)
    try:
        await subcategory.delete()
        return await SubCategories.objects.all()
    except:
        return {'message': 'not category'}
       