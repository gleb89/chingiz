from fastapi import APIRouter, Depends



from models.bonus import Bonus



bonus_router = APIRouter(
    prefix="/api/v1/present/bonus",
    tags=["Бонусы"],

)



async def create_bonus(bonus:Bonus):
    return await bonus.save()


@bonus_router .get('/')
async def get_all():
    return await  Bonus.objects.all()


@bonus_router .get('/{user_google_id}')
async def get_one(user_google_id: str):
    return await  Bonus.objects.filter(user_fairbase_id=user_google_id).all()


