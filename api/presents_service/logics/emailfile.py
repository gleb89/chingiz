import shutil
import datetime
# host = 'http://giftcity.kz:8080'
host = 'http://giftcity.kz'

def file_add(files):
    with open(f"static/images/{files.filename}", "wb") as buffer:
        shutil.copyfileobj(files.file, buffer)
        file_name_link  = f'{host}/api/v1/present/static/images/{files.filename}'
    return file_name_link