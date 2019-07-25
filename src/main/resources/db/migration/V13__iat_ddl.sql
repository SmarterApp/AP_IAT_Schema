--
-- https://jira.fairwaytech.com/browse/IAT-3209
--

-- item history
ALTER TABLE item_history
    ADD COLUMN commit_by_fullname TEXT CHECK (char_length(commit_by_fullname) <= 255);


-- item
ALTER TABLE item
    DROP COLUMN created_by_fullname,
    DROP COLUMN commit_message;
