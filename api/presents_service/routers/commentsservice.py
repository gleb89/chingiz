from fastapi import APIRouter

from models.commentservice import CommentsService
from models.users import Users
from models.bonus import Bonus


comment_router = APIRouter(
    prefix="/api/v1/present/commentsservice",
    tags=["Коментарии к сервису"],
)


@comment_router.post('/')
async def create(newcomment:CommentsService):
    try:
        user_for_email = await Users.objects.get_or_none(email = newcomment.email_user)
        user_for_phone = await Users.objects.get_or_none(phone = newcomment.phone_user)
    except:
        user_for_email = None
        user_for_phone = None
    if user_for_phone:
        await Bonus(
        user_fairbase_id = user_for_phone.uid_firebase,
        count_points = 500,
        enum_povod = f'отзыв на сайте',
        summ_check = 0,
        ).save()
        await user_for_phone.update(points = user_for_phone.points +( user_for_phone.points+500))
        user_id = user_for_phone.id
        if not user_for_phone.email:
            await user_for_phone.update(email = newcomment.email_user)
        user = user_for_phone
        user_for_phone = 1
        if not user.firstname:
            await user.update(firstname = newcomment.name_user)
    if user_for_email:
        await Bonus(
        user_fairbase_id = user_for_email.uid_firebase,
        count_points = 500,
        enum_povod = f'отзыв на сайте',
        summ_check = 0,
        ).save()
        await user_for_email.update(points = user_for_email.points +( user_for_email.points+500))
        user_id = user_for_email.id
        if not user_for_email.phone:
            await user_for_email.update(phone = newcomment.phone_user)
        user = user_for_email
        user_for_email = 1
        if not user.firstname:
            await user.update(firstname = newcomment.name_user)
        
    if not user_for_email and not user_for_phone:
        user_id = newcomment.user_id
    comment = await CommentsService(
        user_id = user_id,
        email_user = newcomment.email_user,
        name_user = newcomment.name_user,
        phone_user = newcomment.phone_user,
        body = newcomment.body
        ).save()

    return comment



@comment_router.get('/')
async def get_all():
    return  await CommentsService.objects.all()

@comment_router.post('/moderation/{comm_id}/{moder}')
async def get_all(comm_id:int,moder:bool):
    comment = await CommentsService.objects.get(id=comm_id)
    return await comment.update(moderation = moder)