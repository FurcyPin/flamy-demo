INSERT OVERWRITE TABLE nasa_access.daily_urls_with_error PARTITION(day = ${DAY})
SELECT 
  url,
  file_extension,
  COUNT(1) as nb_occurrences,
  COUNT(DISTINCT source_ip, source_url) as nb_dist_user
FROM nasa_access.daily_logs L
WHERE L.day = ${DAY}
  AND response_group IN ("Client Error", "Server Error")
GROUP BY url, file_extension
;

