-- UNION:  Combina os resultados de duas ou mais consultas SELECT em uma única tabela de resultados.
-- UNION ALL:  Similar ao UNION, mas inclui todos os registros duplicados.

-- Exemplo 01
SELECT
	*
FROM
	sales.products
UNION
SELECT
	*
FROM
	temp_tables.products_2

-- Exemplo 02
SELECT
	*
FROM
	sales.products
UNION ALL
SELECT
	*
FROM
	temp_tables.products_2