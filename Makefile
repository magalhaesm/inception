LOGIN   = marcelo
COMPOSE = docker compose -f srcs/docker-compose.yml
VOLUMES = "/home/$(LOGIN)/data"

up:
	mkdir -p $(VOLUMES)/wordpress
	mkdir -p $(VOLUMES)/mariadb
	@$(COMPOSE) up -d --build --remove-orphans

down:
	@$(COMPOSE) down

start:
	@$(COMPOSE) start

stop:
	@$(COMPOSE) stop

clean:
	docker system prune --all --force --volumes

.PHONY: up down start stop
