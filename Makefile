SERVER_PORT=8050
ifneq (,$(wildcard ./.dev.env))
	include .env
	export
endif
.PHONY : install setup tests check-types check check-full

install:
	poetry install

setup: install
	pre-commit install


test-with-coverage: migrate-local
	poetry run pytest src/app/tests --cov=src/app --cov-report term-missing:skip-covered --cov-report xml:.test-reports/coverage.xml --junitxml=.test-reports/test-run.xml

# check-types:
# 	poetry run mypy src/app

lint:
	poetry run pre-commit run --all-files

lint-changed:
	git status --porcelain | egrep -v '^(D |RM|R )' | cut -b 4- | xargs poetry run pre-commit run --files

lint-full-check: lint check-types

serve:
	cd local-event-notifier && poetry run uvicorn main:app --reload --port ${SERVER_PORT}

# clean pyc files/dirs
pyclean:
	find . -name "*.py[co]" -o -name __pycache__ -exec rm -rf {} +

migrate-local:
	cd local-event-notifier && poetry run alembic upgrade head