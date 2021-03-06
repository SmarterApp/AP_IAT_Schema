-- https://jira.fairwaytech.com/browse/IAT-2767
-- Change the transition:  TTS Upload --> Accessibility Upload
-- to:                     TTS Upload --> TTS Review

-- Select row to be updated (expected = 1 row)
-- select * from workflow_status_transition
-- where from_code = 'TextToSpeechReview'
-- 	and to_code = 'AccessibilityReview'

-- Up
update workflow_status_transition
set to_code = 'AccessibilityUpload'
where from_code = 'TextToSpeechReview'
	and to_code = 'AccessibilityReview';

-- Select row that was updated (expected = 1 row)
-- select * from workflow_status_transition
-- where from_code = 'TextToSpeechReview'
-- 	and to_code = 'AccessibilityUpload'

-- Down
--update workflow_status_transition
--set to_code = 'AccessibilityReview'
--where from_code = 'TextToSpeechReview'
--	and to_code = 'AccessibilityUpload'
