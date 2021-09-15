from typing import List

from fastapi import WebSocket, APIRouter, WebSocketDisconnect
from fastapi.encoders import jsonable_encoder

from models.present import Present
from logics.basket import *


socket_rout = APIRouter()


class ConnectionManager:
    def __init__(self):
        self.active_connections: List[WebSocket] = []

    async def connect(self, websocket: WebSocket):
        await websocket.accept()
        self.active_connections.append(websocket)

    def disconnect(self, websocket: WebSocket):
        self.active_connections.remove(websocket)

    async def send_personal_message(self, message, websocket: WebSocket):
        await websocket.send_json(message)

    async def broadcast(self, message):
        for connection in self.active_connections:
            await connection.send_json(message)


manager = ConnectionManager()


@socket_rout.websocket("/ws/present/search")
async def websocket_endpoint(websocket: WebSocket):
    product_search = await Present.objects.select_related(
        ["category","form_precent","type_precent","reason_for_precent"]
    ).all()
    await manager.connect(websocket)
    try:
        while True:
            data = await websocket.receive_text()
            await manager.send_personal_message(jsonable_encoder(
                [i for i in product_search if data.lower() in i.name_precent.lower()]
            ), websocket)
    except WebSocketDisconnect:
        manager.disconnect(websocket)



#basket
@socket_rout.websocket("/ws/present/basket")
async def websocket_endpoint_basket(websocket: WebSocket):
    await manager.connect(websocket)
    try:
        while True:
            data = await websocket.receive_json()
            if data.get('message') == 'remove_all':
                data_for_client = await remove_present_in_basket(
                    data.get('basket_id'),
                    data.get('present_id'),
                    data.get('clear')
                )
                await manager.send_personal_message(data_for_client, websocket)
            if data.get('message') == 'remove_one':
                data_for_client = await remove_present_in_basket(
                    data.get('basket_id'),
                    data.get('present_id')
                )
                await manager.send_personal_message(data_for_client, websocket)
            if data.get('message') == 'add_count':
                data_for_client = await count_present_in_basket(
                    data.get('basket_id'),
                    data.get('present_id')
                )
                await manager.send_personal_message(data_for_client, websocket)

            if data.get('message') == 'remove_count':
                data_for_client = await remove_count_present_in_basket(
                    data.get('basket_id'),
                    data.get('present_id')
                )
                await manager.send_personal_message(data_for_client, websocket)
    except WebSocketDisconnect:
        manager.disconnect(websocket)
