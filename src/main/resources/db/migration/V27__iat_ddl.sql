-- set the 'export_audit_log' permission to the 'Application Admin' (i.e. ID 2) category
UPDATE tims_permission set code = 'access_qti',  description = 'You can access QTI features.' where code = 'early_access_qti';
