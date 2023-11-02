-- Unpivot estrutura da tabela (custo de leads por canal por mês)
WITH upvt_costs AS (SELECT month, "Google Adwords - Brand Campaigns" AS source, Google_Adwords___Brand_Campaigns AS value FROM `case-nuvem.bs.costs`
                    UNION ALL
                    SELECT month, "Google Adwords - Non Brand Campaigns" AS source, Google_Adwords___Non_Brand_Campaigns AS value FROM `case-nuvem.bs.costs`
                    UNION ALL
                    SELECT month, "Facebook Campaigns" AS source, Facebook_Campaigns AS value FROM `case-nuvem.bs.costs`
                    UNION ALL
                    SELECT month, "Partners" AS source, Partners AS value FROM `case-nuvem.bs.costs`),

-- Contabilizando Clientes convertidos por canal por mês
base_clients AS (SELECT
                tr.month,
                tr.source,
                COUNT(tr.trial_id) AS clients
              FROM `case-nuvem.bs.trials` AS tr
              LEFT JOIN upvt_costs AS ct
                ON (tr.month = ct.month) AND (tr.source = ct.source)
              WHERE tr.payment_probability >= 0.75
              GROUP BY 1, 2),

-- Unindos bases de clientes e cost
base_clients_cost AS (SELECT
                    bcl.month,
                    bcl.source,
                    bcl.clients,
                    bc.value AS cost
                  FROM base_clients AS bcl
                  LEFT JOIN upvt_costs AS bc
                  ON (bcl.source = bc.source) AND (bcl.month = bc.month)),

-- Calculo do CPA
base_cpa AS (SELECT
              month,
              source,
              ROUND((cost/ clients),2) AS cpa
            FROM base_clients_cost)       

-- Pivot estrutura da tabela anterior (CPA por canal por mês)
SELECT
  month,
  MAX(IF(source = 'Facebook Campaigns', cpa, 0)) AS Facebook_Campaigns,
  MAX(IF(source = 'Google Adwords - Brand Campaigns', cpa, 0)) AS Google_Adwords_Brand_Campaigns,
  MAX(IF(source = 'Google Adwords - Non Brand Campaigns', cpa, 0)) AS Google_Adwords_Non_Brand_Campaigns,
  MAX(IF(source = 'Partners', cpa, 0)) AS Partners
FROM base_cpa
GROUP BY 1
ORDER BY 1;

