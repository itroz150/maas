CREATE RECURSIVE VIEW "memorin"."server_hierarchy" AS
SELECT
    "id",
    "zone_id",
    "core_count",
    "ram",
    "storage",
    "id" AS "data_center_id"
FROM "memorin"."servers"
WHERE "master_id" IS NULL

UNION ALL

SELECT
    "s"."id",
    "s"."zone_id",
    "s"."core_count",
    "s"."ram",
    "s"."storage",
    "h"."data_center_id"
FROM "memorin"."servers" AS "s", "memorin"."server_hierarchy" AS "h"
WHERE "s"."master_id" = "h"."id";
