from pydantic import BaseSettings


class Settings(BaseSettings):

    """
    Хранит в себе данные настроек с валидацией 
    Pydantic
    """
    postgres_db:str = None
    postgres_user:str = None
    postgres_password:str = None
    secret_key:str = '8666vbvhbnb00099'
    

    class Config:
        env_file = ".env"
        env_file_encoding = "utf-8"
        env_prefix = "PRODUCTS_"



settings: Settings = Settings()