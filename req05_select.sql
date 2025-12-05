SELECT
    "z"."name" AS "zone_name",
    COUNT(DISTINCT "h"."data_center_id") AS "data_center_count",
    COUNT("h"."id") AS "total_servers",
    SUM("h"."core_count") AS "total_cores",
    SUM("h"."ram") AS "total_ram",
    SUM("h"."storage") AS "total_storage"
FROM "memorin"."server_hierarchy" AS "h", "memorin"."geographic_zones" AS "z"
WHERE "h"."zone_id" = "z"."id"
GROUP BY "z"."name"
ORDER BY "data_center_count" DESC, "total_servers" DESC, "zone_name";
