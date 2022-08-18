-- name: CreateTransaction :one
INSERT INTO
    transactions (id, from_account_id, to_account_id, amount)
VALUES
    (
        sqlc.arg(id),
        sqlc.arg(from_account_id),
        sqlc.arg(to_account_id),
        sqlc.arg(amount)
    ) RETURNING *;

-- name: GetTransaction :one
SELECT
    TX.*,
    AFr.owner AS from_account_owner,
    ATo.owner AS to_account_owner
FROM
    transactions TX,
    accounts AFr,
    accounts ATo
WHERE
    TX.from_account_id = AFr.id
    AND TX.to_account_id = ATo.id
    AND TX.id = sqlc.arg(id);