package db

import (
	"context"
	"testing"

	"github.com/nguyenkhoa0721/Gold-Marketplace-go-with-gGRP/utils"
	"github.com/stretchr/testify/require"
)

const userId = "453bb2b8-4187-4d83-a6ec-527fa4bb9859"

func TestCreateAccount(t *testing.T) {
	arg := CreateAccountParams{
		ID:      userId,
		Owner:   "owner",
		Balance: 1,
	}
	account, err := testQueries.CreateAccount(context.Background(), arg)
	if err != nil {
		t.Fatal(err)
	}
	require.NoError(t, err)
	require.NotEmpty(t, account)

	require.Equal(t, arg.Owner, account.Owner)
	require.Equal(t, arg.Balance, account.Balance)

	require.NotZero(t, account.ID)
	require.NotZero(t, account.CreatedAt)
}

func TestGetAccount(t *testing.T) {
	account, err := testQueries.GetAccount(context.Background(), userId)
	require.NoError(t, err)
	require.NotEmpty(t, account)
	require.Equal(t, userId, account.ID)
}

func TestDeleteAccount(t *testing.T) {
	err := testQueries.DeleteAccount(context.Background(), userId)
	require.NoError(t, err)
}

func TestCreateMultiAccount(t *testing.T) {
	for i := 0; i < 10; i++ {
		arg := CreateAccountParams{
			ID:      utils.RandomUUID(),
			Owner:   "owner",
			Balance: 100,
		}
		account, err := testQueries.CreateAccount(context.Background(), arg)
		require.NoError(t, err)
		require.NotEmpty(t, account)
	}
}
