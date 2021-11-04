from fastapi import FastAPI 
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles


from config.database import metadata, engine, database
from routers import (
    couriers,
    orders
    )   


origins = [
     "https://giftcity.kz/",
     "https://giftcity.kz/",
    "https://giftcity.kz:3000",
    "https://el-bazaar.kz"
]


tags_metadata = [{
    "name": "courirs-api",
    "description": "Api сервиса  курьеры",
}]


app = FastAPI(
    openapi_url="/api/v1/couriers/openapi.json",
    docs_url="/api/v1/couriers/docs",
)


# cors настройки!
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


app.mount("/api/v1/couriers/static", StaticFiles(directory="static"), name="static")

metadata.create_all(engine)

app.state.database = database


@app.on_event("startup")
async def startup() -> None:
    database_ = app.state.database
    if not database_.is_connected:
        await database_.connect()


@app.on_event("shutdown")
async def shutdown() -> None:
    database_ = app.state.database
    if database_.is_connected:
        await database_.disconnect()



app.include_router(
    couriers.couriers_router 
)
app.include_router(
    orders.orders_router 
)



