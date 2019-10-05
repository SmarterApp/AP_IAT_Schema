
-- replace item_job with content_package
DROP TABLE IF EXISTS item_job;

-- content_package
CREATE TABLE IF NOT EXISTS content_package
(
    id               SERIAL PRIMARY KEY,
    item_ids         TEXT        NOT NULL,
    format           SMALLINT    NOT NULL,
    include_import   BOOLEAN     NOT NULL,
    include_tutorial BOOLEAN     NOT NULL,
    status           SMALLINT    NOT NULL,
    exit_message     TEXT,
    created_date     TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
    updated_date     TIMESTAMPTZ NOT NULL DEFAULT current_timestamp
);

-- Create an index on filter criteria
CREATE INDEX idx__content_package__format ON content_package(format);

-- Adding a table requires these statements to be run
-- Assumes that iat user has already been created in the database
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON ALL TABLES in schema public to "iat";
GRANT SELECT, UPDATE ON ALL SEQUENCES in schema public to "iat";