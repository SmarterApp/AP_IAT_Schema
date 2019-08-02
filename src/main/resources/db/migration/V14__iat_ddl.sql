--
-- https://smarterbalanced.atlassian.net/browse/IAT-3210
--

-- item history
ALTER TABLE item_history
    ADD content_diff TEXT;
