FROM tiangolo/uvicorn-gunicorn-fastapi:python3.8

WORKDIR /app/presents

COPY . .

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# CMD ["./startup.sh"]