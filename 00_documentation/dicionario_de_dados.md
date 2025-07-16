# Dicionário de Dados - Data Warehouse Olist

Este documento descreve as tabelas e colunas do Data Warehouse construído no PostgreSQL.

## Convenção de Nomenclatura de Chaves

- **`_sk` (Surrogate Key / Chave Substituta):** É a chave primária única de cada tabela de dimensão. É um número inteiro gerado no processo de ETL para otimizar as relações e a performance do modelo.
- **`_id` (Business Key / Chave de Negócio):** É o identificador original do dado vindo do sistema de origem. É mantido para fins de rastreabilidade e auditoria.

## Tabelas

### Dimensões

-   **`dim_products`**: Armazena os atributos de cada produto único.
-   **`dim_customers`**: Contém os dados demográficos de cada cliente.
-   **`dim_sellers`**: Armazena os atributos de cada vendedor.
-   **`dim_orders`**: Contém os dados de status e os timestamps de cada pedido. A "dimensão de tempo" do nosso modelo.
-   **`dim_payments`**: Armazena os detalhes de cada transação de pagamento.

### Tabela Fato

-   **`fact_sales`**: É a tabela central do modelo. Cada linha representa um item vendido dentro de um pedido e contém as métricas de negócio (preço, frete) e as chaves estrangeiras que a conectam a todas as dimensões.