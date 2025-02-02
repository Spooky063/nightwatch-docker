DOCKER_EXEC=docker compose exec -it node

.PHONY: up
up:
	docker compose up

.PHONY: prepare
prepare:
	${DOCKER_EXEC} rm -rf node_modules/ var/
	@if [ ! -f .env ]; then ${DOCKER_EXEC} cp .env.example .env; fi
	${DOCKER_EXEC} npm install

.PHONY: test
test:
	${DOCKER_EXEC} rm -rf var/
	${DOCKER_EXEC} npm run test:nightwatch
