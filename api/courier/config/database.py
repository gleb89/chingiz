import databases
import sqlalchemy


from .settings import settings



URL_DATA_BASE = (
                'postgresql://'
                f'{settings.postgres_user}:'
                f'{settings.postgres_password}'
                '@data_courier33:5432/'
                f'{settings.postgres_db}'
                )

database = databases.Database(URL_DATA_BASE)
engine = sqlalchemy.create_engine(URL_DATA_BASE)
metadata = sqlalchemy.MetaData()