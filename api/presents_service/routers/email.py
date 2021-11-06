import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

from fastapi import (
    APIRouter, 
    BackgroundTasks, 
    UploadFile, File, 
    Form, 
    Query,
    Body,
    Depends
)

from shemas import email
from config.config_cls import settings
from logics.emailfile import file_add


app = APIRouter(
    prefix="/api/v1/present/email",
    tags=["Email"],
)



def send_message_mail(email,message):
    msg = MIMEMultipart('alternative')
    msg['Subject'] = "Оформление заказа"
    msg['From'] = 'info@giftcity.kz'
    msg['To'] = email
    part2 = MIMEText(message, 'html')
    msg.attach(part2)
    mail = smtplib.SMTP('smtp.mail.ru', 587)
    mail.ehlo()
    mail.starttls()
    mail.login('info@giftcity.kz', settings.email_password)
    mail.sendmail('info@giftcity.kz', email, msg.as_string())
    mail.quit()

def send_message_contact(email,message):
    msg = MIMEMultipart('alternative')
    msg['Subject'] = "Письмо из раздела контакты"
    msg['From'] = 'info@giftcity.kz'
    msg['To'] = email
    part2 = MIMEText(message, 'html')
    msg.attach(part2)
    mail = smtplib.SMTP('smtp.mail.ru', 587)
    mail.ehlo()
    mail.starttls()
    mail.login('info@giftcity.kz', settings.email_password)
    mail.sendmail('info@giftcity.kz', email, msg.as_string())
    mail.quit()

def get_html_contact(data):
    
    

    style = """
    <style>

        .header{
            max-width: 100%;
            min-height: 20vh;
            padding: 1em;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .header img{
            max-width: 100%;
        }
        .text-email{
            min-height: 60vh;
            max-width: 100%;
            padding: 1em;
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
        }
        .detail{
            font-size: 1.3em;
            font-weight: bold;
        }
  
        h3{
            
        }
        .text-detail{
        
        
        }
        span{
            font-size: 1.2em;
            font-weight: bold;
        }
    </style>
    """
    # </html>
    # '''.format(**locals())
    html = '''\
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width"/>
        <style type="text/css">
            {style}
        </style>
    </head>
    <body>
        <div class="header">
            <img src="https://giftcity.kz/logo.png" alt="">
        </div>
        <div class="text-email">
            <h3>Здравствуйте ,Уважаемый(ая) администратор!</h3>
            
            <h4>Новое сообщение от клиента из раздела Контакты</h4>
            
            <div class="text-detail">
                <p class="detail">Детали сообщения :</p>
                <p><span>Имя клиента: </span> {data.name}</p>
                <p><span>Телефон клиента: </span> {data.phone}</p>
                <h5><span>Cообщение клиента : </span> {data.text}</h5>
            </div>
            <div>
                <p>Благодарим за доверие к нашему сервису!</p>
            </div>
        </div>
    </body>

    </html>
    '''.format(**locals())
    return html

@app.post('/contact')
def send_message_contact(data:email.EmailContact):
    message = get_html_contact(data)
    me_email = "info@giftcity.kz"
    send_message_contact(me_email, message)
    return True


@app.post('/commands')
def send_message_commands(
    name: str = Form(...),
    email: str = Form(...),
    phone: str = Form(...),
    text: str = Form(None),
    fileres: UploadFile = File(None),
):
    if fileres:
        name_file = file_add(fileres)
    else:
        name_file = 'Не загружено'

    if not text:
        text = 'Текст не указан'

    style = """
    <style>

        .header{
            max-width: 100%;
            min-height: 20vh;
            padding: 1em;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .header img{
            max-width: 100%;
        }
        .text-email{
            min-height: 60vh;
            max-width: 100%;
            padding: 1em;
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
        }
        .detail{
            font-size: 1.3em;
            font-weight: bold;
        }
  
        h3{
            
        }
        .text-detail{
        
        
        }
        span{
            font-size: 1.2em;
            font-weight: bold;
        }
    </style>
    """
    # </html>
    # '''.format(**locals())
    html = '''\
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width"/>
        <style type="text/css">
            {style}
        </style>
    </head>
    <body>
        <div class="header">
            <img src="https://giftcity.kz/logo.png" alt="">
        </div>
        <div class="text-email">
            <h3>Здравствуйте ,Уважаемый(ая) администратор!</h3>
            
            <h4>Новое сообщение от клиента из раздела Хочу в команду</h4>
            
            <div class="text-detail">
                <p class="detail">Детали сообщения :</p>
                <p><span>Имя клиента: </span> {name}</p>
                <p><span>Телефон клиента: </span> {phone}</p>
                <p><span>Email клиента: </span> {email}</p>
                <h5><span>Ссылка на прикрепленное резюме : </span> {name_file}</h5>
                <h5><span>Текст комментария : </span> {text}</h5>
            </div>
            <div>
                <p>Благодарим за доверие к нашему сервису!</p>
            </div>
        </div>
    </body>

    </html>
    '''.format(**locals())
    msg = MIMEMultipart('alternative')
    msg['Subject'] = "Письмо из раздела хочу в команду"
    msg['From'] = 'info@giftcity.kz'
    msg['To'] = 'info@giftcity.kz'
    part2 = MIMEText(html, 'html')
    msg.attach(part2)
    mail = smtplib.SMTP('smtp.mail.ru', 587)
    mail.ehlo()
    mail.starttls()
    mail.login('info@giftcity.kz', settings.email_password)
    mail.sendmail('info@giftcity.kz', 'info@giftcity.kz', msg.as_string())
    mail.quit()

def send_me_html(oplata_data):
    summa = '{0:,}'.format(oplata_data.summa).replace(',', ' ')
    date = oplata_data.data_dostavki
    adress_user = oplata_data.adress_user
    phone = oplata_data.phone_user
    if oplata_data.fiz_oplata:
        oplata = 'Оплата физическим лицом'
        oplata_data_method = oplata_data.oplata_user 
      
    if oplata_data.ur_oplata:
        oplata = 'Оплата Юридическим лицом'
        name_user = oplata_data.name_user
        oplata_data_method = 'Оплата по выставленному счету'
    

    style = """
    <style>

        .header{
            max-width: 100%;
            min-height: 20vh;
            padding: 1em;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .header img{
            max-width: 100%;
        }
        .text-email{
            min-height: 60vh;
            max-width: 100%;
            padding: 1em;
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
        }
        .detail{
            font-size: 1.3em;
            font-weight: bold;
        }
  
        h3{
            
        }
        .text-detail{
        
        
        }
        span{
            font-size: 1.2em;
            font-weight: bold;
        }
    </style>
    """
    html = """
        <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
        <html xmlns="http://www.w3.org/1999/xhtml">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <meta name="viewport" content="width=device-width"/>
            <style type="text/css">
                {style}
            </style>
        </head>
        <body>
            <div class="header">
                <img src="https://giftcity.kz/logo.png" alt="">
            </div>
            <div class="text-email">
                <h3>Здравствуйте ,Уважаемый(ая) администратор!</h3>
                <h3>Поступил новый зказ</h3>
                <h4>Номер заказа EL-{oplata_data.id}</h4>
                <p class="detail">Детали заказа :</p>
                {rows_present}
                <p >Сумма итого: <span style="font-weight: 600;"> {summa} тг </span></p>
               
                <div class="text-detail">
                <p style="font-size:1em">Дата доставки:  <span style="font-weight: 600;"> {date}</span></p>
                <p style="font-size:1em">Адрес доставки:<span style="font-weight: 600;">  {adress_user}</span></p>
                <p style="font-size:1em">Имя заказчика:<span style="font-weight: 600;">  {oplata_data.name_user}</span></p>
                <p style="font-size:1em">Номер телефона:<span style="font-weight: 600;">  {phone}</span></p>
                 <p style="font-size:1em">Метод оплаты:<span style="font-weight: 600;">  {oplata_data_method}</span></p>
                  <p style="font-size:1em">Статус:<span style="font-weight: 600;">  {oplata}</span></p>
                </div>
                <div>
                    <p>Удачи в бизнесе!</p>
                    <p>Подарки в каждый дом!</p>
                </div>
            </div>
        </body>

        </html>
        """
    rows_present = ""
    for present in oplata_data.history:
        # image = present['image_precent']
        image = 'v1/present/static/images/2021-11-0118:21:20.938081.webp'
        articul = present['id']
        name = present['name_precent']
        count = present['count']
        price = present['price']
        price = "{:,}".format(price).replace(',', ' ')
        prevu = present['prevue_name']
        # <img style="width:70px;" src="+{image}+" alt="">
        item =  '''
                        <div style="display:flex;justify-content: space-between;align-items: center;">
                        <div style="min-width:40%">
                        <img style="width:70px;" src={image} alt="">
                
                        </div>
                        <div>
                        <p style="font-weight: 600;">{prevu}</p>
                        <p>Артикул:<span style="font-weight: 600;">{articul}</span></p>
                        <p><span>Название:</span><span style="font-weight: 600;"> {name}</span></p>
                        <p><span>Количество:</span><span style="font-weight: 600;"> {count}</span></p>
                        <p><span>Цена:</span><span style="font-weight: 600;"> {price} тг</span></p>
                        
                        </div>

                        </div>
                           <hr style="   border: none; /* Убираем границу для браузера Firefox */
                        color: orange; /* Цвет линии для остальных браузеров */
                        background-color: orange; /* Цвет линии для браузера Firefox и Opera */
                        height: 1px; ">
                    '''.format(**locals())
        rows_present = rows_present + item
    html = html.format(**locals())
    
    return html
   

def get_html(oplata_data):
    summa = '{0:,}'.format(oplata_data.summa).replace(',', ' ')
    date = oplata_data.data_dostavki
    adress_user = oplata_data.adress_user
    style = """
    <style>
        .header{
            max-width: 100%;
            min-height: 20vh;
            padding: 1em;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .header img{
            max-width: 100%;
        }
        .text-email{
            min-height: 60vh;
            max-width: 100%;
            padding: 1em;
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
        }
        .detail{
            font-size: 1.3em;
            font-weight: bold;
        }
  
        h3{
            
        }
        .text-detail{
        
        
        }
        span{
            font-size: 1.2em;
            font-weight: bold;
        }
    </style>
    """

    html = """
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width"/>
        <style type="text/css">
            {style}
        </style>
    </head>
    <body>
        <div class="header">
            <img src="https://giftcity.kz/logo.png" alt="">
        </div>
        <div class="text-email">
            <h3>Здравствуйте ,Уважаемый(ая) {oplata_data.name_user}!</h3>
            
            <h4>Номер заказа EL-{oplata_data.id}</h4>
            
            <div class="text-detail">
                <p class="detail">Детали вашего заказа :</p>
                {rows_present}
                <p >Сумма итого: <span style="font-weight: 600;"> {summa} тг </span></p>
                <p style="font-size:1em"> Счет для оплаты: <span style="font-weight: 600;"></span></p>
                 <p style="font-size:1em">Дата доставки:  <span style="font-weight: 600;"> {date}</span></p>
                <p style="font-size:1em">Адрес доставки:<span style="font-weight: 600;">  {adress_user}</span></p>
            </div>
           
            <div>
                <p>Благодарим за доверие к нашему сервису!</p>
                <p>Подарки в каждый дом!</p>
            </div>
        </div>
    </body>

    </html>
    """
    if oplata_data.oplata_user == 'Оплата при получении' or 'Оплатить картой Visa / Master Card':
        html = """
        <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
        <html xmlns="http://www.w3.org/1999/xhtml">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <meta name="viewport" content="width=device-width"/>
            <style type="text/css">
                {style}
            </style>
        </head>
        <body>
            <div class="header">
                <img src="https://giftcity.kz/logo.png" alt="">
            </div>
            <div class="text-email">
                <h3>Здравствуйте ,Уважаемый(ая) {oplata_data.name_user}!</h3>
                
                <h4>Номер заказа EL-{oplata_data.id}</h4>
                <p class="detail">Детали вашего заказа :</p>
                {rows_present}
                <p >Сумма итого: <span style="font-weight: 600;"> {summa} тг </span></p>
               
                <div class="text-detail">
                     <p style="font-size:1em">Дата доставки:  <span style="font-weight: 600;"> {date}</span></p>
                <p style="font-size:1em">Адрес доставки:<span style="font-weight: 600;">  {adress_user}</span></p>
                
                    <p class="detail">Наш специалист свяжется с вами в ближайшее время! :</p>
                   
                </div>
                <div>
                    <p>Благодарим за доверие к нашему сервису!</p>
                    <p>Подарки в каждый дом!</p>
                </div>
            </div>
        </body>

        </html>
        """
    rows_present = ""
    for present in oplata_data.history:
        # image = present['image_precent']
        image = 'v1/present/static/images/2021-11-0118:21:20.938081.webp'
        articul = present['id']
        name = present['name_precent']
        count = present['count']
        price = present['price']
        price = "{:,}".format(price).replace(',', ' ')
        prevu = present['prevue_name']
        # <img style="width:70px;" src="+{image}+" alt="">
        item =  '''
                        <div style="display:flex;justify-content: space-between;align-items: center;">
                        <div style="min-width:40%">
                        <img style="width:70px;" src={image} alt="">
                
                        </div>
                        <div>
                        <p style="font-weight: 600;">{prevu}</p>
                        <p>Артикул:<span style="font-weight: 600;">{articul}</span></p>
                        <p><span>Название:</span><span style="font-weight: 600;"> {name}</span></p>
                        <p><span>Количество:</span><span style="font-weight: 600;"> {count}</span></p>
                        <p><span>Цена:</span><span style="font-weight: 600;"> {price} тг</span></p>
                        
                        </div>

                        </div>
                           <hr style="   border: none; /* Убираем границу для браузера Firefox */
                        color: orange; /* Цвет линии для остальных браузеров */
                        background-color: orange; /* Цвет линии для браузера Firefox и Opera */
                        height: 1px; ">
                    '''.format(**locals())
        rows_present = rows_present + item
    html = html.format(**locals())
    
    return html



@app.post("/email")
def simple_send(
    email: str,
    oplata_data
    ) :
    me_email = "info@giftcity.kz"
    send_html = get_html(oplata_data)
    send_message_mail(email, send_html)
    send_me = send_me_html(oplata_data)
    send_message_mail(me_email,send_me)
    return 'ok'

   