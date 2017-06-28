-- DROP TABLE IF EXISTS nasa_access_import.daily_logs ;
CREATE TABLE nasa_access_import.daily_logs(
  source_ip STRING,
  source_url STRING,
  time TIMESTAMP ,
  action STRING,
  url STRING,
  protocol STRING,
  response_code INT,
  size INT,
  line STRING
)
PARTITIONED BY (day STRING)
STORED AS ORC
;


