from fastapi import APIRouter, Depends,File, UploadFile,Form



from models.podpicka import Mailing



app = APIRouter(
    prefix="/api/v1/present/mailing",
    tags=["Подписка на рассылку"],
)

@app.get('/')
async def get_all():
    return await Mailing.objects.all()


@app.post('/')
async def create(mailing:Mailing):
    return await mailing.save()