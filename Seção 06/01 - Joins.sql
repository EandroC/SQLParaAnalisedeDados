-- JOIN: Combina dados de tabelas com base em uma condição.
-- LEFT JOIN: Todos os registros da tabela à esquerda e seus correspondentes na tabela à direita.
-- INNER JOIN: Apenas os registros correspondentes em ambas as tabelas.
-- RIGHT JOIN: Todos os registros da tabela à direita e seus correspondentes na tabela à esquerda.
-- FULL JOIN: Todos os registros da tabela à direita e seus correspondentes na tabela à esquerda.

-- Exemplo 01
SELECT 
         t1.cpf, t1.name, t2.state
FROM
         temp_tables.tabela_1 AS t1
LEFT JOIN
         temp_tables.tabela_2 AS t2
ON
         t1.cpf = t2.cpf

-- Exemplo 02
SELECT 
         t1.cpf, t1.name, t2.state
FROM
         temp_tables.tabela_1 AS t1
INNER JOIN
         temp_tables.tabela_2 AS t2
ON
         t1.cpf = t2.cpf

-- Exemplo 03
SELECT 
         t1.cpf, t1.name, t2.state
FROM
         temp_tables.tabela_1 AS t1
RIGHT JOIN
         temp_tables.tabela_2 AS t2
ON
         t1.cpf = t2.cpf

-- Exemplo 04
SELECT 
         t2.cpf, t1.name, t2.state
FROM
         temp_tables.tabela_1 AS t1
FULL JOIN
         temp_tables.tabela_2 AS t2
ON
         t1.cpf = t2.cpf

-- MAIS EXEMPLOS LEFT JOIN
-- Exemplo 01
SELECT
          cus.professional_status,
          COUNT(fun.paid_date) AS pagamentos
FROM
           sales.funnel AS fun
LEFT JOIN 
           sales.customers AS cus
ON
            fun.customer_id = cus.customer_id 
GROUP BY
            cus.professional_status
ORDER BY
            pagamentos DESC

-- Exemplo 02
SELECT 
           ibge.gender, 
           COUNT(fun.paid_date) 
FROM 
           sales.funnel AS fun
LEFT JOIN 
           sales.customers AS cus 
ON
           fun.customer_id = cus.customer_id 
LEFT JOIN
           temp tables.ibge_genders AS ibge 
ON
           LOWER(cus.first_name) = ibge.first_name 
GROUP BY
           ibge.gender

-- Exemplo 03
SELECT
           reg.region,
           COUNT(fun.visit_page_date) AS visitas 
FROM
           sales.funnel AS fun 
LEFT JOIN
           sales.customers AS cus
ON
           fun.customer_id = cus.customer_id 
LEFT JOIN
           temp_tables.regions AS reg
ON
           LOWER(cus.city) = LOWER(reg.city) AND LOWER(cus.state) = LOWER(reg.state)
GROUP BY
            reg.region
ORDER BY
           visitas DESC