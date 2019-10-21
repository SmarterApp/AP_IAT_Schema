-- Updates the permission to be workflow enabled;
UPDATE tims_permission SET is_workflow_restricted = true WHERE code = 'can_edit_sa_text_editor_type';