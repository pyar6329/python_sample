.PHONY:	help
help: ## show help message.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY:	run
run: ## run main.py
	@src/sample/main.py

.PHONY:	test
test: ## run: pytest
	@poetry run pytest

.PHONY:	doctest
doctest: ## run: doctest
	@poetry run python -m doctest src/sample/utils.py
