from fastapi.security import OAuth2PasswordBearer

from typing import Optional
from datetime import timedelta
from datetime import datetime


from jose import jwt, JWTError

from models.admin import Admin
from config.config_cls import settings


ACCESS_TOKEN_EXPIRE_MINUTES = 30
ALGORITHM = "HS256"
oauth2_scheme = OAuth2PasswordBearer(tokenUrl="token")

class AdminToken():

    """
    класс для создания и верефикации пользователя
    по JWT токену
    """

    async def create_access_token(
        self,
        password_hash: dict,
        expires_delta: Optional[timedelta] = None
    ):

        """
        Создает JWT токен из id пользователя
        и назначает его время жизни
        """
        
        to_encode = password_hash.copy()
        if expires_delta:
            expire = datetime.utcnow() + expires_delta
        else:
            expire = datetime.utcnow() + timedelta(minutes=60)
        to_encode.update(
            {"exp": expire}
        )
        encoded_jwt = jwt.encode(
            to_encode,
            settings.secret_key,
            algorithm=ALGORITHM)
        return encoded_jwt

    async def token_password(self, password_hash):

        """
        Принимает id пользователя 
        и создает его hash JWT 
        """

        access_token_expires = timedelta(
            minutes=ACCESS_TOKEN_EXPIRE_MINUTES
        )
        access_token = await self.create_access_token(
            {"sub": str(password_hash)},
            expires_delta=access_token_expires
        )
        return access_token, access_token_expires

    
from fastapi.security import OAuth2PasswordBearer
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
from fastapi import Request




class JWTBearer(HTTPBearer):

    """
    Класс верефикации действительности токена по
    id_google пользователя
    """

    def __init__(
        self,
        auto_error: bool = True
        ):
        super(
            JWTBearer,
            self).__init__(
            auto_error=auto_error
            )

    async def __call__(

        self, request: Request
        ):

        """
        Проверяет есть ли такой токен в базе токенов
        """

        credentials: HTTPAuthorizationCredentials = await super(
                            JWTBearer, self
                            ).__call__(
                                request
                                )
        
        if credentials:
            return await self.get_current_user(credentials.credentials)
   

    async def get_current_user(
        self,
        token: str 
        ):

        """
        Принимает токен и конвертирует его в данные пользователя
        """
        
        try:
            payload = jwt.decode(
            token,
            settings.secret_key,
            algorithms=[ALGORITHM])
            password = payload.get(
            "sub"
            )
            return password 
        
        except JWTError:
            return JWTError


jwt_auth = JWTBearer()
admin_token = AdminToken()