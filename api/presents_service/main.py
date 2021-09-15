from fastapi import FastAPI 
from fastapi.staticfiles import StaticFiles
from fastapi.middleware.cors import CORSMiddleware





from config.database import metadata, engine, database
from routers import (
    present,
    type_precent,
    categories,
    form_precent,
    reason_for_precent,
    admin,
    sockets,
    users,
    basket
    )   





origins = [
     "https://zapic.online",
    "http://localhost:3000",
    "http://localhost:8000/socket.io/?EIO=4&transport=polling&t=NjZcSFv",
    "https://testfds.ru"
]


tags_metadata = [{
    "name": "present-api",
    "description": "Api сервиса  present",
}]


app = FastAPI(
    openapi_url="/api/v1/present/openapi.json",
    docs_url="/api/v1/present/docs",
)




# cors настройки!
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)




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

app.mount("/api/v1/present/static", StaticFiles(directory="static"), name="static")

app.include_router(
    present.precent_router  
)
app.include_router(
    type_precent.type_router 
)
app.include_router(
    form_precent.form_router
)
app.include_router(
    categories.categories_router
)
app.include_router(
    reason_for_precent.reason_precent
)
# app.include_router(
#     users.users_route
# )
app.include_router(
    admin.admin_router
)
app.include_router(
    sockets.socket_rout
)
app.include_router(
    users.app
)
app.include_router(
    basket.app
)








