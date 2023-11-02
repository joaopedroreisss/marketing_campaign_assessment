-- contabilizar trials agg by device by month
SELECT
  month,
  COUNT(IF(device='Desktop',trial_id,NULL))AS desktop,
  COUNT(IF(device='Mobile',trial_id,NULL)) AS mobile
FROM `case-nuvem.bs.trials`
GROUP BY 1
ORDER BY 1
