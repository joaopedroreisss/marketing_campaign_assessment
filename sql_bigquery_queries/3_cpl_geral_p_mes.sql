-- Unpivot estrutura da tabela (custo de leads por canal por mês)
WITH tt_cost_month AS (SELECT
                        month,
                        (Facebook_Campaigns + Google_Adwords___Brand_Campaigns + Google_Adwords___Non_Brand_Campaigns + Partners) AS cost
                      FROM `case-nuvem.bs.costs`),

-- Contabilizando Leads por mês
tt_leads_month AS (SELECT
                  tr.month,
                  COUNT(tr.trial_id) AS leads,
                FROM `case-nuvem.bs.trials` AS tr
                GROUP BY 1)

-- Calculo do CPL por mês
SELECT
  ld.month,
  ld.leads,
  ROUND(ct.cost,2) AS cost,
  ROUND((ct.cost/ ld.leads), 2) AS cpl_month
FROM tt_leads_month AS ld
LEFT JOIN tt_cost_month AS ct
  ON ld.month = ct.month
ORDER BY 1

