SELECT  
    seller_state,
    count(*) as qtde_vendedores
    

FROM
    tb_sellers

--filtro pré-agregação
WHERE
    seller_state in ('SP','RJ','PR')

GROUP BY
    seller_state

--filtro pós-agregação
HAVING
    count(*) > 10
    -- o having entra na agregação = count(*) as qtde_vendedores

ORDER BY
    qtde_vendedores DESC
