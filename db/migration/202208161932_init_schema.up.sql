CREATE TABLE "accounts" (
    "id" CHAR(36) PRIMARY KEY,
    "owner" VARCHAR NOT NULL,
    "balance" BIGINT NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT(now())
);
CREATE TABLE "entries" (
    "id" CHAR(36) PRIMARY KEY,
    "account_id" CHAR(36) NOT NULL,
    "amount" BIGINT NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT(now())
);
CREATE TABLE "transactions" (
    "id" CHAR(36) PRIMARY KEY,
    "from_account_id" CHAR(36) NOT NULL,
    "to_account_id" CHAR(36) NOT NULL,   
    "amount" BIGINT NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT(now())
);

CREATE INDEX ON "accounts" ("owner");
CREATE INDEX ON "entries" ("account_id");
CREATE INDEX ON "transactions" ("from_account_id");
CREATE INDEX ON "transactions" ("to_account_id");
CREATE INDEX ON "transactions" ("from_account_id", "to_account_id");