INSERT INTO tims_permission(
    id,
    code,
    label,
    description,
    permission_order,
    permission_category_id,
    is_workflow_restricted,
    created_by,
    updated_by)
VALUES (
    NEXTVAL('tims_permission_seq'),
    'export_audit_log',
    'Export Audit Log',
    'Can export the audit log listing all admin activity',
    (SELECT MAX(permission_order) FROM tims_permission) + 1,
    (SELECT id FROM tims_permission_category WHERE code = 'Item Export'),
    false,
    COALESCE((SELECT MIN(id) FROM tims_user), 1),
    COALESCE((SELECT MIN(id) FROM tims_user), 1)
);
