from fastapi import (
    APIRouter, 
    BackgroundTasks, 
    UploadFile, File, 
    Form, 
    Query,
    Body,
    Depends
)
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText






app = APIRouter(
    prefix="/api/v1/present/email",
    tags=["Email"],
)

def send_me_html(oplata_data):
    summa = '{0:,}'.format(oplata_data.summa).replace(',', ' ')
    if oplata_data.fiz_oplata:
        oplata = 'Оплата физическим лицом'
        oplata_data_method = oplata_data.oplata_user 
    if oplata_data.ur_oplata:
        oplata = 'Оплата Юридическим лицом'
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
            <img src="http://giftcity.kz/logo.png" alt="">
        </div>
        <div class="text-email">
            <h3>Здравствуйте ,Уважаемый(ая) администратор!</h3>
            <h4>Поступил новый заказ</h4>
            <h4>Артикул заказа: {oplata_data.id}</h4>
            
            <div class="text-detail">
                <h3 class="detail">Детали  заказа :</h3>
                <p>Статус лица оплаты: <h4>{oplata}</h4>  </p>
                <p>Сумма итого: <h4> {summa} тг </h4></p>
                <p>Метод оплаты:  <h4>{oplata_data_method}</h4></p>
                <p>Дата доставки: <h4> {oplata_data.data_dostavki}</h4></p>
            </div>
            <div>
                <p>Удачи в бизнесе!</p>
                <p>Подарки в каждый дом!</p>
            </div>
        </div>
    </body>

    </html>
    '''.format(**locals())
    return html

def get_html(oplata_data):
    summa = '{0:,}'.format(oplata_data.summa).replace(',', ' ')
    

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
            <img src="http://giftcity.kz/logo.png" alt="">
        </div>
        <div class="text-email">
            <h3>Здравствуйте ,Уважаемый(ая) {oplata_data.name_user}!</h3>
            
            <h4>Номер заказа EL-{oplata_data.id}</h4>
            
            <div class="text-detail">
                <p class="detail">Детали вашего заказа :</p>
                <p><span>Сумма итого: </span> {summa} тг</p>
                <p><span>Счет для оплаты: </span> 89493000029377589</p>
            </div>
            <div>
                <p>Благодарим за доверие к нашему сервису!</p>
            </div>
        </div>
    </body>

    </html>
    '''.format(**locals())
    if oplata_data.oplata_user == 'Оплата при получении':
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
                <img src="http://giftcity.kz/logo.png" alt="">
            </div>
            <div class="text-email">
                <h3>Здравствуйте ,Уважаемый(ая) {oplata_data.name_user}!</h3>
                
                <h4>Номер заказа EL-{oplata_data.id}</h4>
                
                <div class="text-detail">
                    <p class="detail">Наш специалист свяжется с вами в ближайшее время! :</p>
                   
                </div>
                <div>
                    <p>Благодарим за доверие к нашему сервису!</p>
                </div>
            </div>
        </body>

        </html>
        '''.format(**locals())
    return html
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
    mail.login('info@giftcity.kz', "Ch123456#")
    mail.sendmail('info@giftcity.kz', email, msg.as_string())
    mail.quit()

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