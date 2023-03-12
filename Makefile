.PHONY: db-dev
db-dev:
	docker run --name postgres -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=olympus_dev -p 5432:5432 -d postgres