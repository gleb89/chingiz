from fastapi import APIRouter, Depends,File, UploadFile,Form



from models.users import Users
from models.insta import Insta
from models.bonus import Bonus
from routers.email import simple_send_insta



app = APIRouter(
    prefix="/api/v1/present/insta",
    tags=["Отметка инстаграмм"],
)
@app.get('/')
async def geall():
  
    return await Insta.objects.prefetch_related(
            [
                "self_user",
            ]
            ).all()


@app.post('/{fairbase_id}')
async def create(fairbase_id:str,insta_link: str = Form(None)):
    user =  await Users.objects.prefetch_related(
            [
                "insta"
            ]
            ).get_or_none(uid_firebase=fairbase_id)
    insta = await Insta(link = insta_link).save()
    await user.insta.add(insta)
    insta = await Insta.objects.prefetch_related(
            [
                "self_user",
            ]
            ).get(id = insta.id)
    simple_send_insta(insta)
    return user

@app.post('/bonus/{fairbase_id}/{insta_id}')
async def create(fairbase_id:str,insta_id:int):
    insta = await Insta.objects.prefetch_related(
            [
                "self_user",
            ]
            ).get(id = insta_id)
    await insta.update(moderation = True)

    user =  await Users.objects.prefetch_related(
            [
                "insta"
            ]
            ).get_or_none(uid_firebase=fairbase_id)

    await Bonus(
        user_fairbase_id = fairbase_id,
        count_points = 500,
        enum_povod = f'Отметка в инстаграм',
        summ_check = 0,
        ).save()
    await user.update(points = user.points+500)
    return await geall()