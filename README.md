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

## Performance por Device (Leads, Clientes e Taxa de Conversão) 

Conforme os gráficos nº 1 e 2 abaixo,  a respeito do Device, analisando a performance sem quebrar por canal, nota-se que ambos dispositivos apresentaram tendência de crescimento dos leads mensais, mas se tratando de clientes, o Desktop apresentou tendência de crescimento mais significativa se comparado ao Mobile, que devido às proporções do gráfico aparenta estagnação, mas observando os número notamos tendência de crescimento sutil.

### Gráfico 1
![chart_1](charts/1_pfm_leads_device.png)

### Gráfico 2
![chart_1](charts/2_pfm_clientes_device.png)

Além disso, ao analisar o gráfico nº 3 abaixo, referente a performance de conversão (leads/clientes) por device, ambos dispositivos aparentam quase uma estagnação, mas nota-se sutil tendência de queda do Desktop e sutil tendência de alta do Mobile.

### Gráfico 3
![chart_1](charts/3_pfm_conversao_device.png)

## Performance Geral (Leads, CPL e Custos)

Conforme o gráfico nº 4 abaixo, analisando a performance geral, sem quebrar por canal, notamos a tendência de crescimento de leads mensais, em contrapartida, nota-se o crescente custo até o mês 5, mas do mês 7 ao 10 nota-se diminuição nos custos, porém a quantidade de leads mantém a tendência de crescimento em todo o período, apresentando fraca correlação negativa com os custos (-41,21%), algo positivo que ajuda a reduzir o CPL. A partir do mês 13 nota-se tendência de crescimento nos custos, mas que não altera ou acentua os leads que já estavam em tendência crescente. Principalmente nos meses 19 e 20 nota-se um pico nos custos que só reflete no aumento do CPL, sem consequência no crescimento significativo equivalente dos leads. 

### Gráfico 4
![chart_1](charts/4_pfm_Leads_CPL_Custos.png)

Conforme as tabelas nº 1, 2 e 3 abaixo, nota-se uma performance positiva ao final do período, com CPL quase 17% menor que o mês 1, porém o mês 14 (com um círculo no gráfico)  que apresentou o período de melhor performance com CPL 30,65% menor que o mês 1. Porém, fatores como sazonalidade podem distorcer a realidade ao comparar períodos curtos e diferentes, em função disso, ao comparar o semestre do fim do período com o do início conforme a tabela, obtemos um CPL ainda melhor, de 38,20% menor que o início, reforçando a situação positiva.

#### Tabela 1 - CPL, Leads e Custos
![chart_1](tables/t_1.png)

### Tabela 2 - CPL, Leads e Custos
![chart_1](tables/t_2.png)

### Tabela 3 - CPL, Leads e Custos
![chart_1](tables/t_3.png)
