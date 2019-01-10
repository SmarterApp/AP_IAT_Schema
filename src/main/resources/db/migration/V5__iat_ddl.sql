-- https://jira.fairwaytech.com/browse/IAT-2767
-- Change the transition:  TTS Upload --> Accessibility Upload
-- to:                     TTS Upload --> TTS Review

-- Select row to be updated (expected = 1 row)
-- select * from workflow_status_transition
-- where from_code = 'TextToSpeechUpload'
-- 	and to_code = 'AccessibilityUpload'

-- Up
update workflow_status_transition
set to_code = 'TextToSpeechReview'
where from_code = 'TextToSpeechUpload'
	and to_code = 'AccessibilityUpload';

-- Select row that was updated (expected = 1 row)
-- select * from workflow_status_transition
-- where from_code = 'TextToSpeechUpload'
-- 	and to_code = 'TextToSpeechReview'

-- Down
--update workflow_status_transition
--set to_code = 'AccessibilityUpload'
--where from_code = 'TextToSpeechUpload'
--	and to_code = 'TextToSpeechReview'

-- flywayClean deletes all user privileges, so we set them again
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON ALL TABLES in schema public to "iat";
GRANT SELECT, UPDATE ON ALL SEQUENCES in schema public to "iat";