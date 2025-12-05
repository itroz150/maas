CREATE VIEW "memorin"."zoned_devices_logs" AS
SELECT
    "l"."device_serial",
    "l"."version_id",
    "l"."zone_id",
    "l"."latitude" AS "lat",
    "l"."longitude" AS "long",
    "l"."temperature" AS "temp",
    "l"."battery_percentage" AS "battery",
    "l"."signal_strength"
FROM "memorin"."device_logs" AS "l", "memorin"."geographic_zones" AS "z", "memorin"."devices" AS "d", "memorin"."device_versions" AS "v"
WHERE "l"."zone_id" = "z"."id"
    AND "l"."device_serial" = "d"."serial_number"
    AND "l"."version_id" = "v"."id"
    AND "l"."temperature" BETWEEN 34 AND 45
    AND "l"."signal_strength" BETWEEN 0 AND 5
    AND "l"."battery_percentage" BETWEEN 0 AND 100
    AND "l"."latitude" BETWEEN "z"."min_latitude" AND "z"."max_latitude"
    AND "l"."longitude" BETWEEN "z"."min_longitude" AND "z"."max_longitude"
    AND "d"."deactivated_at" IS NULL
WITH CHECK OPTION;
