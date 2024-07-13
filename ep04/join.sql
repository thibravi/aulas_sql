-- qual a receita de cada categoria de produto?
-- e o total de vendas? em unidades e pedidos?
-- considerando as vendas de 2017 e pedidos entregues

select 
    t2.product_category_name as categoria,
    round(sum(t1.price),2) as receita,
    count(*) as total_itens_vendidos,
    count(distinct t1.order_id) as qtde_pedidos,
    round(count(*) / cast(count(distinct t1.order_id) as float),2) as avg_item_por_pedido
    
from 
    tb_order_items as t1

    left join tb_products as t2
    on t1.product_id = t2.product_id

    left join tb_orders as t3
    on t1.order_id = t3.order_id

where  
    t3.order_status = 'delivered'
    and cast(strftime('%Y',t3.order_approved_at) as int) = '2017'

group by 
    t2.product_category_name

order by 
    avg_item_por_pedido desc 

