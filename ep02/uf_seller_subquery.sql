
SELECT 
    *
FROM (

SELECT  
    seller_state,
    count(*) as qtde_vendedores
    

FROM
    tb_sellers

--WHERE
    --seller_state in ('SP', 'RJ', 'PR')

GROUP BY
    seller_state

ORDER BY
    qtde_vendedores DESC

)

WHERE
    qtde_vendedores > 10