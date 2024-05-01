-- SELECT: Seleciona dados de uma tabela.
-- Exemplo 01
SELECT 
	email
FROM 
	sales.customers

-- Exemplo 02
SELECT 
	first_name, last_name email
FROM 
	sales.customers

-- Exemplo 03
SELECT 
	*
FROM 
	sales.customers

-- DISTINCT: Retorna valores únicos de uma coluna.
-- Exemplo 01
SELECT DISTINCT
	brand
FROM 
	sales.products

-- Exemplo 02
SELECT DISTINCT
	brand, model_year
FROM 
	sales.products

-- WHERE: Filtra registros com base em condições específicas.
-- Exemplo 01
SELECT DISTINCT
	email, state
FROM 
	sales.customers
WHERE
	state = 'SC'

-- Exemplo 02
SELECT DISTINCT
	email, state
FROM 
	sales.customers
WHERE
	state = 'SC' OR state = 'MS'

-- Exemplo 03
SELECT DISTINCT
	email, state
FROM 
	sales.customers
WHERE
	(state = 'SC' OR state = 'MS') and birth_date < '1991-12-28'

-- Exemplo 04
SELECT DISTINCT 
	email, state
FROM 
	sales.customers
WHERE
	(state = 'SC' OR state = 'MS') and birth_date < '19911228'

-- ORDER BY: Classifica os resultados da consulta.
-- Exemplo 01
SELECT
	*
FROM
	sales.products
ORDER BY
	price

-- Exemplo 02
SELECT
	*
FROM
	sales.products
ORDER BY
	price DESC

-- Exemplo 03
SELECT
	DISTINCT state
FROM
	sales.customers
ORDER BY
	state

-- LIMIT:  Limita o número de linhas retornadas pela consulta.
-- Exemplo 01
SELECT
	*
FROM
	sales.funnel
LIMIT
	10

-- Exemplo 02
SELECT
	*
FROM
	sales.products
ORDER BY
	price DESC
LIMIT
	10