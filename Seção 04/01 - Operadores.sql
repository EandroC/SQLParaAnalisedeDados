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
-- = (igual a): Verifica se dois valores são exatamente iguais.
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

-- OPERADORES LÓGICOS: são usados para combinar ou negar condições em uma expressão.
-- AND: Retorna verdadeiro se todas as condições forem verdadeiras.
-- OR: Retorna verdadeiro se pelo menos uma das condições for verdadeira.
-- LIKE: Compara valores com padrões de strings, útil para pesquisa flexível.
-- BETWEEN: Verifica se um valor está dentro de um intervalo especificado.
-- IS NULL: Verifica se um valor é nulo.
-- IN: Verifica se um valor está presente em um conjunto de valores especificado.
-- NOT: Negativo, usado para negar uma condição.

-- Exemplo 01
-- Os exemplos a seguir tem o mesmo resultado, mas com formas diferentes de escrita.
-- Exemplo 01.a
SELECT
	*
FROM
	sales.products
WHERE 
	price>= 100000 AND price <=200000

-- Exemplo 01.b
SELECT
	*
FROM
	sales.products
WHERE 
	price BETWEEN 100000 AND 200000

-- Exemplo 02
-- Os exemplos a seguir tem o mesmo resultado, mas com formas diferentes de escrita.
-- Exemplo 02.a
SELECT
	*
FROM
	sales.products
WHERE 
	price < 100000 OR price > 200000

-- Exemplo 02.b
SELECT
	*
FROM
	sales.products
WHERE 
	price NOT BETWEEN 100000 AND 200000

-- Exemplo 03
-- Os exemplos a seguir tem o mesmo resultado, mas com formas diferentes de escrita.
-- Exemplo 03.a
SELECT
	*
FROM
	sales.products
WHERE 
	brand = 'HONDA' or brand = 'TOYOTA' or brand = 'RENAULT'

-- Exemplo 03.b
SELECT
	*
FROM
	sales.products
WHERE 
	brand IN ('HONDA', 'TOYOTA', 'RENAULT')

-- Exemplo 04
-- Negação do exemplo 03
SELECT
	*
FROM
	sales.products
WHERE 
	brand NOT IN ('HONDA', 'TOYOTA', 'RENAULT')

-- Exemplo 05
-- Nomes que iniciam com ANA
SELECT
	DISTINCT first_name
FROM
	sales.customers
WHERE 
	first_name LIKE 'ANA%'

-- Exemplo 06
-- Nomes que terminam com ANA
SELECT
	DISTINCT first_name
FROM
	sales.customers
WHERE 
	first_name LIKE '%ANA'

-- Exemplo 7
-- Nomes que iniciam com ANA ou ana
SELECT
	DISTINCT first_name
FROM
	sales.customers
WHERE 
	first_name ILIKE 'ana%'

-- Exemplo 8
SELECT
	*
FROM
	temp_tables.regions
WHERE
	population IS NULL

	