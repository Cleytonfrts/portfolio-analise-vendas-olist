# Análise de Vendas para E-commerce (Olist) - Projeto de Portfólio de Dados

## 1. Contexto do Projeto
Este projeto completo de Business Intelligence simula uma análise ponta a ponta dos dados de vendas da Olist, desde a extração e transformação dos dados (ETL) e construção de um Data Warehouse, até a criação de um dashboard interativo no Power BI para apoiar a tomada de decisão.

## 2. Ferramentas Utilizadas
* **ETL e Modelagem de Dados:** Power BI (Power Query)
* **Banco de Dados (DWH):** PostgreSQL
* **Análise e Consultas:** SQL
* **Visualização de Dados:** Power BI
* **Versionamento de Código:** Git & GitHub

## 3. Etapas do Projeto
1.  **ETL:** Os dados brutos foram extraídos de múltiplos arquivos CSV, limpos e transformados com o Power Query. Foram criadas chaves substitutas (Surrogate Keys) para otimizar o modelo e garantir a integridade.
2.  **Modelagem e DWH:** Foi projetado um Data Warehouse com um Esquema Estrela, e a estrutura foi construída em um banco de dados PostgreSQL, com definição de chaves primárias e estrangeiras.
3.  **Carga de Dados:** Os dados limpos e transformados foram carregados para as tabelas do PostgreSQL.
4.  **Análise SQL:** Foram criadas queries em SQL para responder perguntas de negócio (ex: Faturamento por tipo de pagamento, Top 5 categorias por estado) e uma VIEW (`v_sales_details`) foi construída para simplificar o acesso aos dados.
5.  **Dashboard:** Um dashboard interativo foi desenvolvido no Power BI, conectando-se diretamente ao Data Warehouse no PostgreSQL para apresentar os principais KPIs e insights de forma visual.

## 4. Principais Insights Encontrados
* **Insight 1:** O Cartão de Crédito é o método de pagamento dominante, respondendo pela grande maioria do faturamento da empresa.
* **Insight 2:** As categorias de produtos mais vendidas no estado de São Paulo são `utilidades_domesticas` e `esporte_lazer`, indicando um forte mercado para produtos domésticos e de bem-estar.
* **Insight 3 (Qualidade de Dados):** A análise revelou que um número significativo de vendas ocorre para produtos sem categoria designada ("Em branco"), representando uma oportunidade de melhoria no processo de cadastro de produtos da empresa.

## 5. Como Utilizar este Projeto
1.  Clone o repositório.
2.  Execute o script `01_create_tables.sql` em um banco de dados PostgreSQL para criar a estrutura do DWH.
3.  (Opcional) Realize o processo de carga dos dados para o banco.
4.  Abra o arquivo `.pbix` para visualizar e interagir com o dashboard final.