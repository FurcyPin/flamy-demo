-- DROP TABLE IF EXISTS nasa_access.daily_url_error_rates ;
CREATE TABLE nasa_access.daily_url_error_rates(
  url STRING COMMENT "PK",
  file_extension STRING COMMENT "PK",
  nb_access BIGINT,
  nb_errors BIGINT,
  error_rate DOUBLE
)
PARTITIONED BY (day STRING)
STORED AS ORC
;


