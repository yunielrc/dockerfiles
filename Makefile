SHELL := /bin/bash

ifndef REPO
	REPO :=
endif

ifndef SERVICE
	SERVICE :=
endif

ifneq "$(TAG)" ""
	REPO_TAG := "$(REPO):$(TAG)"
else
	REPO_TAG := "$(REPO)"
endif

.PHONY: build
build:
	docker build --no-cache -t $(REPO_TAG) .

.PHONY: buildall
buildall:
	./buildall

.PHONY: push
push:
	docker push $(REPO_TAG)

.PHONY: pushall
pushall:
	./pushall

.PHONY: build-pushall
build-pushall:
	./build-pushall

.PHONY: rmi
rmi:
	docker rmi $(REPO_TAG)

.PHONY: run
run:
	docker-compose run --rm --service-ports $(SERVICE)

.PHONY: rund
rund:
	docker-compose run --rm --service-ports -d $(SERVICE)



# dev commands
# DEVCOMMAND=docker-compose -f docker-compose.dev.yml
# DEVCOMMAND_RUN=$(DEVCOMMAND) run --rm --service-ports

# dev-server:
# 	$(DEVCOMMAND_RUN) server

# dev-server-conf:
# 	$(DEVCOMMAND_RUN) server-conf

# dev-build:
# 	$(DEVCOMMAND) build

# interactive:
# 	$(DEVCOMMAND_RUN) interactive

# ps:
# 	$(DEVCOMMAND) ps

# dev-build:
# 	$(DEVCOMMAND) build
