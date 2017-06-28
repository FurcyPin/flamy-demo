INSERT OVERWRITE TABLE nasa_access.daily_url_error_rates PARTITION(day = ${DAY})
SELECT 
  U.url,
  U.file_extension,
  U.nb_occurrences as nb_access,
  E.nb_occurrences as nb_errors,
  1.0*E.nb_occurrences/U.nb_occurrences as error_rate
FROM nasa_access.daily_urls U
JOIN nasa_access.daily_urls_with_error E 
ON U.url = E.url AND U.file_extension = E.file_extension 
WHERE U.day = ${DAY}
  AND E.day = ${DAY}
;


