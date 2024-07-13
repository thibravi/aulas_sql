-- qual o valor total de receita gerada por sellers de cada estado?
-- considere a base completa com apenas pedidos entregues

select 
    t3.seller_state,
    round(sum(t2.price),2) as receita_total,
    round(sum(t2.price) / count(distinct t2.seller_id),2) as avg_receita,
    count(distinct t2.seller_id) as qtde_sellers

from 
    tb_orders as t1

    left join tb_order_items as t2
    on t1.order_id = t2.order_id

    left join tb_sellers as t3
    on t2.seller_id = t3.seller_id


where 
    t1.order_status = 'delivered'


group by 
    t3.seller_state

order by 
    t3.seller_state