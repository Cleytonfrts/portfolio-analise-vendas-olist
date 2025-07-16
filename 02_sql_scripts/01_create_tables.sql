-- Script de Criação de Tabelas para o Data Warehouse Olist
-- Modelo: Esquema Estrela Puro com Chaves Substitutas

-- Tabela de Dimensão de Produtos
CREATE TABLE dim_products (
    product_sk INT PRIMARY KEY,
    product_id VARCHAR(50),
    product_category VARCHAR(255),
    product_name_length INT,
    product_description_length INT,
    product_photos_quantity INT,
    product_weight_grams INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);

-- Tabela de Dimensão de Clientes
CREATE TABLE dim_customers (
    customer_sk INT PRIMARY KEY,
    customer_id VARCHAR(50),
    customer_unique_id VARCHAR(50),
    zip_code_prefix VARCHAR(5),
    customer_city VARCHAR(255),
    customer_state VARCHAR(2)
);

-- Tabela de Dimensão de Vendedores
CREATE TABLE dim_sellers (
    seller_sk INT PRIMARY KEY,
    seller_id VARCHAR(50),
    zip_code_prefix VARCHAR(5),
    seller_city VARCHAR(255),
    seller_state VARCHAR(2)
);

-- Tabela de Dimensão de Pedidos
CREATE TABLE dim_orders (
    order_sk INT PRIMARY KEY,
    order_id VARCHAR(50),
    customer_id VARCHAR(50), -- Chave de negócio mantida para a carga inicial
    order_status VARCHAR(50),
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);

-- Tabela de Dimensão de Pagamentos
CREATE TABLE dim_payments (
    payment_sk INT PRIMARY KEY,
    order_id VARCHAR(50), -- Chave de negócio mantida para a carga inicial
    payment_sequential INT,
    payment_type VARCHAR(50),
    payment_installments INT,
    payment_value NUMERIC(10, 2)
);

-- Tabela Fato de Vendas
CREATE TABLE fact_sales (
    -- Chaves Estrangeiras que apontam para as dimensões
    order_sk INT NOT NULL,
    product_sk INT NOT NULL,
    customer_sk INT NOT NULL,
    seller_sk INT NOT NULL,
    payment_sk INT NOT NULL,

    -- Métricas e outros atributos do fato
    order_item_id INT,
    product_price NUMERIC(10, 2),
    freight_price NUMERIC(10, 2),
    shipping_deadline TIMESTAMP,

    -- Definição das Chaves Estrangeiras (FK)
    CONSTRAINT fk_orders FOREIGN KEY (order_sk) REFERENCES dim_orders (order_sk),
    CONSTRAINT fk_products FOREIGN KEY (product_sk) REFERENCES dim_products (product_sk),
    CONSTRAINT fk_customers FOREIGN KEY (customer_sk) REFERENCES dim_customers (customer_sk),
    CONSTRAINT fk_sellers FOREIGN KEY (seller_sk) REFERENCES dim_sellers (seller_sk),
    CONSTRAINT fk_payments FOREIGN KEY (payment_sk) REFERENCES dim_payments (payment_sk)
);