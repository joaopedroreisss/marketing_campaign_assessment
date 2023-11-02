-- Unpivot estrutura da tabela (custo de leads por canal por mês)
WITH upvt_costs AS (SELECT month, "Google_Adwords___Brand_Campaigns" AS source, Google_Adwords___Brand_Campaigns AS value FROM `case-nuvem.bs.costs`
                    UNION ALL
                    SELECT month, "Google_Adwords___Non_Brand_Campaigns" AS source, Google_Adwords___Non_Brand_Campaigns AS value FROM `case-nuvem.bs.costs`
                    UNION ALL
                    SELECT month, "Facebook_Campaigns" AS source, Facebook_Campaigns AS value FROM `case-nuvem.bs.costs`
                    UNION ALL
                    SELECT month, "Partners" AS source, Partners AS value FROM `case-nuvem.bs.costs`),

-- Contabilizando Leads por canal por mês
base_lead AS (SELECT
                tr.month,
                tr.source,
                COUNT(tr.trial_id) AS leads
              FROM `case-nuvem.bs.trials` AS tr
              LEFT JOIN upvt_costs AS ct
                ON (tr.month = ct.month) AND (tr.source = ct.source)
              GROUP BY 1, 2)

-- Pivot estrutura da tabela anterior (Leads por canal por mês)
SELECT
  month,
  MAX(IF(source = 'Facebook Campaigns', leads, NULL)) AS Facebook_Campaigns,
  MAX(IF(source = 'Google Adwords - Brand Campaigns', leads, NULL)) AS Google_Adwords_Brand_Campaigns,
  MAX(IF(source = 'Google Adwords - Non Brand Campaigns', leads, NULL)) AS Google_Adwords_Non_Brand_Campaigns,
  MAX(IF(source = 'Partners', leads, NULL)) AS Partners
FROM base_lead
GROUP BY 1
ORDER BY 1;
