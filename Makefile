.PHONY: help pre-commit
.DEFAULT_GOAL: help

# Executables
PRE_COMMIT ?= pre-commit

help:
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-20s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

pre-commit: ## Initialize pre-commit
	pre-commit install --install-hooks -t pre-commit -t commit-msg

install-dev: pre-commit # Setup project for development
