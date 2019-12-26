-- Adds the lock table for concurrent edits when locking an tft

CREATE TABLE IF NOT EXISTS tft_resource_lock (
  resource_id       integer     NOT NULL,
  action            smallint    NOT NULL,
  inserted_by       text     NOT NULL,
  inserted_date     timestamptz NOT NULL DEFAULT current_timestamp,
  CONSTRAINT pk_tft_resource_lock PRIMARY KEY (resource_id)
);