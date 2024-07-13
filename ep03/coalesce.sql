select distinct 
    coalesce(product_category_name, 'outros') as categoria_fillna -- substitui o que encontrar de null por outros

from 
    tb_products

order by 
    product_category_name