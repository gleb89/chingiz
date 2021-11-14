present_comment:
	docker-compose run present_api  alembic revision --autogenerate -m "New Migration" 
present_migrate:
	docker-compose run present_api alembic upgrade head

present_error:
	docker-compose run present_api alembic stamp head

present_merge:
	docker-compose run present_api alembic merge heads


couriers_comment:
	docker-compose run courier_api  alembic revision --autogenerate -m "New Migration" 
couriers_migrate:
	docker-compose run courier_api alembic upgrade head

couriers_error:
	docker-compose run courier_api alembic stamp head

couriers_merge:
	docker-compose run courier_api alembic merge heads

run_dev:
	docker-compose --file docker-compose.dev.yml up 
