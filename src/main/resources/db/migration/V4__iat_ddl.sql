
-- starting sequence
CREATE SEQUENCE IF NOT EXISTS bulk_item_job_seq START 1;

CREATE TABLE IF NOT EXISTS bulk_item_job (
  id                UUID        NOT NULL,
  job_id            TEXT        NOT NULL CHECK (char_length(job_type)   <= 255),
  job_type          TEXT        NOT NULL CHECK (char_length(job_type)   <= 255),
  job_status        TEXT        NOT NULL CHECK (char_length(job_status) <= 255),
  job_json          JSON,
  is_active         BOOLEAN     NOT NULL DEFAULT TRUE,
  created_date      TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  created_by        VARCHAR     NOT NULL,
  CONSTRAINT pk_bulk_item_job PRIMARY KEY (id),
  CONSTRAINT uk_bulk_item_job UNIQUE (job_id, job_type, created_date)
);


-- flywayClean deletes all user privileges, so we set them again
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON ALL TABLES in schema public to "iat";
GRANT SELECT, UPDATE ON ALL SEQUENCES in schema public to "iat";