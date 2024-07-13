-- qual o produto mais caro que o seller já vendeu
-- considere pedidos entregues
-- uso do window function

with tb_seller_product as (
    select
        seller_id,
        product_id,
        count(*) as qtde_produto,
        sum(price) as receita_produto	

    from 
        tb_orders as t1

    left join tb_order_items as t2
    on t1.order_id = t2.order_id

    where 
        order_status = 'delivered'

    group by 
        seller_id,
        product_id

    order by seller_id
),

tb_seller_sort as (select 
    *,
    row_number() over (partition by seller_id 
                        order by qtde_produto desc, receita_produto) as orde_qtde    

from tb_seller_product
)

select 
    seller_id,
    product_id,
    qtde_produto

from 
    tb_seller_sort

where 
    orde_qtde = 1
    -- orde_qtde <= 5