-- Creates the test package table

CREATE TABLE IF NOT EXISTS test_package (
  id                 UUID        NOT NULL,
  package_id         TEXT        NOT NULL,
  locked             BOOLEAN     NOT NULL,
  is_being_created   BOOLEAN     NOT NULL DEFAULT TRUE,
  test_package_json  JSON        NOT NULL,
  message            TEXT,
  inserted_date      TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  inserted_by        VARCHAR     NOT NULL,
  CONSTRAINT pk_test_package PRIMARY KEY (id),
  UNIQUE (package_id, inserted_date)
);