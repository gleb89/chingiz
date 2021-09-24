from fastapi import APIRouter

from models.coments import Comments
from models.users import Users
from models.bonus import Bonus


comment_router = APIRouter(
    prefix="/api/v1/present/comments",
    tags=["Коментарии для подарков"],
)


@comment_router.post('/')
async def create(newcomment:Comments):
    try:
        user_for_email = await Users.objects.get_or_none(email = newcomment.email_user)
        user_for_phone = await Users.objects.get_or_none(phone = newcomment.phone_user)
    except:
        user_for_email = None
        user_for_phone = None
    if user_for_phone:
        user_id = user_for_phone.id
        if not user_for_phone.email:
            await user_for_phone.update(email = newcomment.email_user)
        user = user_for_phone
        user_for_phone = 1
        if not user.firstname:
            await user.update(firstname = newcomment.name_user)
        await user.update(points = user.points + 50)
    if user_for_email:
        user_id = user_for_email.id
        if not user_for_email.phone:
            await user_for_email.update(phone = newcomment.phone_user)
        user = user_for_email
        user_for_email = 1
        if not user.firstname:
            await user.update(firstname = newcomment.name_user)
        await user.update(points = user.points + 500)
    if not user_for_email and not user_for_phone:
        user_id = newcomment.user_id
    comment = await Comments(
        present_id = newcomment.present_id,
        user_id = user_id,
        email_user = newcomment.email_user,
        name_user = newcomment.name_user,
        phone_user = newcomment.phone_user,
        body = newcomment.body
        ).save()
    await Bonus(
        user_fairbase_id = user.uid_firebase,
        count_points = 500,
        enum_povod = f'отзыв на сайте',
        summ_check = 0,
        ).save()
    return comment



@comment_router.get('/all/{present_id}')
async def get_all_comments_for_id_present(present_id):
    return  await Comments.objects.filter(present_id = present_id).all()


@comment_router.get('/')
async def get_all():
    return  await Comments.objects.all()