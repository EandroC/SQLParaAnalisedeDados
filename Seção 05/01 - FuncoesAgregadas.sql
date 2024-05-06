-- FUNÇÕES DE AGREGAÇÃO: Buscam resumir e analisar dados em SQL
-- SUM: Calcula a soma dos valores em uma coluna.
-- AVG: Calcula a média dos valores em uma coluna.
-- COUNT: Conta o número de linhas em uma consulta, ou o número de valores não nulos em uma coluna.
-- MAX: Retorna o valor máximo em uma coluna.
-- MIN: Retorna o valor mínimo em uma coluna.

-- Exemplo 01
SELECT
	COUNT(*)
FROM
	sales.funnel

--Exemplo 02
SELECT
	COUNT(*)
FROM
	sales.funnel
WHERE
  paid_date IS NOT NULL

SELECT
	COUNT(paid_date)
FROM
	sales.funnel

-- Exemplo 03
SELECT
	COUNT(paid_date)
FROM
	sales.funnel
WHERE
	visit_page_date BETWEEN '2021-01-01' and '2021-01-31'

-- Exemplo 04
SELECT
	COUNT(DISTINCT paid_date)
FROM
	sales.funnel
WHERE
	visit_page_date BETWEEN '2021-01-01' and '2021-01-31'

-- Exemplo 05
SELECT
	MIN(price), MAX(price), AVG(price)
FROM
	sales.products

-- Exemplo 06
SELECT
	MAX(price)
FROM
	sales.products

-- Exemplo 07
SELECT 
	*
FROM
	sales.products
WHERE price = (SELECT
	       		MAX(price)
	       FROM
			sales.products)

-- GROUP BY: Agrupa linhas com valores semelhantes em uma ou mais colunas. 

-- Exemplo 01
SELECT 
	state, COUNT(*) as contagem
FROM
	sales.customers
GROUP BY 
	state
ORDER BY
	contagem DESC

-- Exemplo 02
SELECT 
	state, professional_status, COUNT(*) as contagem
FROM
	sales.customers
GROUP BY 
	state, professional_status
ORDER BY
	state, contagem DESC

SELECT 
	state, professional_status, COUNT(*) as contagem
FROM
	sales.customers
GROUP BY 
	1, 2
ORDER BY
	state, contagem DESC

-- Exemplo 03
SELECT 
	DISTINCT state
FROM
	sales.customers

SELECT 
	state
FROM
	sales.customers
GROUP BY
	state