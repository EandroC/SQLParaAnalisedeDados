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