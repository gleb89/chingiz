present_comment:
	docker-compose run present_api  alembic revision --autogenerate -m "New Migration" 
present_migrate:
	docker-compose run present_api alembic upgrade head

present_error:
	docker-compose run present_api alembic stamp head

couriers_comment:
	docker-compose run courier_api  alembic revision --autogenerate -m "New Migration" 
couriers_migrate:
	docker-compose run courier_api alembic upgrade head

couriers_error:
	docker-compose run courier_api alembic stamp head