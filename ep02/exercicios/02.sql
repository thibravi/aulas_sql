-- faça uma query que apresente o tamanho médio, máximo e mínimo do nome do objeto por categoria

select 
    product_category_name,
    round(avg(product_name_lenght),2) as tamanho_medio_nome,
    max(product_name_lenght) as tamanho_max_nome,
    min(product_name_lenght) as tamanho_min_nome

from 
    tb_products

group by 
    product_category_name