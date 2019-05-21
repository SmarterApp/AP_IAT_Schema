--
-- https://jira.fairwaytech.com/browse/IAT-2919
--

update workflow_status set workflow_order = 28 where code = 'Archived';

update workflow_status set workflow_order = 27 where code = 'Released';

update workflow_status set workflow_order = 26 where code = 'Operational';


insert into workflow_status (code, label, description, workflow_order)
    values ('OperationalReady', 'Operational Ready', 'items that pass calibrations and/or data review', 25);


insert into workflow_status_transition(from_code, to_code, direction)
    values ('OperationalReady', 'OperationalReady', 'CURRENT');

insert into workflow_status_transition(from_code, to_code, direction)
    values ('OperationalReady', 'Operational', 'FORWARD');

insert into workflow_status_transition(from_code, to_code, direction)
    values ('OperationalReady', 'AccessibilityUpload', 'FORWARD');

insert into workflow_status_transition(from_code, to_code, direction)
    values ('OperationalReady', 'Rejected', 'REJECTED');


insert into workflow_status_transition(from_code, to_code, direction)
    values ('Calibrations', 'OperationalReady', 'FORWARD');

insert into workflow_status_transition(from_code, to_code, direction)
    values ('DataReview', 'OperationalReady', 'FORWARD');

insert into workflow_status_transition(from_code, to_code, direction)
  values ('ParkingLot', 'OperationalReady', 'FORWARD');

insert into workflow_status_transition(from_code, to_code, direction)
  values ('Rejected', 'OperationalReady', 'FORWARD');

--
-- rollback
--

-- delete from workflow_status_transition
--   where (from_code = 'Rejected' or from_code = 'ParkingLot') and to_code = 'OperationalReady';

-- delete from workflow_status_transition
--   where (from_code = 'Calibrations' or from_code = 'DataReview') and to_code = 'OperationalReady';

-- delete from workflow_status_transition where from_code = 'OperationalReady';

-- delete from workflow_status where code = 'OperationalReady';

-- update workflow_status set workflow_order = 25 where code = 'Operational';

-- update workflow_status set workflow_order = 26 where code = 'Released';

-- update workflow_status set workflow_order = 27 where code = 'Archived';


