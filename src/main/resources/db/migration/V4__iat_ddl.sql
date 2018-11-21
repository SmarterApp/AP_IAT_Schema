
-- starting sequence
CREATE SEQUENCE IF NOT EXISTS item_bulk_update_seq START 1;

CREATE TABLE IF NOT EXISTS item_bulk_update (
  id                    UUID        NOT NULL,
  item_bulk_update_id   TEXT        NOT NULL CHECK (char_length(item_bulk_update_id)  <= 255),
  update_type           TEXT        NOT NULL CHECK (char_length(update_type)          <= 255),
  item_bulk_update_json JSON,
  created_date          TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  created_by            TEXT        NOT NULL CHECK (char_length(created_by)           <= 255),
  updated_date          TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  updated_by            TEXT        NOT NULL CHECK (char_length(updated_by)           <= 255),
  CONSTRAINT pk_item_bulk_update PRIMARY KEY (id),
  CONSTRAINT uk_item_bulk_update UNIQUE (item_bulk_update_id, created_date)
);


-- flywayClean deletes all user privileges, so we set them again
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON ALL TABLES in schema public to "iat";
GRANT SELECT, UPDATE ON ALL SEQUENCES in schema public to "iat";