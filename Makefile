# ------------------------------------------------------------------------------
# General Configurations

LOGIN   = $(shell grep 'LOGIN=' srcs/.env | cut -d'=' -f2 | xargs)
DOCKER_COMPOSE = docker-compose -f srcs/docker-compose.yml
VOLUMES = "/home/$(LOGIN)/data"

# ------------------------------------------------------------------------------
#  Service Management

up:
	@ mkdir -p "$(VOLUMES)/wordpress" "$(VOLUMES)/mariadb"
	@ $(DOCKER_COMPOSE) up -d --build

down:
	@ $(DOCKER_COMPOSE) down

start:
	@ $(DOCKER_COMPOSE) start

stop:
	@ $(DOCKER_COMPOSE) stop

## Service Shell Access
shell:
	@read -p "=> Enter service: " service; \
	$(DOCKER_COMPOSE) exec -it $$service /bin/bash

## Status and Logs
ps:
	@ $(DOCKER_COMPOSE) ps

logs:
	@ $(DOCKER_COMPOSE) logs

# ------------------------------------------------------------------------------
# Cleanup Section

## Stop and Remove Containers
clean:
	@ $(DOCKER_COMPOSE) down --rmi all --volumes

## Full Cleanup (Remove Images and Volumes)
fclean: clean
	@ sudo rm -rf $(VOLUMES)

## Deep Cleanup (Remove Unused Objects)
prune: fclean
	@ docker system prune --all --force --volumes

.PHONY: up down start stop shell ps logs clean fclean prune
