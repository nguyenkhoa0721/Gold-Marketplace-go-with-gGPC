createdb:
	docker exec -it postgres12 createdb --username=root --owner=root gold_marketplace

dropdb:
	docker exec -it postgres12 dropdb --username=root --owner-root gold_marketplace
