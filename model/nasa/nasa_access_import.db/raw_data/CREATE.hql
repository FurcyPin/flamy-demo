-- DROP TABLE IF EXISTS nasa_access_import.raw_data ;
CREATE EXTERNAL TABLE nasa_access_import.raw_data(
  line STRING
)
PARTITIONED BY (month STRING)
STORED AS TEXTFILE
LOCATION "${EXTERNAL_DATA_LOCATION}/nasa_access_import.db/raw_data"
;
