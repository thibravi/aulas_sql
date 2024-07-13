-- faça uma query que apresente o tamanho médio, máximo e mínimo do nome do objeto por categoria
-- considere apenas os objetos que tenham a descrição maior que 100

select 
    product_category_name,
    round(avg(product_name_lenght),2) as tamanho_medio_nome,
    max(product_name_lenght) as tamanho_max_nome,
    min(product_name_lenght) as tamanho_min_nome

from 
    tb_products

where 
    product_description_lenght >= 100

group by 
    product_category_name