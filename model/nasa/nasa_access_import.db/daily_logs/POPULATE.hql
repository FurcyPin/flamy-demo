WITH parsed_data AS (
  SELECT 
  regexp_extract(line, "(?:([0-9]{1,3}[.][0-9]{1,3}[.][0-9]{1,3}[.][0-9]{1,3})|(.*?)) - - \\[(.*?)\\] \"([^ ]*) ?(.*?) *(?:HTTP([^\"]+))?\" ([0-9]+) ([-0-9]+)", 1) as source_ip,
  regexp_extract(line, "(?:([0-9]{1,3}[.][0-9]{1,3}[.][0-9]{1,3}[.][0-9]{1,3})|(.*?)) - - \\[(.*?)\\] \"([^ ]*) ?(.*?) *(?:HTTP([^\"]+))?\" ([0-9]+) ([-0-9]+)", 2) as source_url,
  regexp_extract(line, "(?:([0-9]{1,3}[.][0-9]{1,3}[.][0-9]{1,3}[.][0-9]{1,3})|(.*?)) - - \\[(.*?)\\] \"([^ ]*) ?(.*?) *(?:HTTP([^\"]+))?\" ([0-9]+) ([-0-9]+)", 3) as time,
  regexp_extract(line, "(?:([0-9]{1,3}[.][0-9]{1,3}[.][0-9]{1,3}[.][0-9]{1,3})|(.*?)) - - \\[(.*?)\\] \"([^ ]*) ?(.*?) *(?:HTTP([^\"]+))?\" ([0-9]+) ([-0-9]+)", 4) as action,
  regexp_extract(line, "(?:([0-9]{1,3}[.][0-9]{1,3}[.][0-9]{1,3}[.][0-9]{1,3})|(.*?)) - - \\[(.*?)\\] \"([^ ]*) ?(.*?) *(?:HTTP([^\"]+))?\" ([0-9]+) ([-0-9]+)", 5) as url,
  regexp_extract(line, "(?:([0-9]{1,3}[.][0-9]{1,3}[.][0-9]{1,3}[.][0-9]{1,3})|(.*?)) - - \\[(.*?)\\] \"([^ ]*) ?(.*?) *(?:HTTP([^\"]+))?\" ([0-9]+) ([-0-9]+)", 6) as protocol,
  regexp_extract(line, "(?:([0-9]{1,3}[.][0-9]{1,3}[.][0-9]{1,3}[.][0-9]{1,3})|(.*?)) - - \\[(.*?)\\] \"([^ ]*) ?(.*?) *(?:HTTP([^\"]+))?\" ([0-9]+) ([-0-9]+)", 7) as response,
  regexp_extract(line, "(?:([0-9]{1,3}[.][0-9]{1,3}[.][0-9]{1,3}[.][0-9]{1,3})|(.*?)) - - \\[(.*?)\\] \"([^ ]*) ?(.*?) *(?:HTTP([^\"]+))?\" ([0-9]+) ([-0-9]+)", 8) as size,
  line,
  month
  FROM nasa_access_import.raw_data
)
, typed_data AS (
  SELECT 
    source_ip,
    source_url,
    to_utc_timestamp(from_unixtime(unix_timestamp(time, "dd/MMM/yyyy:hh:mm:ss Z")), from_unixtime(unix_timestamp(current_date), "z")) as time,
    action,
    url,
    protocol,
    INT(response) as response_code,
    IF(size = "-", 0, INT(size)) as size,
    line    
  FROM parsed_data
)
INSERT OVERWRITE TABLE nasa_access_import.daily_logs PARTITION(day)
SELECT 
  source_ip,
  source_url,
  time,
  action,
  url,
  protocol,
  response_code,
  size,
  line,
  DATE(time) as day
FROM typed_data
WHERE DATE(time) IS NOT NULL
;

