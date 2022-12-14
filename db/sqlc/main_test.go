package db

import (
	"database/sql"
	"log"
	"os"
	"testing"

	_ "github.com/lib/pq"
)

const (
	dbDriver = "postgres"
	dbSource = "postgres://root:secret@localhost:5432/gold_marketplace?sslmode=disable"
)

var testQueries *Queries

func TestMain(m *testing.M) {
	con, err := sql.Open(dbDriver, dbSource)
	if err != nil {
		log.Fatal(err)
		log.Fatal("Failed to open database connection")
	}

	testQueries = New(con)
	os.Exit(m.Run())
}
