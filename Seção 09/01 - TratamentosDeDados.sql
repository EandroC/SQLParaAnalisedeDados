-- TRATAMENTO DE DADOS
-- Conversão de Unidades
-- Exemplo 01
SELECT
	'2021-10-01'::DATE - '2021-02-01'::DATE

-- Exemplo 02
SELECT
	'100'::NUMERIC - '10'::NUMERIC

-- Exemplo 03
SELECT
	REPLACE(112122::TEXT, '1', 'A')

-- Caso o metodo '::' produza algum erro.
-- Exemplo 04
SELECT
	CAST('2021-10-01' AS DATE) - CAST('2021-02-01' AS DATE)

-- Tratamento de Geral
-- Exemplo 01
WITH faixa_de_renda AS(
	SELECT
		income,
		CASE
			WHEN income < 5000 THEN '0-5000'
			WHEN income >= 5000 AND income < 10000 THEN '5000-10000'
			WHEN income >= 10000 AND income < 15000 THEN '10000-15000'
			ELSE '15000+'
			END AS faixa_renda
	FROM
		sales.customers
)
SELECT
	faixa_renda, COUNT(*)
FROM
	faixa_de_renda
GROUP BY
	faixa_renda

-- Exemplo 02
SELECT
	*,
	CASE	
		WHEN population is not null THEN population
		else (SELECT AVG(population) FROM temp_tables.regions)
		END AS populacao_ajustada
FROM
	temp_tables.regions

-- EXEMPLO 03
SELECT
	*,
	COALESCE(population, (SELECT AVG(population) from temp_tables.regions)) as populacao_ajustada
FROM
	temp_tables.regions
WHERE
	population IS NULL

-- Tratamento de Texto
-- UPPER: Converte todos os caracteres de uma string para maiúsculas.
-- LOWER:  Converte todos os caracteres de uma string para minúsculas.
-- TRIM: Remove espaços em branco do início e/ou fim de uma string.
-- REPLACE: Substitui todas as ocorrências de um determinado substring por outro substring dentro de uma string.
-- Exemplo 01
SELECT 
	UPPER('São Paulo') = 'SÃO PAULO'

-- Exemplo 02
SELECT 
	LOWER('São Paulo') = 'são paulo'

-- Exemplo 03
SELECT 
	TRIM('São Paulo    ') = 'São Paulo'

-- Exemplo 04
SELECT 
	REPLACE('Sao Paulo', 'Sao', 'São') = 'São Paulo'

-- Tratamento de Datas
-- INTERVAL: Define um período de tempo, usado para somar/subtrair datas.
-- DATE_TRUNC:Trunca datas/timestamps para uma unidade de tempo específica.
-- EXTRACT: Extrai partes de datas/timestamps, como ano ou mês.
-- Exemplo 01
SELECT
	current_date + INTERVAL'10 weeks'

-- Exemplo 02
SELECT
	(current_date + INTERVAL'10 weeks')::date

-- Exemplo 03
SELECT
	(current_date + INTERVAL'10 months')::date

-- Exemplo 04
SELECT
	current_date + INTERVAL'10 hours'

-- Exemplo 05
SELECT
	visit_page_date,
	DATE_TRUNC('month', visit_page_date)::date
FROM
	sales.funnel

-- Exemplo 06
SELECT
	DATE_TRUNC('month', visit_page_date)::date AS visit_page_month,
	COUNT(*)
FROM
	sales.funnel
GROUP BY
	visit_page_month
ORDER BY
	visit_page_month DESC

-- Exemplo 07
SELECT
	'2022-01-30'::date,
	EXTRACT('dow' FROM '2022-01-30'::date)

-- Exemplo 08
SELECT
	current_date,
	EXTRACT('dow' FROM current_date)

-- Exemplo 09
SELECT
	EXTRACT('dow' FROM visit_page_date) as dia_da_semana,
	COUNT(*)
FROM
	sales.funnel
GROUP BY
	dia_da_semana
ORDER BY
	dia_da_semana

-- Exemplo 10
-- Por dia
SELECT
	(current_date - '2018-06-01')

-- Exemplo 11
-- Por semanas
SELECT
	(current_date - '2018-06-01')/7

-- Exemplo 12
-- Por meses
SELECT
	(current_date - '2018-06-01')/30

-- Exemplo 13
-- Por ano
SELECT
	(current_date - '2018-06-01')/365

-- Exemplo 14
-- Postgres não possui essa função
SELECT
	DATEDIFF('weeks', '2018-06-01', current_date)

-- Criação de funções
-- Criando a função
CREATE FUNCTION datediff(unidade varchar, data_inicial date, data_final date)
RETURNS integer
LANGUAGE sql
AS
$$
	SELECT
		CASE
			WHEN unidade IN('d', 'days', 'day') THEN (data_inicial - data_final)
			WHEN unidade IN('w', 'weeks', 'week') THEN (data_inicial - data_final)/7
			WHEN unidade IN('m', 'months', 'month') THEN (data_inicial - data_final)/30
			WHEN unidade IN('y', 'years', 'year') THEN (data_inicial - data_final)/365
			END AS diferenca
$$

-- Utilizando a função criada
SELECT
	datediff('weeks', '2018-06-01', current_date)

-- Caso precise apagar a função criada
DROP FUNCTION datediff


