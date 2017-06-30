-- DROP TABLE IF EXISTS nasa_access.daily_logs ;
CREATE TABLE nasa_access.daily_logs(
  source_ip STRING,
  source_url STRING,
  time TIMESTAMP ,
  action STRING,
  url STRING,
  file_extension STRING,
  protocol STRING,
  response_code INT,
  response_group STRING,
  size INT,
  line STRING
)
PARTITIONED BY (day STRING)
STORED AS ORC
;

