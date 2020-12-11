export SHELL=/usr/bin/env bash

.PHONY: help
help: ## Display this help text
	@echo 'Perform common development tasks'
	@echo 'Usage: make [TARGET]'
	@echo 'Targets:'
	@grep '^[a-zA-Z]' $(MAKEFILE_LIST) | awk -F ':.*?## ' 'NF==2 {printf "\033[36m  %-25s\033[0m %s\n", $$1, $$2}'

.PHONY: deploy
deploy: ## Deploys the stack to AWS DEV
	./deployment-scripts/deploy/SAM/deploy.sh ./deployment/.env ./deployment/template.yml

