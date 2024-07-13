-- crie uma coluna nova que contenha a informação de volume em m3

select
    product_category_name,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm,
    product_length_cm * product_height_cm * product_width_cm / 1000000 as product_volume_m3

from 
    tb_products