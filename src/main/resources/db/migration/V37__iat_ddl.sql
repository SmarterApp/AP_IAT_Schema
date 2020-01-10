-- IAT-3628: Update IAT DB to grant the iat user certain privileges on the public schema

ALTER DEFAULT PRIVILEGES
    IN SCHEMA public
    GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO iat;

ALTER DEFAULT PRIVILEGES
    IN SCHEMA public
    GRANT USAGE, SELECT ON SEQUENCES TO iat;