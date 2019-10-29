
-- insert a rachel using the user sequence
insert into tims_user (id, email, given_name, surname, created_by, updated_by)
    values (10, 'rachel.kachchaf@smarterbalanced.org', 'Rachel', 'Kachaf', 1, 1);
​
insert into tims_user_role (user_id, role_id, created_by) values (10, 1, 1);

​
-- insert a lori using the user sequence
insert into tims_user (id, email, given_name, surname, created_by, updated_by)
    values (11, 'lori.sheirich@smarterbalanced.org', 'Lori', 'Sherich', 1, 1);
​
insert into tims_user_role (user_id, role_id, created_by) values (11, 1, 1);
​
-- insert a todd using the user sequence
insert into tims_user (id, email, given_name, surname, created_by, updated_by)
    values (12, 'tmiller@fairwaytech.com', 'Todd', 'Miller', 1, 1);
​
insert into tims_user_role (user_id, role_id, created_by) values (12, 1, 1);
​

-- insert a tess using the user sequence
insert into tims_user (id, email, given_name, surname, created_by, updated_by)
    values (13, 'tanchales@fairwaytech.com', 'Tess', 'Ancheles', 1, 1);
​
insert into tims_user_role (user_id, role_id, created_by) values (13, 1, 1);