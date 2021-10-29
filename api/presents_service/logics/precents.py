import shutil
import datetime
# host = 'https://giftcity.kz:8080'
host = 'https://giftcity.kz'

import shutil
import datetime
import os

from PIL import Image 
import PIL 

from PIL import ImageFile
ImageFile.LOAD_TRUNCATED_IMAGES = True
# host = 'https://giftcity.kz:8080'
host = 'https://giftcity.kz'

async def watermark_photo(input_image_path):

    base_image = Image.open(input_image_path)
    watermark = Image.open('static/images/logo4.png')
    width, height = base_image.size
 
    transparent = Image.new('RGBA', (width, height), (0,0,0,0))
    transparent.paste(base_image, (0,0))
    transparent.paste(watermark, (width -180,height-70), mask=watermark)
    transparent.save(input_image_path)
 

async def image_add(image):
    data = str(datetime.datetime.now()).replace(" ", "")
    image = Image.open(image.file)
    image.save(f'static/images/{data}origin.webp', format = "WebP", lossless = True)
    image.save(f'static/images/{data}.webp', format = "WebP", quality=50,optimize=True)
    dubl = f'{host}/api/v1/present/static/images/{data}.webp'
    origin = f'{host}/api/v1/present/static/images/{data}origin.webp'

    await watermark_photo(f'static/images/{data}.webp')
    await watermark_photo(f'static/images/{data}origin.webp')
    return origin, dubl


