-- Faça uma query que apresente o tamanho médio, máximo e mínimo do nome do objeto por categoria. 
-- Considere apenas os objetos que tenham a descrição maior que 100. 
-- Exiba apenas as categorias com tamanho médio de descrição do objeto maior que 500 caracteres

select 
    product_category_name,
    product_description_lenght,
    round(avg(product_name_lenght),2) as tamanho_avg_nome,
    round(min(product_name_lenght),2) as tamanho_min_nome,
    round(max(product_name_lenght),2) as tamanho_max_nome

from 
    tb_products

where 
    product_description_lenght >= 100

group by 
    product_category_name

having avg(product_description_lenght) > 500

order by 
    tamanho_avg_nome