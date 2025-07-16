-- Pergunta 1: Qual o faturamento total por tipo de pagamento?
SELECT
    dp.payment_type,
    COUNT(fs.order_sk) AS total_de_pedidos,
    SUM(fs.product_price + fs.freight_price) AS faturamento_total
FROM
    fact_sales AS fs
JOIN
    dim_payments AS dp ON fs.payment_sk = dp.payment_sk
GROUP BY
    dp.payment_type
ORDER BY
    faturamento_total DESC;


-- Pergunta 2: Top 5 categorias de produtos mais vendidas em São Paulo (SP)
WITH sales_in_sp AS (
   
    SELECT
        fs.product_sk,
        fs.product_price
    FROM
        fact_sales AS fs
    JOIN
        dim_customers AS dc ON fs.customer_sk = dc.customer_sk
    WHERE
        dc.customer_state = 'SP'
)
SELECT
    dp.product_category,
    SUM(s_sp.product_price) AS faturamento_total_sp
FROM
    sales_in_sp AS s_sp
JOIN
    dim_products AS dp ON s_sp.product_sk = dp.product_sk
GROUP BY
    dp.product_category
ORDER BY
    faturamento_total_sp DESC
LIMIT 5; -- Pegamos apenas o Top 5


-- Criando uma VIEW para simplificar futuras análises
CREATE OR REPLACE VIEW v_sales_details AS
SELECT
    fs.order_sk,
    fs.product_sk,
    fs.customer_sk,
    ord.order_status,
    ord.order_purchase_timestamp,
    fs.product_price,
    fs.freight_price,
    dp.product_category,
    dc.customer_city,
    dc.customer_state
FROM
    fact_sales AS fs
JOIN
    dim_orders AS ord ON fs.order_sk = ord.order_sk
JOIN
    dim_products AS dp ON fs.product_sk = dp.product_sk
JOIN
    dim_customers AS dc ON fs.customer_sk = dc.customer_sk;