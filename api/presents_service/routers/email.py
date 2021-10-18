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
from starlette.responses import JSONResponse
from starlette.requests import Request
from fastapi_mail import FastMail, MessageSchema,ConnectionConfig
from pydantic import EmailStr, BaseModel
from typing import List
from fastapi_mail.email_utils import DefaultChecker

class EmailSchema(BaseModel):
    email: List[EmailStr]


conf = ConnectionConfig(
    MAIL_USERNAME = "",
    MAIL_PASSWORD = "Ch123456#",
    MAIL_FROM = "info@giftcity.kz",
    MAIL_PORT = 587,
    MAIL_SERVER = "smtp.mail.ru",
    MAIL_FROM_NAME="Подарки",
    MAIL_TLS = True,
    MAIL_SSL = False,
    USE_CREDENTIALS = False,
    VALIDATE_CERTS = True
)

app = APIRouter(
    prefix="/api/v1/present/email",
    tags=["Email"],
)


html = """
<p>Hi this test mail, thanks for using Fastapi-mail</p> 
"""


@app.post("/email")
async def simple_send(
    email: EmailSchema
    ) -> JSONResponse:

    message = MessageSchema(
        subject="Fastapi-Mail module",
        recipients=email.dict().get("email"),  # List of recipients, as many as you can pass 
        body=html,
        subtype="html"
        )

    fm = FastMail(conf)
    await fm.send_message(message)
    return JSONResponse(status_code=200, content={"message": "email has been sent"})