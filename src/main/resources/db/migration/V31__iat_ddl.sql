/****
    Creates the tft_resource table.  This table is an insert only table containing the tools for teachers
    resources.

    - id: pk
    - resource_id: the unique identifier for a resource
    - resource_type: the type of resource. Example, instructionalResource
    - action: the action being taken during the insert
    - is_locked: true means the resource is locked for edit
    - resource_json : the resource represented in JSON format
    - commit_message : the commit message from the user
    - inserted_by : the username of the user inserting the record
    - inserted_date : the date of insert
***/

CREATE SEQUENCE IF NOT EXISTS tft_resource_id_seq START 1;

CREATE TABLE IF NOT EXISTS tft_resource (
  id                uuid        NOT NULL,
  resource_id       integer     NOT NULL,
  resource_type     text        NOT NULL,
  resource_json     json        NOT NULL,
  action            smallint    NOT NULL,
  is_locked         boolean     NOT NULL,
  commit_message    text,
  inserted_date     timestamptz NOT NULL DEFAULT current_timestamp,
  inserted_by       text     NOT NULL,
  CONSTRAINT pk_tft_resource PRIMARY KEY (id),
  UNIQUE (resource_id, inserted_date)
);