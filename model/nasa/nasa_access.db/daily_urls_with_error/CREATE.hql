-- DROP TABLE IF EXISTS nasa_access.daily_urls_with_error ;
CREATE TABLE nasa_access.daily_urls_with_error(
  url STRING COMMENT "PK",
  file_extension STRING COMMENT "PK",
  nb_occurrences BIGINT,
  nb_dist_user BIGINT
)
PARTITIONED BY (day STRING)
STORED AS ORC
;


