-- drop table
DROP TABLE IF EXISTS workflow_status_transition;

DROP TABLE IF EXISTS workflow_status;

-- workflow status
CREATE TABLE IF NOT EXISTS workflow_status (
  code            varchar NOT NULL,
  label           varchar NOT NULL,
  description     varchar NULL,
  workflow_order  int NOT NULL,
  PRIMARY KEY (code)
);

CREATE index if not exists workflow_status_idx
	on workflow_status (code)
;

INSERT INTO
  workflow_status (code, label, description, workflow_order)
VALUES
  ('Draft','Draft','author to create first draft of an item', 1),
  ('InitialReview','Initial Review','early iteration of the item', 2),
  ('MultimediaUpload','Multimedia Upload','graphic artists to add images and other multi-media', 3),
  ('ContentReview','Content Review','initial content lead review before Smarter staff', 4),
  ('EditorialReview','Editorial Review','editorial lead review before Smarter staff', 5),
  ('SeniorContentReview','Senior Content Review','final review before Smarter staff', 6),
  ('SmarterContentAuditReview','Smarter Content Audit Review','the first hand-off to Smarter content staff', 7),
  ('SmarterStudentSupportAuditReview','Smarter Student Supports Audit Review','the first hand-off to Smarter Supports for Student staff', 8),
  ('EducatorCommitteeReview','Educator Committee Review','in person committee review', 9),
  ('QualityCorrectionsContent','Post-Committee Quality Corrections - Content','post-committee review content edits', 10),
  ('QualityCorrectionsEditorial','Post-Committee Quality Corrections - Editorial','post-committee review editorial edits', 11),
  ('QualityCorrectionsSenior','Post-Committee Quality Corrections - Senior','post-committee review final edits', 12),
  ('SmarterContentReview','Post-Committee Smarter Content Review','Smarter content review after post-committee review edits', 13),
  ('SmarterAccessibilityReview','Post-Committee Smarter Accessibility Review','Smarter Supports for Students review after post-committee review edits', 14),
  ('SmarterCopyEdit','Post-Committee Smarter Copy Edit','final copy edit review', 15),
  ('TextToSpeechUpload','TTS Uploads','TTS to be added after content is finalized', 16),
  ('TextToSpeechReview','TTS Review','Send here to review the TTS tags uploaded for the item or stimulus', 17),
  ('AccessibilityUpload','Accessibility Upload','accessibility resources to be added after content is finalized', 18),
  ('AccessibilityReview','Accessibility Review','once accessibility resources are added', 19),
  ('FinalApproval','Final Approval','final review in preparation for field testing', 20),
  ('FieldTestReady','Field Test Ready','field test but not yet in a package as a field test item', 21),
  ('FieldTest','Field Test','item is in a package as a field test item', 22),
  ('Calibrations','Calibrations','post field test calibrations', 23),
  ('DataReview','Data Review','post field test review once flagged in calibrations', 24),
  ('Operational','Operational','items that pass calibrations and/or data review', 25),
  ('Released','Released','items that have been released to the public', 26),
  ('Archived','Archived','items are not in use and not public', 27),
  ('Rejected','Rejected','item not suitable for any use', 900),
  ('ParkingLot','Parking Lot','item needs review to determine appropriate status', 901)
  ON CONFLICT (code) DO NOTHING;



-- workflow status transitions
CREATE TABLE IF NOT EXISTS workflow_status_transition (
  from_code       VARCHAR   NOT NULL,
  to_code         VARCHAR   NOT NULL,
  direction       TEXT      NOT NULL,
  FOREIGN KEY (from_code)   REFERENCES workflow_status (code),
  FOREIGN KEY (to_code)     REFERENCES workflow_status (code),
  UNIQUE (from_code, to_code)
);

INSERT INTO
  workflow_status_transition (from_code, to_code, direction)
VALUES
  ('Draft','Draft','CURRENT'),
  ('Draft','InitialReview','FORWARD'),
  ('Draft','MultimediaUpload','FORWARD'),
  ('Draft','ContentReview','FORWARD'),
  ('Draft','EditorialReview','FORWARD'),
  ('Draft','SeniorContentReview','FORWARD'),
  ('Draft','SmarterContentAuditReview','FORWARD'),
  ('Draft','Rejected','REJECTED'),
  ('InitialReview','Draft','BACKWARD'),
  ('InitialReview','InitialReview','CURRENT'),
  ('InitialReview','MultimediaUpload','FORWARD'),
  ('InitialReview','ContentReview','FORWARD'),
  ('InitialReview','EditorialReview','FORWARD'),
  ('InitialReview','SeniorContentReview','FORWARD'),
  ('InitialReview','SmarterContentAuditReview','FORWARD'),
  ('InitialReview','Rejected','REJECTED'),
  ('MultimediaUpload','Draft','BACKWARD'),
  ('MultimediaUpload','InitialReview','BACKWARD'),
  ('MultimediaUpload','MultimediaUpload','CURRENT'),
  ('MultimediaUpload','ContentReview','FORWARD'),
  ('MultimediaUpload','EditorialReview','FORWARD'),
  ('MultimediaUpload','SeniorContentReview','FORWARD'),
  ('MultimediaUpload','SmarterContentAuditReview','FORWARD'),
  ('MultimediaUpload','Rejected','REJECTED'),
  ('ContentReview','Draft','BACKWARD'),
  ('ContentReview','InitialReview','BACKWARD'),
  ('ContentReview','MultimediaUpload','BACKWARD'),
  ('ContentReview','ContentReview','CURRENT'),
  ('ContentReview','EditorialReview','FORWARD'),
  ('ContentReview','SeniorContentReview','FORWARD'),
  ('ContentReview','SmarterContentAuditReview','FORWARD'),
  ('ContentReview','Rejected','REJECTED'),
  ('EditorialReview','Draft','BACKWARD'),
  ('EditorialReview','InitialReview','BACKWARD'),
  ('EditorialReview','MultimediaUpload','BACKWARD'),
  ('EditorialReview','ContentReview','BACKWARD'),
  ('EditorialReview','EditorialReview','CURRENT'),
  ('EditorialReview','SeniorContentReview','FORWARD'),
  ('EditorialReview','SmarterContentAuditReview','FORWARD'),
  ('EditorialReview','Rejected','REJECTED'),
  ('SeniorContentReview','Draft','BACKWARD'),
  ('SeniorContentReview','InitialReview','BACKWARD'),
  ('SeniorContentReview','MultimediaUpload','BACKWARD'),
  ('SeniorContentReview','ContentReview','BACKWARD'),
  ('SeniorContentReview','EditorialReview','BACKWARD'),
  ('SeniorContentReview','SeniorContentReview','CURRENT'),
  ('SeniorContentReview','SmarterContentAuditReview','FORWARD'),
  ('SeniorContentReview','Rejected','REJECTED'),
  ('SmarterContentAuditReview','SeniorContentReview','BACKWARD'),
  ('SmarterContentAuditReview','SmarterContentAuditReview','CURRENT'),
  ('SmarterContentAuditReview','SmarterStudentSupportAuditReview','FORWARD'),
  ('SmarterContentAuditReview','EducatorCommitteeReview','FORWARD'),
  ('SmarterContentAuditReview','Rejected','REJECTED'),
  ('SmarterStudentSupportAuditReview','SeniorContentReview','BACKWARD'),
  ('SmarterStudentSupportAuditReview','SmarterContentAuditReview','BACKWARD'),
  ('SmarterStudentSupportAuditReview','SmarterStudentSupportAuditReview','CURRENT'),
  ('SmarterStudentSupportAuditReview','EducatorCommitteeReview','FORWARD'),
  ('EducatorCommitteeReview','EducatorCommitteeReview','CURRENT'),
  ('EducatorCommitteeReview','QualityCorrectionsContent','FORWARD'),
  ('EducatorCommitteeReview','SmarterContentReview','FORWARD'),
  ('EducatorCommitteeReview','SmarterCopyEdit','FORWARD'),
  ('QualityCorrectionsContent','QualityCorrectionsContent','CURRENT'),
  ('QualityCorrectionsContent','QualityCorrectionsEditorial','FORWARD'),
  ('QualityCorrectionsContent','QualityCorrectionsSenior','FORWARD'),
  ('QualityCorrectionsContent','SmarterContentReview','FORWARD'),
  ('QualityCorrectionsEditorial','QualityCorrectionsContent','BACKWARD'),
  ('QualityCorrectionsEditorial','QualityCorrectionsEditorial','CURRENT'),
  ('QualityCorrectionsEditorial','QualityCorrectionsSenior','FORWARD'),
  ('QualityCorrectionsEditorial','SmarterContentReview','FORWARD'),
  ('QualityCorrectionsSenior','QualityCorrectionsContent','BACKWARD'),
  ('QualityCorrectionsSenior','QualityCorrectionsEditorial','BACKWARD'),
  ('QualityCorrectionsSenior','QualityCorrectionsSenior','CURRENT'),
  ('QualityCorrectionsSenior','SmarterContentReview','FORWARD'),
  ('SmarterContentReview','QualityCorrectionsSenior','BACKWARD'),
  ('SmarterContentReview','SmarterContentReview','CURRENT'),
  ('SmarterContentReview','SmarterAccessibilityReview','FORWARD'),
  ('SmarterContentReview','Rejected','REJECTED'),
  ('SmarterAccessibilityReview','QualityCorrectionsSenior','BACKWARD'),
  ('SmarterAccessibilityReview','SmarterAccessibilityReview','CURRENT'),
  ('SmarterAccessibilityReview','SmarterCopyEdit','FORWARD'),
  ('SmarterAccessibilityReview','TextToSpeechUpload','FORWARD'),
  ('SmarterAccessibilityReview','Rejected','REJECTED'),
  ('SmarterCopyEdit','MultimediaUpload','BACKWARD'),
  ('SmarterCopyEdit','SmarterContentReview','BACKWARD'),
  ('SmarterCopyEdit','SmarterCopyEdit','CURRENT'),
  ('SmarterCopyEdit','TextToSpeechUpload','FORWARD'),
  ('TextToSpeechUpload','SmarterAccessibilityReview','BACKWARD'),
  ('TextToSpeechUpload','SmarterCopyEdit','BACKWARD'),
  ('TextToSpeechUpload','TextToSpeechUpload','CURRENT'),
  ('TextToSpeechUpload','AccessibilityUpload','FORWARD'),
  ('TextToSpeechReview','TextToSpeechUpload','BACKWARD'),
  ('TextToSpeechReview','SmarterAccessibilityReview','BACKWARD'),
  ('TextToSpeechReview','TextToSpeechReview','CURRENT'),
  ('TextToSpeechReview','AccessibilityReview','FORWARD'),
  ('AccessibilityUpload','SmarterAccessibilityReview','BACKWARD'),
  ('AccessibilityUpload','SmarterCopyEdit','BACKWARD'),
  ('AccessibilityUpload','AccessibilityUpload','CURRENT'),
  ('AccessibilityUpload','AccessibilityReview','FORWARD'),
  ('AccessibilityReview','TextToSpeechUpload','BACKWARD'),
  ('AccessibilityReview','AccessibilityUpload','BACKWARD'),
  ('AccessibilityReview','AccessibilityReview','CURRENT'),
  ('AccessibilityReview','FinalApproval','FORWARD'),
  ('FinalApproval','SmarterContentReview','BACKWARD'),
  ('FinalApproval','FinalApproval','CURRENT'),
  ('FinalApproval','FieldTestReady','FORWARD'),
  ('FinalApproval','Rejected','REJECTED'),
  ('FieldTestReady','SmarterContentReview','BACKWARD'),
  ('FieldTestReady','TextToSpeechUpload','BACKWARD'),
  ('FieldTestReady','AccessibilityUpload','BACKWARD'),
  ('FieldTestReady','FieldTestReady','CURRENT'),
  ('FieldTestReady','FieldTest','FORWARD'),
  ('FieldTestReady','Rejected','REJECTED'),
  ('FieldTest','SmarterContentReview','BACKWARD'),
  ('FieldTest','TextToSpeechUpload','BACKWARD'),
  ('FieldTest','AccessibilityUpload','BACKWARD'),
  ('FieldTest','FieldTest','CURRENT'),
  ('FieldTest','Calibrations','FORWARD'),
  ('FieldTest','Rejected','REJECTED'),
  ('Calibrations','Calibrations','CURRENT'),
  ('Calibrations','DataReview','FORWARD'),
  ('Calibrations','Operational','FORWARD'),
  ('Calibrations','FieldTest','FORWARD'),
  ('Calibrations','Released','FORWARD'),
  ('Calibrations','Archived','ARCHIVED'),
  ('Calibrations','Rejected','REJECTED'),
  ('DataReview','QualityCorrectionsContent','BACKWARD'),
  ('DataReview','SmarterCopyEdit','BACKWARD'),
  ('DataReview','FinalApproval','BACKWARD'),
  ('DataReview','DataReview','CURRENT'),
  ('DataReview','Operational','FORWARD'),
  ('DataReview','Rejected','REJECTED'),
  ('Operational','QualityCorrectionsContent','BACKWARD'),
  ('Operational','SmarterCopyEdit','BACKWARD'),
  ('Operational','FinalApproval','BACKWARD'),
  ('Operational','Operational','CURRENT'),
  ('Operational','Released','FORWARD'),
  ('Operational','Archived','ARCHIVED'),
  ('Operational','Rejected','REJECTED'),
  ('Released','Released','CURRENT'),
  ('Released','Archived','ARCHIVED'),
  ('Released','Rejected','REJECTED'),
  ('Archived','Archived','CURRENT'),
  ('Archived','Rejected','REJECTED'),
  ('Rejected','Draft','FORWARD'),
  ('Rejected','InitialReview','FORWARD'),
  ('Rejected','MultimediaUpload','FORWARD'),
  ('Rejected','ContentReview','FORWARD'),
  ('Rejected','EditorialReview','FORWARD'),
  ('Rejected','SeniorContentReview','FORWARD'),
  ('Rejected','SmarterContentAuditReview','FORWARD'),
  ('Rejected','SmarterStudentSupportAuditReview','FORWARD'),
  ('Rejected','EducatorCommitteeReview','FORWARD'),
  ('Rejected','QualityCorrectionsContent','FORWARD'),
  ('Rejected','QualityCorrectionsEditorial','FORWARD'),
  ('Rejected','QualityCorrectionsSenior','FORWARD'),
  ('Rejected','SmarterContentReview','FORWARD'),
  ('Rejected','SmarterAccessibilityReview','FORWARD'),
  ('Rejected','SmarterCopyEdit','FORWARD'),
  ('Rejected','TextToSpeechUpload','FORWARD'),
  ('Rejected','TextToSpeechReview','FORWARD'),
  ('Rejected','AccessibilityUpload','FORWARD'),
  ('Rejected','AccessibilityReview','FORWARD'),
  ('Rejected','FinalApproval','FORWARD'),
  ('Rejected','FieldTestReady','FORWARD'),
  ('Rejected','FieldTest','FORWARD'),
  ('Rejected','Calibrations','FORWARD'),
  ('Rejected','DataReview','FORWARD'),
  ('Rejected','Operational','FORWARD'),
  ('Rejected','Released','FORWARD'),
  ('Rejected','Archived','ARCHIVED'),
  ('Rejected','Rejected','CURRENT'),
  ('Rejected','ParkingLot','FORWARD'),
  ('ParkingLot','Draft','FORWARD'),
  ('ParkingLot','InitialReview','FORWARD'),
  ('ParkingLot','MultimediaUpload','FORWARD'),
  ('ParkingLot','ContentReview','FORWARD'),
  ('ParkingLot','EditorialReview','FORWARD'),
  ('ParkingLot','SeniorContentReview','FORWARD'),
  ('ParkingLot','SmarterContentAuditReview','FORWARD'),
  ('ParkingLot','SmarterStudentSupportAuditReview','FORWARD'),
  ('ParkingLot','EducatorCommitteeReview','FORWARD'),
  ('ParkingLot','QualityCorrectionsContent','FORWARD'),
  ('ParkingLot','QualityCorrectionsEditorial','FORWARD'),
  ('ParkingLot','QualityCorrectionsSenior','FORWARD'),
  ('ParkingLot','SmarterContentReview','FORWARD'),
  ('ParkingLot','SmarterAccessibilityReview','FORWARD'),
  ('ParkingLot','SmarterCopyEdit','FORWARD'),
  ('ParkingLot','TextToSpeechUpload','FORWARD'),
  ('ParkingLot','TextToSpeechReview','FORWARD'),
  ('ParkingLot','AccessibilityUpload','FORWARD'),
  ('ParkingLot','AccessibilityReview','FORWARD'),
  ('ParkingLot','FinalApproval','FORWARD'),
  ('ParkingLot','FieldTestReady','FORWARD'),
  ('ParkingLot','FieldTest','FORWARD'),
  ('ParkingLot','Calibrations','FORWARD'),
  ('ParkingLot','DataReview','FORWARD'),
  ('ParkingLot','Operational','FORWARD'),
  ('ParkingLot','Released','FORWARD'),
  ('ParkingLot','Archived','ARCHIVED'),
  ('ParkingLot','Rejected','REJECTED'),
  ('ParkingLot','ParkingLot','CURRENT')
  ON CONFLICT (from_code, to_code) DO NOTHING;

-- flywayClean deletes all user privileges, so we will set them here
-- Assumes that iat user has already been created in the database
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON ALL TABLES in schema public to "iat";
GRANT SELECT, UPDATE ON ALL SEQUENCES in schema public to "iat";