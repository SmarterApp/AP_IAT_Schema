
CREATE TABLE IF NOT EXISTS organization_type  (
    id                      INTEGER     NOT NULL PRIMARY KEY ,
    code                    TEXT        NOT NULL CHECK (char_length(code)  <= 255) UNIQUE,
    label                   TEXT        NOT NULL CHECK (char_length(label)  <= 255) UNIQUE,
    is_deleted              BOOLEAN     NOT NULL DEFAULT FALSE
);

insert into organization_type (id, code, label) values (1, 'Member', 'Member');
insert into organization_type (id, code, label) values (2, 'Vendor', 'Vendor');
insert into organization_type (id, code, label) values (3, 'Non-Member', 'Non-Member');
insert into organization_type (id, code, label) values (4, 'Smarter Balanced', 'Smarter Balanced');

CREATE SEQUENCE IF NOT EXISTS tims_user_seq START 1000;

CREATE TABLE IF NOT EXISTS tims_user  (
    id                      INTEGER     NOT NULL PRIMARY KEY ,
    email                   TEXT        NOT NULL CHECK (char_length(email)  <= 255) UNIQUE,
    given_name              TEXT        NOT NULL CHECK (char_length(given_name)  <= 255),
    surname                 TEXT        NOT NULL CHECK (char_length(surname)  <= 255),
    is_deleted              BOOLEAN     NOT NULL DEFAULT FALSE,
    organization_name       TEXT        CHECK (char_length(organization_name)  <= 255),
    organization_type_id    INT,
    tag                     TEXT        CHECK (char_length(tag)  <= 255),
    version                 INTEGER     NOT NULL DEFAULT 1,
    created_by              INTEGER     NOT NULL,
    created_date            TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
    updated_by              INTEGER     NOT NULL,
    updated_date            TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
    constraint user_fk_1 foreign key (created_by) references tims_user(id),
    constraint user_fk_2 foreign key (updated_by) references tims_user(id),
    constraint user_fk_3 foreign key (organization_type_id) references organization_type(id)
);


CREATE SEQUENCE IF NOT EXISTS tims_role_seq START 1000;

CREATE TABLE IF NOT EXISTS tims_role  (
    id                      INTEGER     NOT NULL PRIMARY KEY ,
    label                   TEXT        NOT NULL CHECK (char_length(label)  <= 255) UNIQUE,
    is_deleted              BOOLEAN     NOT NULL DEFAULT FALSE,
    version                 INTEGER     NOT NULL DEFAULT 1,
    created_by              INTEGER     NOT NULL,
    created_date            TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
    updated_by              INTEGER     NOT NULL,
    updated_date            TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
    constraint role_fk_1 foreign key (created_by) references tims_user(id),
    constraint role_fk_2 foreign key (updated_by) references tims_user(id)
);

CREATE TABLE IF NOT EXISTS tims_user_role(
    user_id                 INTEGER     NOT NULL,
    role_id                 INTEGER     NOT NULL,
    created_by              INTEGER     NOT NULL,
    created_date            TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
    CONSTRAINT pk_user_role PRIMARY KEY (user_id, role_id),
    constraint user_role_fk_1 foreign key (user_id) references tims_user(id),
    constraint user_role_fk_2 foreign key (role_id) references tims_role(id),
    constraint user_role_fk_3 foreign key (created_by) references tims_user(id)
);

-- Adding a table requires these statements to be run
-- Assumes that iat user has already been created in the database
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON ALL TABLES in schema public to "iat";
GRANT SELECT, UPDATE ON ALL SEQUENCES in schema public to "iat";
