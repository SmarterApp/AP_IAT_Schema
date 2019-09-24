-- ***************************************************************************
-- This file is to be used as development seed data.
-- User, role, and permissions use their respective sequences which start at
-- 1000.  The seed data below must use PK values in the range 1-999.
-- ***************************************************************************

-- Add this to your local database if you want to use Postman with the permission service
-- Depending on your Postman, it may not have session sync with Chrome in which case all
-- requests are received by the permission service as anonymousUser
insert into
    tims_user (id, email, given_name, surname, organization_name, organization_type_id, tag, created_by, updated_by)
values (
   2,
   'anonymousUser',
   'anonymous',
   'anonymous',
   'Restricted',
   4,
   'anonymous',
   1,
   1
);

-- This is optional but if you want to seed some roles you can use these samples.
insert into tims_role (id, label, created_by, updated_by) values (1, 'TIMS Admin', 1, 1);
insert into tims_role (id, label, created_by, updated_by) values (2, 'Item Writer', 1, 1);
insert into tims_role (id, label, created_by, updated_by) values (3, 'Committee Review', 1, 1);

-- We are giving the the anonymous user the tims admin role.  Pick what works for you.
insert into tims_user_role (user_id, role_id, created_by) values (2, 1, 1);

-- TIMS Admin (role) | access_tims (permission)
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 1, 1);