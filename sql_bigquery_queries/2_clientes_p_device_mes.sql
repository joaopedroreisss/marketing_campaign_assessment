-- contabilizar trials agg by device by month (filtrando ppbb >= 0.75)

SELECT
  month,
  COUNT(IF(device='Desktop',trial_id,NULL))AS desktop,
  COUNT(IF(device='Mobile',trial_id,NULL)) AS mobile
FROM `case-nuvem.bs.trials`
WHERE payment_probability >= 0.75
GROUP BY 1
ORDER BY 1