-- Qual é o valor total de vendas (considerando todas as formas de pagamento) para cada cidade dos clientes que fizeram pedidos?

SELECT
    --oi.order_id,
    round(sum(oi.price),2) as total_vendas,
    c.customer_city
FROM
    tb_orders o
LEFT JOIN
    tb_customers c ON c.customer_id = o.customer_id

LEFT JOIN
    tb_order_items oi ON oi.order_id = o.order_id
WHERE
    o.order_status IS NOT NULL

GROUP BY
    c.customer_city

ORDER BY
    total_vendas DESC

LIMIT 100