CREATE VIEW "memorin"."zoned_devices_logs" AS
SELECT
    "device_serial",
    "version_id",
    "zone_id",
    "latitude" AS "lat",
    "longitude" AS "long",
    "temperature" AS "temp",
    "battery_percentage" AS "battery",
    "signal_strength"
FROM "memorin"."device_logs"
WHERE "temperature" BETWEEN 34 AND 45
    AND "signal_strength" BETWEEN 0 AND 5
    AND "battery_percentage" BETWEEN 0 AND 100
    AND "device_serial" IN (
        SELECT "serial_number"
        FROM "memorin"."devices"
        WHERE "deactivated_at" IS NULL
    )
    AND "version_id" IN (
        SELECT "id"
        FROM "memorin"."device_versions"
    )
    AND EXISTS (
        SELECT 1
        FROM "memorin"."geographic_zones"
        WHERE "id" = "device_logs"."zone_id"
            AND "device_logs"."latitude" BETWEEN "min_latitude" AND "max_latitude"
            AND "device_logs"."longitude" BETWEEN "min_longitude" AND "max_longitude"
    )
WITH CHECK OPTION;
