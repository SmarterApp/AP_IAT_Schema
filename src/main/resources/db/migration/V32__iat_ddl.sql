-- Remove the unique constraint on tft resource as it is incorrect
ALTER TABLE tft_resource DROP CONSTRAINT IF EXISTS tft_resource_resource_id_inserted_date_key;