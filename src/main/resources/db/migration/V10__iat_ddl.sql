--
-- https://jira.fairwaytech.com/browse/IAT-2919
--

update workflow_status set description = 'items that pass calibrations and/or data review that are not active on a test'
    where code = 'OperationalReady';

delete from workflow_status_transition
    where (from_code = 'Rejected' or from_code = 'ParkingLot') and to_code = 'OperationalReady';

-- rollback

-- insert into workflow_status_transition(from_code, to_code, direction)
-- values ('ParkingLot', 'OperationalReady', 'FORWARD');

-- insert into workflow_status_transition(from_code, to_code, direction)
-- values ('Rejected', 'OperationalReady', 'FORWARD');

