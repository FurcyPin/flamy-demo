-- DROP TABLE IF EXISTS nasa_access.daily_urls ;
CREATE TABLE nasa_access.daily_urls(
  url STRING COMMENT "PK",
  file_extension STRING COMMENT "PK",
  nb_occurrences BIGINT,
  nb_dist_user BIGINT
)
PARTITIONED BY (day STRING)
STORED AS ORC
;


