CREATE TEMPORARY VIEW "devices_metrics" AS
SELECT
    "l"."device_serial",
    "l"."version_id",
    "l"."id" AS "log_id",
    "l"."latitude" AS "lat",
    "l"."longitude" AS "long",
    "l"."temperature" AS "temp",
    "l"."battery_percentage" AS "battery",
    "l"."signal_strength"
FROM "memorin"."device_logs" AS "l", "memorin"."devices" AS "d"
WHERE "l"."device_serial" = "d"."serial_number"
    AND "d"."deactivated_at" IS NULL
ORDER BY "l"."device_serial", "l"."version_id" DESC, "l"."id";
