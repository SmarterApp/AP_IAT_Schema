--
-- https://jira.fairwaytech.com/browse/IAT-3155
--

-- item history
CREATE TABLE IF NOT EXISTS item_history (
  id                        UUID        NOT NULL,

  item_id                   TEXT        NOT NULL CHECK (char_length(item_id)  <= 255),

  event_type                TEXT        NOT NULL CHECK (char_length(event_type)  <= 255),

  item_commit_id            UUID,
  branch_commit_id          UUID,

  content_zip_version_id    TEXT        CHECK (char_length(content_zip_version_id)  <= 255),

  commit_date               TIMESTAMPTZ NOT NULL,
  commit_by                 VARCHAR     NOT NULL,

  created_date              TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  created_by                VARCHAR     NOT NULL,
  updated_date              TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  updated_by                VARCHAR     NOT NULL,

  CONSTRAINT pk_item_history PRIMARY KEY (id)
);

-- flywayClean deletes all user privileges, so we will set them here
-- Assumes that iat user has already been created in the database
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON ALL TABLES in schema public to "iat";
GRANT SELECT, UPDATE ON ALL SEQUENCES in schema public to "iat";