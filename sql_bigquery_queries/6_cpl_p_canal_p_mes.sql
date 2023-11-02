-- Unpivot estrutura da tabela (custo de leads por canal por mês)
WITH upvt_costs AS (SELECT month, "Google Adwords - Brand Campaigns" AS source, Google_Adwords___Brand_Campaigns AS value FROM `case-nuvem.bs.costs`
                    UNION ALL
                    SELECT month, "Google Adwords - Non Brand Campaigns" AS source, Google_Adwords___Non_Brand_Campaigns AS value FROM `case-nuvem.bs.costs`
                    UNION ALL
                    SELECT month, "Facebook Campaigns" AS source, Facebook_Campaigns AS value FROM `case-nuvem.bs.costs`
                    UNION ALL
                    SELECT month, "Partners" AS source, Partners AS value FROM `case-nuvem.bs.costs`),

-- Contabilizando Leads por canal por mês
base_leads AS (SELECT
                tr.month,
                tr.source,
                COUNT(tr.trial_id) AS leads
              FROM `case-nuvem.bs.trials` AS tr
              LEFT JOIN upvt_costs AS ct
                ON (tr.month = ct.month) AND (tr.source = ct.source)
              GROUP BY 1, 2),

-- Unindos bases de leads e cost
base_lead_cost AS (SELECT
                    bl.month,
                    bl.source,
                    bl.leads,
                    bc.value AS cost
                  FROM base_leads AS bl
                  LEFT JOIN upvt_costs AS bc
                  ON (bl.source = bc.source) AND (bl.month = bc.month)),

-- Calculo do CPL
base_cpl AS (SELECT
              month,
              source,
              ROUND((cost/ leads),2) AS cpl
            FROM base_lead_cost)


-- Pivot estrutura da tabela anterior (CPL por canal por mês)
SELECT
  month,
  MAX(IF(source = 'Facebook Campaigns', cpl, NULL)) AS Facebook_Campaigns,
  MAX(IF(source = 'Google Adwords - Brand Campaigns', cpl, NULL)) AS Google_Adwords_Brand_Campaigns,
  MAX(IF(source = 'Google Adwords - Non Brand Campaigns', cpl, NULL)) AS Google_Adwords_Non_Brand_Campaigns,
  MAX(IF(source = 'Partners', cpl, NULL)) AS Partners
FROM base_cpl
GROUP BY 1
ORDER BY 1;
