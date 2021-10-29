import shutil
import datetime
# host = 'https://giftcity.kz:8080'
host = 'https://giftcity.kz'

def file_add(files):
    data = str(datetime.datetime.now()).replace(" ", "")
    with open(f"static/images/{data}.pdf", "wb") as buffer:
        shutil.copyfileobj(files.file, buffer)
        file_name_link  = f'{host}/api/v1/present/static/images/{data}.pdf'
    return file_name_link