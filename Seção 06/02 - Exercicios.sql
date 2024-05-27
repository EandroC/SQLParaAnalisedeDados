-- EXERCÍCIOS ##############################################################################

-- (Exercício 1) Identifique quais as marcas de veículo mais visitada na tabela sales.funnel
SELECT 
	pro.brand,
        COUNT(fun.visit_page_date) AS n_visitas
FROM
	sales.funnel AS fun
LEFT JOIN
	sales.products AS pro
ON
	fun.product_id = pro.product_id
GROUP BY
	pro.brand
ORDER BY
	n_visitas DESC

-- (Exercício 2) Identifique quais as lojas de veículo mais visitadas na tabela sales.funnel
SELECT 
	st.store_name,
    COUNT(fu.visit_page_date) AS n_visitas
FROM
	sales.funnel AS fu
LEFT JOIN
	sales.stores AS st
ON
	fu.store_id = st.store_id
GROUP BY
	st.store_id
ORDER BY
	n_visitas DESC

-- (Exercício 3) Identifique quantos clientes moram em cada tamanho de cidade (o porte da cidade
-- consta na coluna "size" da tabela temp_tables.regions)
SELECT
	re.size,
	COUNT(*) AS quantidade
FROM
	sales.customers AS cus
LEFT JOIN
	temp_tables.regions AS re
ON 
	LOWER(cus.city) = LOWER(re.city) AND LOWER(cus.state) = LOWER(re.state)
GROUP BY
	re.size
ORDER BY
	quantidade