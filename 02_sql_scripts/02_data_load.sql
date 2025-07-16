COPY nome_da_tabela -- 1. Tabela de Destino
FROM '/caminho/absoluto/para/o/arquivo.csv' -- 2. Caminho do Arquivo
WITH (
    FORMAT CSV, -- 3. Formato do arquivo
    HEADER TRUE, -- 4. Indica que a primeira linha é o cabeçalho
    DELIMITER ',', -- 5. Especifica o delimitador (geralmente vírgula)
    ENCODING 'UTF8' -- 6. Especifica a codificação do arquivo
);