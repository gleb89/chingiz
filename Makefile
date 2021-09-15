coment:
	sudo docker-compose run present_api alembic revision --autogenerate -m "123First migration"
migrate:
	sudo docker-compose run present_api alembic upgrade head

run_migrate:
	sudo docker-compose run present_api alembic stamp head