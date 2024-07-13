-- qual o valor total de receita de cada estado?
-- considere a base completa, com apenas pedidos entregues

SELECT 
    t2.customer_state as estado,
    round(sum(t3.price),2) as receita_total_estado,
    round(sum(t3.price) / count(distinct t1.customer_id),2) as avg_receita_cliente

FROM
    tb_orders as t1

    LEFT JOIN tb_customers as t2
    ON t1.customer_id = t2.customer_id

    LEFT JOIN tb_order_items as t3
    ON t1.order_id = t3.order_id


WHERE
    t1.order_status = 'delivered'

GROUP BY
    t2.customer_state

ORDER BY
    t2.customer_state