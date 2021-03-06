--
-- https://jira.fairwaytech.com/browse/IAT-3155
--

-- item history
CREATE TABLE IF NOT EXISTS item_history (
  id                    UUID        NOT NULL,
  item_id               TEXT        NOT NULL CHECK (char_length(item_id)  <= 255),
  item_commit_id        UUID,
  branch_commit_id      UUID,
  content_version_id    TEXT        CHECK (char_length(content_version_id)  <= 255),
  commit_by             TEXT        CHECK (char_length(commit_by)  <= 255),
  commit_date           TIMESTAMPTZ NOT NULL,
  commit_message        TEXT        NOT NULL,
  created_date          TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  CONSTRAINT pk_item_history PRIMARY KEY (id),
  UNIQUE (item_id, item_commit_id, commit_date)
);

-- Adding a table requires these statements to be run
-- Assumes that iat user has already been created in the database
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON ALL TABLES in schema public to "iat";
GRANT SELECT, UPDATE ON ALL SEQUENCES in schema public to "iat";