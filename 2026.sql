SELECT 
  PARSE_DATE('%Y%m%d', CAST(SQLDATE AS STRING)) as event_date,
  AVG(AvgTone) as avg_daily_tone,
  COUNT(*) as total_daily_events
FROM 
  `gdelt-bq.gdeltv2.events`
WHERE 
  (
    (Actor1CountryCode = 'IRN' AND Actor2CountryCode = 'USA')
    OR 
    (Actor1CountryCode = 'USA' AND Actor2CountryCode = 'IRN')
  )
  AND SQLDATE >= 20260101
  AND SQLDATE <= 20260530
GROUP BY 
  event_date
ORDER BY 
  event_date ASC;
  
