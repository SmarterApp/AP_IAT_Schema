--
-- https://smarterbalanced.atlassian.net/browse/IAT-3130
--

ALTER TABLE item_history ADD git_commit_hash TEXT CHECK (char_length(git_commit_hash) <= 255);

-- item history audit
CREATE TABLE IF NOT EXISTS item_history_audit (
    item_id               TEXT NOT NULL CHECK (char_length(item_id)  <= 255),
    legacy_id             TEXT NOT NULL CHECK (char_length(item_id)  <= 255),
    expected_commit_count INTEGER,
    is_complete           BOOLEAN NOT NULL DEFAULT FALSE,
    is_failed             BOOLEAN NOT NULL DEFAULT FALSE,
    created_date          TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
    CONSTRAINT pk_item_history_audit PRIMARY KEY (item_id)
);

-- Adding a table requires these statements to be run
-- Assumes that iat user has already been created in the database
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON ALL TABLES in schema public to "iat";
GRANT SELECT, UPDATE ON ALL SEQUENCES in schema public to "iat";