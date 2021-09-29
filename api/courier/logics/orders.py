import shutil
import datetime
host = 'http://localhost:8080'
# host = 'http://82.148.17.12:8080'

async def image_add(image):
    data = str(datetime.datetime.now()).replace(" ", "")
    image_name = image.filename = f'{data}.jpg'
    with open(f"static/images/{image_name}", "wb") as buffer:
        shutil.copyfileobj(image.file, buffer)
        photo = f'{host}/api/v1/couriers/static/images/{image_name}'
    return photo