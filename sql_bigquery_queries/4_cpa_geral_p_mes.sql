-- Unpivot estrutura da tabela (custo de leads por canal por mês)
WITH tt_cost_month AS (SELECT
                        month,
                        (Facebook_Campaigns + Google_Adwords___Brand_Campaigns + Google_Adwords___Non_Brand_Campaigns + Partners) AS cost
                      FROM `case-nuvem.bs.costs`),

-- Contabilizando clientes convertidos por mês
tt_clients_month AS (SELECT
                  tr.month,
                  COUNT(tr.trial_id) AS clients,
                FROM `case-nuvem.bs.trials` AS tr
                WHERE tr.payment_probability >= 0.75
                GROUP BY 1)

-- Calculo do CPL por mês
SELECT
  cl.month,
  cl.clients,
  ROUND(ct.cost,2) AS cost,
  ROUND((ct.cost/ cl.clients), 2) AS cpa_month
FROM tt_clients_month AS cl
LEFT JOIN tt_cost_month AS ct
  ON cl.month = ct.month
ORDER BY 1

