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
    'can_edit_sa_text_editor_type',
    'Edit SA Text Editor Type',
    'Can override the default short answer item text editor',
    (SELECT MAX(permission_order) FROM tims_permission) + 1,
    (SELECT id FROM tims_permission_category WHERE code = 'Item Editing'),
    false,
    COALESCE((SELECT MIN(id) FROM tims_user), 1),
    COALESCE((SELECT MIN(id) FROM tims_user), 1)
);
