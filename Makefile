start:
	docker-compose -f docker-compose.dev.yml up -d

run:
	@docker-compose -f docker-compose.dev.yml exec app python3 src/manage.py runserver 0.0.0.0:8000 --settings config.settings.dev

stop:
	docker-compose -f docker-compose.dev.yml down