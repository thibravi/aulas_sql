-- Quais são as cidades dos clientes que fizeram pedidos?

SELECT
    o.order_id,
    c.customer_id,
    c.customer_city
FROM
    tb_orders o
LEFT JOIN
    tb_customers c ON c.customer_id = o.customer_id
WHERE
    o.order_status IS NOT NULL
LIMIT 100;
