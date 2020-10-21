.PHONY: server interactive server-conf ps build

COMAND=docker-compose -f docker-compose.dev.yml
COMAND_RUN=$(COMAND) run --rm --service-ports

server:
	$(COMAND_RUN) server

server-conf:
	$(COMAND_RUN) server-conf

interactive:
	$(COMAND_RUN) interactive

ps:
	$(COMAND) ps

build:
	$(COMAND) build
