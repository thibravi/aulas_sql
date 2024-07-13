select 
    product_category_name,
    count(*) as qtde_produto,
    max(product_weight_g) as maior_peso,
    min(product_weight_g) as menor_peso,
    round(avg(product_weight_g),2) as media_peso

from 
    tb_products

WHERE
    product_category_name is not null
    and product_category_name != 'alimentos'
    and product_category_name <> 'artes'

group by 
    product_category_name