-- Adds a new boolean column to the tims history table to manage if the historical item can be previewed in TIMS
ALTER TABLE item_history ADD COLUMN "supports_preview" BOOLEAN NOT NULL DEFAULT FALSE;