-- The previous flyway migration didn't properly copy the item migration version and this cleans it up

delete from item_migration_version
where item_migration_version.item_id in (SELECT i.item_id FROM item as i JOIN (select item_id, max(d.created_date) as "max_date" from item d where d.branch_name = 'master' group by d.item_id) as mdj on mdj.item_id = i.item_id and mdj.max_date = i.created_date WHERE i.is_deleted = true
);

-- Grant access to the new tables added in previous migrations
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON ALL TABLES in schema public to "iat";
GRANT SELECT, UPDATE ON ALL SEQUENCES in schema public to "iat";
