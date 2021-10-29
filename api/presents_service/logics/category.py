import shutil
import datetime
import os

from PIL import Image 
import PIL 

from PIL import ImageFile
ImageFile.LOAD_TRUNCATED_IMAGES = True
# host = 'https://giftcity.kz:8080'
host = 'https://giftcity.kz'

async def image_add(image):
    data = str(datetime.datetime.now()).replace(" ", "")
    image = Image.open(image.file)
    image.save(f'static/images/{data}.webp', format = "WebP", quality=20,optimize=True)
    return f'{host}/api/v1/present/static/images/{data}.webp'


async def image_delete(image_name):

    name_image = image_name.split('images/')[-1]
    print(name_image)
    path_dir = 'static/images'
    os.remove(path_dir + '/' + name_image)


    return True

