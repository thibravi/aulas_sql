-- quais são os sellers que não venderam em dez/2017? considere vendas válidas (entregues)

SELECT
    t2.seller_id,
    t3.seller_state,
    max(CASE WHEN strftime('%Y-%m', t1.order_approved_at) = '2017-12' THEN 1
        ELSE 0
    END) AS flag_compra_12_2017

FROM
    tb_orders as t1

    LEFT JOIN tb_order_items as t2
    ON t1.order_id = t2.order_id

    LEFT JOIN tb_sellers as t3
    ON t3.seller_id = t2.seller_id


WHERE
    t1.order_approved_at < '2018-01-01'
    AND t1.order_status = 'delivered'

GROUP BY 
    t2.seller_id,
    t3.seller_state

HAVING 
    flag_compra_12_2017 = 0

ORDER BY
    t3.seller_state