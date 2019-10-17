CREATE TABLE IF NOT EXISTS tims_permission_audit  (
    id                      INTEGER     NOT NULL PRIMARY KEY ,
    entity_type             TEXT        NOT NULL CHECK (char_length(entity_type)  <= 255),
    entity_id               INTEGER     NOT NULL,
    action                  TEXT        NOT NULL CHECK (char_length(action)  <= 255),
    action_details          TEXT        NOT NULL,
    comment                 TEXT        NOT NULL,
    changed_by              TEXT        NOT NULL CHECK (char_length(changed_by)  <= 255),
    changed_on              TIMESTAMPTZ NOT NULL DEFAULT current_timestamp
);

CREATE SEQUENCE IF NOT EXISTS tims_permission_audit_seq START 1000;

-- Adding a table requires these statements to be run
-- Assumes that iat user has already been created in the database
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON ALL TABLES in schema public to "iat";
GRANT SELECT, UPDATE ON ALL SEQUENCES in schema public to "iat";