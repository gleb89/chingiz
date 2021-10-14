import shutil
import datetime
# host = 'http://giftcity.kz:8080'
host = 'http://giftcity.kz'

async def image_add(image):
    data = str(datetime.datetime.now()).replace(" ", "")
    image_name = image.filename = f'{data}.jpg'
    with open(f"static/images/{image_name}", "wb") as buffer:
        shutil.copyfileobj(image.file, buffer)
        image_product = f'{host}/api/v1/present/static/images/{image_name}'
    return image_product