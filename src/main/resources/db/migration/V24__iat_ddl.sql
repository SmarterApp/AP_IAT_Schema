DO $$
DECLARE
    roleId integer;
    permissionId integer;
    createdBy integer;
BEGIN
    SELECT COALESCE(MIN(id), 1) FROM tims_role INTO roleId;
    SELECT id FROM tims_permission WHERE code = 'can_edit_sa_text_editor_type' INTO permissionId;
    SELECT COALESCE(MIN(id), 1) FROM tims_user INTO createdBy;

    UPDATE
        tims_permission
    SET
        is_workflow_restricted = true
    WHERE
        id = permissionId;

    INSERT INTO tims_role_permission_workflow_status(
        role_id,
        permission_id,
        workflow_status_code,
        created_by,
        created_date)
    SELECT
        roleId,
        permissionId,
        ws.code,
        createdBy,
        CURRENT_TIMESTAMP
    FROM
        workflow_status ws
    ON CONFLICT(role_id, permission_id, workflow_status_code)
        DO NOTHING;
END $$;
