-- Add an is_deleted column to the test package tables

ALTER TABLE test_package ADD COLUMN is_deleted BOOLEAN NOT NULL DEFAULT FALSE;