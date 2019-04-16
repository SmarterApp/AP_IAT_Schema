--
-- https://jira.fairwaytech.com/browse/IAT-2970
--

-- item sync
CREATE TABLE IF NOT EXISTS item_sync (
  id                UUID        NOT NULL,
  item_commit_id    UUID        NOT NULL,
  git_commit_hash   TEXT        NOT NULL,
  created_date      TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  created_by        VARCHAR     NOT NULL,
  CONSTRAINT pk_item_sync PRIMARY KEY (id)
);
