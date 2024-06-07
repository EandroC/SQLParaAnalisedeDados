-- SUBQUERY: Consulta embutida dentro de uma outra consulta, de forma aninhada.
-- Podem ser:
-- SUBQUERY NO WHERE
-- SUBQUERY COM WITH
-- SUBQUERY NO FROM
-- SUBQUERY NO SELECT

-- Exemplo 01
SELECT
	*
FROM
	sales.products
WHERE
	price = (SELECT MIN(price) FROM sales.products)
-- Essa subquery no WHERE deve retornar sempre apenas um valor.

-- Exemplo 02
WITH alguma_tabela AS (
	SELECT
		professional_status,
	(current_date - birth_date)/365 AS idade
	FROM
		sales.customers
)
SELECT
	professional_status,
	AVG(idade) AS idade_media
FROM
	alguma_tabela
GROUP BY 
	professional_status

-- Exemplo 03
SELECT
	professional_status,
	AVG(idade) AS idade_media
FROM(
	SELECT
		professional_status,
	(current_date - birth_date)/365 AS idade
	FROM
		sales.customers
) AS alguma_tabela
GROUP BY 
	professional_status
-- Toda subquery no FROM pode ser substituida por uma em FROM.

-- Exemplo 04
SELECT
	fun.visit_id,
	fun.visit_page_date,
	sto.store_name,
	(
	SELECT 
		COUNT(*)
	FROM
		sales.funnel AS fun2
	WHERE
		fun2.visit_page_date <= fun.visit_page_date
		AND
		fun2.store_id = fun.store_id
	) AS visitas_acumuladas
FROM
	sales.funnel AS fun
LEFT JOIN
	sales.stores AS sto
	ON
	fun.store_id = sto.store_id
ORDER BY
	sto.store_name, fun.visit_page_date
-- Subquerys no SELECT demoram muito, devem ser evitados quando possível.
-- ORDER BY não pode ser usada internamente.

-- MAIS EXEMPLOS WITH
-- Exemplo 01
WITH primeira_visita AS (
	SELECT
		customer_id,
		MIN(visit_page_date) AS visita_1
	FROM
		sales.funnel
	GROUP BY customer_id
)
SELECT
	visit_page_date,
	(fun.visit_page_date <> primeira_visita.visita_1) AS lead_recorrente,
	COUNT(*)
FROM sales.funnel AS fun
LEFT JOIN
	primeira_visita
	ON
	fun.customer_id = primeira_visita.customer_id
GROUP BY
	fun.visit_page_date, lead_recorrente
ORDER BY
	fun.visit_page_date DESC, lead_recorrente

-- Exemplo 02
WITH preco_medio AS (
	SELECT
		brand,
		AVG(price) as preco_medio_da_marca
	FROM
		sales.products
	GROUP BY
		brand
)
SELECT
	fun.visit_id,
	fun.visit_page_date,
	pro.brand,
	(pro.price*(1+fun.discount)) AS preco_final,
	preco_medio.preco_medio_da_marca,
	(pro.price*(1+fun.discount)) - preco_medio.preco_medio_da_marca AS preco_vs_media
FROM
	sales.funnel AS fun
LEFT JOIN
	sales.products AS pro
	ON
	fun.product_id = pro.product_id
LEFT JOIN
	preco_medio
	ON
	pro.brand = preco_medio.brand