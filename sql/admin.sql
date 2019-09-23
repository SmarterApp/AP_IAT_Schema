-- ***************************************************************************
-- This file is to be used as development seed data.
-- User, role, and permissions use their respective sequences which start at
-- 1000.  The seed data below must use PK values in the range 1-999.
-- ***************************************************************************


--  There has to be a user to insert other data.  It is created with deleted = true.
insert into
    tims_user (id, email, given_name, surname, organization_name, organization_type_id, tag, is_deleted, created_by, updated_by)
values (
    1,
    'tims-admin@smarterbalanced.com',
    'TIMS',
    'Admin',
    'Smarter Balanced',
    4,
    'TIMS Admin',
    true,
    1,
    1
);

-- This is optional but if you want to seed some roles you can use these samples.
insert into tims_role (id, label, created_by, updated_by) values (1, 'TIMS Admin', 1, 1);
insert into tims_role (id, label, created_by, updated_by) values (2, 'Item Writer', 1, 1);

-- This is optional.  Here we are giving the system user the TIMS Admin role
insert into tims_user_role (user_id, role_id, created_by) values (1, 1, 1);

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

-- We are giving the the anonymous user the tims admin role.  Pick what works for you.
insert into tims_user_role (user_id, role_id, created_by) values (2, 1, 1);