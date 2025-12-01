.PHONY: help dev-up dev-down dev-logs prod-up prod-down prod-logs clean

help:
	@echo "Available commands:"
	@echo "  make dev-up       - Start development environment"
	@echo "  make dev-down     - Stop development environment"
	@echo "  make dev-logs     - View development logs"
	@echo "  make prod-up      - Start production environment"
	@echo "  make prod-down    - Stop production environment"
	@echo "  make prod-logs    - View production logs"
	@echo "  make clean        - Remove all containers, volumes, and images"

dev-up:
	docker-compose -f docker/compose.development.yaml --env-file .env up -d --build

dev-down:
	docker-compose -f docker/compose.development.yaml --env-file .env down

dev-logs:
	docker-compose -f docker/compose.development.yaml --env-file .env logs -f

prod-up:
	docker-compose -f docker/compose.production.yaml --env-file .env up -d --build

prod-down:
	docker-compose -f docker/compose.production.yaml --env-file .env down

prod-logs:
	docker-compose -f docker/compose.production.yaml --env-file .env logs -f

clean:
	docker-compose -f docker/compose.development.yaml --env-file .env down -v --rmi all
	docker-compose -f docker/compose.production.yaml --env-file .env down -v --rmi all
