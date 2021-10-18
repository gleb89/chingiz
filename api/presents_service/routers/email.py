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


html = """
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div class="header">
        <img src="http://giftcity.kz/logo.png" alt="">
    </div>
    <div class="text-email">
         <h3>Здравствуйте ,Уважаемый(ая) Чингиз!</h3>
         
         <h4>Номер заказа El125</h4>
         
         <div class="text-detail">
            <p class="detail">Детали вашего заказа :</p>
            <p><span>Сумма итого: </span> 56 000 тг</p>
            <p><span>Счет для оплаты: </span> 89493000029377589</p>
         </div>
         <div>
            <p>Благодарим , за доверие к нашему сервису!</p>
         </div>
    </div>

</body>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Raleway:wght@300&display=swap');
    body{
        font-family: 'Raleway', sans-serif;
    }
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
        background-image: url("http://giftcity.kz/bonysball.png");
    }
    .detail{
        font-size: 1.3em;
        font-weight: bold;
    }
    h4{
        text-align: center;
        text-align: center;
        

    }
    h3{
        
    }
    .text-detail{
       
        padding: 1em;
    }
    span{
        font-size: 1.2em;
        font-weight: 600;
    }
</style>
</html>
"""
def send_message_mail(email,message):
    you = email
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
async def simple_send(
    email: str
    ) :
    send_message_mail(email, html)
    return 'ok'