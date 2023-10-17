# marketing_campaign_assessment

# 1. Problema de Negócio

A empresa “Sales Machine” é uma empresa que fornece um ecossistema de e-commerce para empreendedores que querem criar sua loja online, incluindo a loja online propriamente, sistema de pagamentos, logística e etc. Alguns concorrentes diretos são VTEX, Loja Integrada e Nuvemshop.

Cenário: o time de Marketing da Sales Machine solicita então ajuda para melhorar a aquisição de clientes e fazer otimizações do investimento, além de pedir opinião sobre a performance nos últimos 20 meses.

Dado esse contexto e a partir dos dados disponíveis, irei definir os KPIs e em seguida avaliarei a performance durante o período.

Por fim, darei uma recomendação de estratégia para melhorar a performance dos times com base nestes KPIs.


# 2. Overview sobre os Dados

Para o essa análise foi utilizado 2 datasets disponíveis chamados de “trials” e “costs”. “Trials” tem uma lista de todas as lojas de prova (trials) que foram geradas nos últimos 20 meses. “Costs” tem os custos de Marketing para adquirir esses trials.

Definições:
- Source: canal de aquisição do trial.
- Device: dispositivo de criação da loja (Mobile ou Desktop).
- Payment Probability: a probabilidade de que um trial se torne um pagamento. Se o valor for maior ou igual que 0.75, significa que com certeza que a loja irá pagar.

# 3. Considerações, premissas e observações sobre os dados e a resolução

- Estou considerando que a base de dados “trials” são leads e uma conversão quando Payment Probability >= 0.75.
- Como só há disponível dados dos custos das campanhas (sem salário dos profissionais envolvidos, infraestrutura necessária e etc), não utilizarei o CAC, utilizarei o CPA para mensurar conversões.
- Considero também que para ter uma visão mais completa da performance das campanhas seria necessário ter dados para calcular o ROI e LTV.
- Não explorei muito a variável device por não considerar relevante para extração de insights acionáveis nesse contexto.

# 4. Solução: Definição dos KPIs para avaliação da performance

Farei a avaliação da performance de forma geral e por canal também, que considero mais útil.

Para a avaliação utilizarei os KPIs abaixo.

Desempenho geral:
- Lead / device / mês
- Cliente / device / mês
- Taxa de conversão / device / mês
- Leads / mês
- Clientes / mês
- Taxa de conversão / mês
- CPL / mês
- CPA / mês
- Custo / mês

Desempenho por canal:
- Leads / canal / mês
- Clientes / canal / mês
- Taxa de conversão / canal / mês
- CPL / canal / mês
- CPA / canal / mês
- Custo / canal / mês
