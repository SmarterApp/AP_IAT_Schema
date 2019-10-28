-- set the 'export_audit_log' permission to the 'Application Admin' (i.e. ID 2) category
UPDATE tims_permission set permission_category_id = 2 where code = 'export_audit_log';
