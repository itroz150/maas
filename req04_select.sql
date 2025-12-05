REFRESH MATERIALIZED VIEW "memorin"."outdated_devices";

SELECT * FROM "memorin"."outdated_devices"
ORDER BY "versions_behind" DESC, "serial_number";
