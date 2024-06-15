-- EXERCÍCIOS ###################################################################

-- (Exercício 1) Crie uma coluna calculada com o número de visitas realizadas por cada
-- cliente da tabela sales.customers
WITH qtd_visitas AS (
	SELECT customer_id, COUNT(*) as n_visitas
	FROM sales.funnel
	GROUP BY customer_id
)
SELECT
	cus.*,
	n_visitas
FROM sales.customers AS cus
LEFT JOIN qtd_visitas AS vis
	ON cus.customer_id = vis.customer_id