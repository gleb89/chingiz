from fastapi import APIRouter, Depends,File, UploadFile,Form



from models.stocks import Stocks
from logics.category import image_add

app = APIRouter(
    prefix="/api/v1/present/stocks",
    tags=["Акции"],

)


@app.post('/')
async def create(
    name_stock: str = Form(...),
    body_stock: str = Form(...),
    conditions: str = Form(...),
    image: UploadFile = File(...),
    ):
    image = await image_add(image)
    stock = await Stocks.objects.create(
            name_stock = name_stock,
            body_stock = body_stock,
            conditions = conditions,
            image =  image,
    )
    return stock



@app.get('/')
async def get_all():
    return await Stocks.objects.all()


@app.get('/{id}')
async def get_one(id: int):
    return await Stocks.objects.get_or_none(id=id)


@app.post('/update/{id}')
async def update_one(
    id:int,
    name_stock: str = Form(None),
    body_stock: str = Form(None),
    conditions: str = Form(None),
    image: UploadFile = File(None),
    ):
    stock = await Stocks.objects.get_or_none(id=id)
    if name_stock:
        await stock.update(name_stock = name_stock)
    if body_stock:
        await stock.update(body_stock = body_stock)
    if conditions:
        await stock.update(conditions = conditions)
    if image:
        image = await image_add(image)
        await stock.update(image = image)
    return await Stocks.objects.all()


@app.delete('/{id}')
async def delete_one(id: int):
    try:
        stock = await Stocks.objects.get(id=id)
        return await stock.delete()
    except:
        pass
    return await Stocks.objects.all()