INSERT OVERWRITE TABLE nasa_access.daily_logs PARTITION(day = ${DAY})
SELECT 
  L.source_ip,
  L.source_url,
  L.time,
  L.action,
  regexp_extract(url, "(.*?)[.]([a-zA-Z]+)(?:[?].*)?\\z", 1) as url,
  regexp_extract(url, "(.*?)[.]([a-zA-Z]+)(?:[?].*)?\\z", 2) as file_extension,
  L.protocol,
  L.response_code,
  COALESCE(H.status_group, "unknown") as response_group,
  L.size,
  L.line
FROM nasa_access_import.daily_logs L
LEFT JOIN facts.http_status H
ON L.response_code = H.code
WHERE L.day = ${DAY}
;

