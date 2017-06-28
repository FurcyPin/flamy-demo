-- DROP TABLE IF EXISTS facts.http_status ;
CREATE EXTERNAL TABLE facts.http_status (
  code INT,
  status_group STRING,
  message STRING,
  description STRING
)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION "${EXTERNAL_DATA_LOCATION}/facts.db/http_status"
;


