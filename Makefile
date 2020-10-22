ifndef REPO
	REPO :=
endif

ifneq "$(TAG)" ""
	REPO_TAG := "$(REPO):$(TAG)"
else
	REPO_TAG := "$(REPO)"
endif

.PHONY: build
build:
	docker build -t $(REPO_TAG) .

.PHONY: push
push:
	docker push $(REPO_TAG)

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
