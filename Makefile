	
network:
	docker network create bank-network

postgres:
	docker run --name postgres --network bank-network -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:14-alpine
	
createdb:
	docker exec -it postgres createdb --username=root --owner=root gold_marketplace

dropdb:
	docker exec -it postgres dropdb --username=root --owner-root gold_marketplace

migrateup:
	migrate -path db/migration -database "postgres://root:secret@localhost:5432/gold_marketplace?sslmode=disable" -verbose up
	
migratedown:
	migrate -path db/migration -database "postgres://root:secret@localhost:5432/gold_marketplace?sslmode=disable" -verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

.PHONY: network postgres createdb migrateup migratedown sqlc test