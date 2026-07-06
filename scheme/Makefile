.DEFAULT_GOAL := setup
.PHONY: setup, up, down, login

up:
	docker compose up -d

down:
	docker compose down

login:
	docker exec -it `docker ps --filter=name=scheme -q` /bin/bash

setup: up, login
