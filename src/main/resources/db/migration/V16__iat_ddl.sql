--
-- https://smarterbalanced.atlassian.net/browse/IAT-3158
--

-- item job
CREATE TABLE IF NOT EXISTS item_job (
  id                 UUID        NOT NULL,
  job_execution_id   BIGINT,
  job_type           TEXT        NOT NULL CHECK(char_length(job_type)  <= 255),
  job_params_json    JSON,
  job_results_json   JSON,
  created_by         TEXT        NOT NULL CHECK (char_length(created_by) <= 255),
  created_date       TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  updated_by         TEXT        NOT NULL CHECK (char_length(updated_by)           <= 255),
  updated_date       TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  CONSTRAINT pk_item_job PRIMARY KEY (id)
);

-- Adding a table requires these statements to be run
-- Assumes that iat user has already been created in the database
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON ALL TABLES in schema public to "iat";
GRANT SELECT, UPDATE ON ALL SEQUENCES in schema public to "iat";
