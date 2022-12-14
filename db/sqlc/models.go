// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.15.0

package db

import (
	"time"
)

type Account struct {
	ID        string
	Owner     string
	Balance   int64
	CreatedAt time.Time
}

type Entry struct {
	ID        string
	AccountID string
	Amount    int64
	CreatedAt time.Time
}

type Transaction struct {
	ID            string
	FromAccountID string
	ToAccountID   string
	Amount        int64
	CreatedAt     time.Time
}
