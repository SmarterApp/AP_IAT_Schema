-- The item.version 45 does not have a migration version.  This only happened due to development processes, and we need
-- to manually fix the issue.  Run this SQL in any environment that has item.version of 45

UPDATE item_migration_version
SET migration_version_id = 'iat-44'
where migration_version_id = '45';
