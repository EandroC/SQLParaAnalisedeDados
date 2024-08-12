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
