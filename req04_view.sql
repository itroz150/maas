CREATE MATERIALIZED VIEW "memorin"."outdated_devices" AS
SELECT
    "d"."serial_number",
    "d"."version_id",
    "v"."released_at",
    "v"."eol_timestamp",
    (
        SELECT COUNT(*)
        FROM "memorin"."device_versions"
        WHERE "released_at" > "v"."released_at"
    ) AS "versions_behind"
FROM "memorin"."devices" AS "d", "memorin"."device_versions" AS "v"
WHERE "d"."version_id" = "v"."id"
    AND "d"."deactivated_at" IS NULL
    AND "d"."version_id" != (
        SELECT "id"
        FROM "memorin"."device_versions"
        ORDER BY "released_at" DESC
        LIMIT 1
    );
