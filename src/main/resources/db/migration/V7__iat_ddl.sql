--
-- https://jira.fairwaytech.com/browse/IAT-2840
--

insert into workflow_status_transition(from_code, to_code, direction)
  values ('Operational', 'AccessibilityUpload', 'FORWARD');

insert into workflow_status_transition(from_code, to_code, direction)
  values ('DataReview', 'AccessibilityUpload', 'FORWARD');

update workflow_status_transition set direction = 'FORWARD'
  where from_code = 'FieldTest' and to_code = 'AccessibilityUpload';

--
-- rollback
--

-- delete from workflow_status_transition
--   where (from_code = 'Operational' or from_code = 'DataReview') and to_code = 'AccessibilityUpload';

-- update workflow_status_transition set direction = 'BACKWARD'
--   where from_code = 'FieldTest' and to_code = 'AccessibilityUpload';
