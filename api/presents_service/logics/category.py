import shutil
import datetime
import os
# host = 'http://giftcity.kz:8080'
host = 'http://giftcity.kz'

async def image_add(image):
    data = str(datetime.datetime.now()).replace(" ", "")
    image_name = image.filename = f'{data}.png'
    with open(f"static/images/{image_name}", "wb") as buffer:
        shutil.copyfileobj(image.file, buffer)
        image_product = f'{host}/api/v1/present/static/images/{image_name}'
    return image_product


async def image_delete(image_name):

    name_image = image_name.split('images/')[-1]
    print(name_image)
    path_dir = 'static/images'
    os.remove(path_dir + '/' + name_image)


    return True

