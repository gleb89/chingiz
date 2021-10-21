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


def get_html_admin(curer_data, oplata_data):

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
            <h3>Здравствуйте ,Уважаемый(ая)  Администратор!</h3>
            <h3>Заказ успешно доставлен курьером!</h3>
            <h4>Номер заказа для доставки EL-{oplata_data.history_id}</h4>
            <h4>ID курьера  ,который доставил -{curer_data.id}</h4>
            <div>
                <p>Благодарим за работу с нашим сервисом!</p>
            </div>
        </div>
    </body>

    </html>
    '''.format(**locals())

    return html


def get_html(curer_data, oplata_data):

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
            <h3>Здравствуйте ,Уважаемый(ая) {curer_data.name}!</h3>
            <h3>Новый заказ для доставки!</h3>
            <h4>Номер заказа для доставки EL-{oplata_data.history_id}</h4>
            
            <div>
                <p>Благодарим за работу с нашим сервисом!</p>
            </div>
        </div>
    </body>

    </html>
    '''.format(**locals())

    return html

def send_message_mail(email,message):
    msg = MIMEMultipart('alternative')
    msg['Subject'] = "Новый  заказ для доставки"
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


def simple_send(
    curer_data,
    oplata_data
    ) :
    send_html = get_html(curer_data,oplata_data)
    send_message_mail(curer_data.email, send_html)
    return 'ok'

def simple_send_admin(
    curer_data,
    order_data
    ) :
    send_html = get_html_admin(curer_data, order_data)
    send_message_mail('info@giftcity.kz', send_html)
    return 'ok'
