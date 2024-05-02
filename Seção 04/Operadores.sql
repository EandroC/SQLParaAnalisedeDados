-- OPERADORES ARITMÉTICOS: Realizam operações matemáticas.
-- + (adição): Soma dois valores.
-- - (subtração): Subtrai o segundo valor do primeiro.
-- * (multiplicação): Multiplica dois valores.
-- / (divisão): Divide o primeiro valor pelo segundo.
-- % (módulo): Retorna o resto da divisão entre dois valores.
-- Exemplo 01
SELECT
	email, 
	birth_date,
	(current_date - birth_date) / 366 AS idade
FROM
	sales.customers

-- Exemplo 02
SELECT
	email, 
	birth_date,
	(current_date - birth_date) / 366 AS "idade do cliente"
FROM
	sales.customers

-- Exemplo 03
SELECT
	email, 
	birth_date,
	(current_date - birth_date) / 366 AS "idade do cliente"
FROM
	sales.customers
ORDER BY 
	"idade do cliente"

-- O operador "||" geralmente é usado para concatenar strings em SQL. (não é aritméticos)
-- Exemplo 04
SELECT
	first_name||' '||last_name AS nome_completo
FROM
	sales.customers

-- OPERADORES DE COMPARAÇÃO: Comparando valores, eles retornam verdadeiro ou falso.
-- = (igual a): Verifica se dois valores são iguais.
-- != ou <> (diferente de): Verifica se dois valores são diferentes.
-- < (menor que): Verifica se o primeiro valor é menor que o segundo.
-- > (maior que): Verifica se o primeiro valor é maior que o segundo.
-- <= (menor ou igual a): Verifica se o primeiro valor é menor ou igual ao segundo.
-- >= (maior ou igual a): Verifica se o primeiro valor é maior ou igual ao segundo.
-- Exemplo 01
SELECT
	customer_id,
	first_name,
	professional_status,
	(professional_status= 'clt') AS cliente_clt
FROM
	sales.customers