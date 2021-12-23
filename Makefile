.PHONY:	help
help: ## show help message.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY:	run
run: ## run main.py
	@docker exec -it python-sample poetry run python src/sample/main.py

.PHONY:	test
test: ## pytest
	@docker exec -it python-sample poetry run pytest --doctest-modules

.PHONY: up
up: ## docker run
	@./scripts/run_docker.sh
	@./scripts/install_node.sh
	@make poetry_install

.PHONY: poetry_install
poetry_install: ## poetry install
	@docker exec -it python-sample /app/scripts/run_poetry.sh

.PHONY: down
down: ## docker stop
	@docker rm -fv python-sample

.PHONY: shell
shell: ## docker exec -it --rm /bin/bash
	@docker exec -it python-sample /bin/bash

.PHONY: mypy
mypy: ## mypy type_sample.py
	@docker exec -it python-sample poetry run mypy src/sample/type_sample.py

.PHONY: pyright
pyright: ## pyright type_sample.py
	@docker exec -it python-sample poetry run pyright src/sample/type_sample.py
