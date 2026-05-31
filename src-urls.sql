--For x² for independence
SELECT 
  SQLDATE as event_date,
  SOURCEURL as source_url,
  AvgTone as gdelt_automated_score,
FROM 
  `gdelt-bq.gdeltv2.events`
WHERE 
  (
    (Actor1CountryCode = 'IRN' AND Actor2CountryCode = 'USA')
    OR 
    (Actor1CountryCode = 'USA' AND Actor2CountryCode = 'IRN')
  )
  AND (
    (SQLDATE >= 20260101 AND SQLDATE <= 20260530)  
    OR 
    (SQLDATE >= 20160101 AND SQLDATE <= 20160529)
  )
ORDER BY 
  RAND()
LIMIT 30;
