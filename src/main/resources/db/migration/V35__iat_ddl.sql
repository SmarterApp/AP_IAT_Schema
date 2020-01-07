/**
Populates the item migration version table with the current migration version for all items
 */

INSERT INTO item_migration_version ( item_id, migration_version_id, created_by, updated_by )
SELECT
    i.item_id, item_json ->> 'version', 'tims-flyway', 'tims-flyway' FROM item as i
JOIN
    (select item_id, max(d.created_date) as "max_date" from item d where d.branch_name = 'master' group by d.item_id) as mdj on mdj.item_id = i.item_id and mdj.max_date = i.created_date
WHERE
    i.branch_name = 'master';