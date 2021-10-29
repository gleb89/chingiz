import shutil
import datetime
# host = 'https://giftcity.kz:8080'
host = 'https://giftcity.kz'

async def image_add(image):
    data = str(datetime.datetime.now()).replace(" ", "")
    image_name = image.filename = f'{data}.jpg'
    with open(f"static/images/{image_name}", "wb") as buffer:
        shutil.copyfileobj(image.file, buffer)
        avatar  = f'{host}/api/v1/present/static/images/{image_name}'
    return avatar