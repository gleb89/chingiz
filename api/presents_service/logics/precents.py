import shutil
import datetime
# host = 'http://giftcity.kz:8080'
host = 'http://giftcity.kz'

import shutil
import datetime
import os

from PIL import Image 
import PIL 

from PIL import ImageFile
ImageFile.LOAD_TRUNCATED_IMAGES = True
# host = 'http://giftcity.kz:8080'
host = 'http://giftcity.kz'

async def image_add(image):
    data = str(datetime.datetime.now()).replace(" ", "")
    image = Image.open(image.file)
    image.save(f'static/images/{data}.webp', format = "WebP", lossless = True)
    return f'{host}/api/v1/present/static/images/{data}.webp'


