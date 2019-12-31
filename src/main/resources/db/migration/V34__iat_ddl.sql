CREATE TABLE IF NOT EXISTS item_migration_version (
  item_id       TEXT     NOT NULL,
  migration_version_id TEXT NOT NULL,
  created_by       text     NOT NULL,
  created_date     timestamptz NOT NULL DEFAULT current_timestamp,
  updated_by       text     NOT NULL,
  updated_date     timestamptz NOT NULL DEFAULT current_timestamp,
  CONSTRAINT pk_item_migartion_version PRIMARY KEY (item_id)
);