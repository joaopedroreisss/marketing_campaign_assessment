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
              GROUP BY 1, 2) 

-- Pivot estrutura da tabela anterior (Cliente por canal por mês)
SELECT
  month,
  MAX(IF(source = 'Facebook Campaigns', clients, 0)) AS Facebook_Campaigns,
  MAX(IF(source = 'Google Adwords - Brand Campaigns', clients, 0)) AS Google_Adwords_Brand_Campaigns,
  MAX(IF(source = 'Google Adwords - Non Brand Campaigns', clients, 0)) AS Google_Adwords_Non_Brand_Campaigns,
  MAX(IF(source = 'Partners', clients, 0)) AS Partners
FROM base_clients
GROUP BY 1
ORDER BY 1;

