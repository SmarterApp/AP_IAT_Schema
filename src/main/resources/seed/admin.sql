
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

insert into tims_role (id, label, created_by, updated_by) values (1, 'TIMS Admin', 1, 1);
insert into tims_role (id, label, created_by, updated_by) values (2, 'Item Writer', 1, 1);

insert into tims_user_role (user_id, role_id, created_by) values (1, 1, 1);


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

insert into tims_user_role (user_id, role_id, created_by) values (2, 1, 1);