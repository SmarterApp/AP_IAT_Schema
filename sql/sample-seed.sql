-- ***************************************************************************
-- This file is to be used as development seed data.  Nothing in here should
-- go into QA/UAT/Stage/Production.
-- User, role, and permissions use their respective sequences which start at
-- 1000.  The seed data below must use PK values in the range 1-999.  You can
-- also utilize the sequence in your insert statement if you want.
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
insert into tims_role (id, label, created_by, updated_by) values (1, 'Super User', 1, 1);
insert into tims_role (id, label, created_by, updated_by) values (2, 'Item Writer', 1, 1);
insert into tims_role (id, label, created_by, updated_by) values (3, 'Committee Review', 1, 1);

-- We are giving the the anonymous user the super user role.  Pick what works for you.
insert into tims_user_role (user_id, role_id, created_by) values (2, 1, 1);

-- This gives the Super User role every permission
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 1, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 2, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 3, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 4, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 5, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 6, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 7, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 8, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 9, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 10, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 11, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 12, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 13, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 14, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 15, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 16, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 17, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 18, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 19, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 20, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 21, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 22, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 23, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 24, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 25, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 26, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 27, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 28, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 29, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 30, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 31, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 32, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 33, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 34, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 35, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 36, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 37, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 38, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 39, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 40, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 41, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 42, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 43, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 44, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 45, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 46, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 47, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 48, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 49, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 50, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 51, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 52, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 53, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 54, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 55, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 56, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 57, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 58, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 59, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 60, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 61, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 62, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 63, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 64, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 65, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 66, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 67, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 68, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 69, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 70, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 71, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 72, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 73, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 74, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 75, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 76, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 77, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 78, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 79, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 80, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 81, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 82, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 83, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 84, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 85, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 86, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 87, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 88, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 89, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 90, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 91, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 92, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 93, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 94, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 95, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 96, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 97, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 98, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 99, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 100, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 101, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 102, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 103, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 104, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 105, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 106, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 107, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 108, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 109, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 110, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 111, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 112, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 113, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 114, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 115, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 116, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 117, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 118, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 119, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 120, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 121, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 122, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 123, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 124, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 125, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 126, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 127, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 128, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 129, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 130, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 131, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 132, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 133, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 134, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 135, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 136, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 137, 1);
insert into tims_role_permission(role_id, permission_id, created_by) values (1, 138, 1);


insert into
    tims_user (id, email, given_name, surname, organization_name, organization_type_id, tag, created_by, updated_by)
values (
    nextval('tims_user_seq'),
    'hal@fairwaytech.com',
    'Hal',
    'Jordan',
    'Fairway Technologies',
    1,
    'test',
    1,
    1
);

insert into tims_user_role (user_id, role_id, created_by) values (1000, 1, 1);