--
-- https://jira.fairwaytech.com/browse/IAT-2970
--

-- item sync
CREATE TABLE IF NOT EXISTS item_sync (
  id                UUID        NOT NULL,
  item_commit_id    UUID        NOT NULL,
  branch_commit_id  UUID,
  git_commit_hash   TEXT        NOT NULL,
  created_date      TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  created_by        VARCHAR     NOT NULL,
  CONSTRAINT pk_item_sync PRIMARY KEY (id)
);

-- flywayClean deletes all user privileges, so we will set them here
-- Assumes that iat user has already been created in the database
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON ALL TABLES in schema public to "iat";
GRANT SELECT, UPDATE ON ALL SEQUENCES in schema public to "iat";