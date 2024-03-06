SELECT 
    products_id, 
    date_date, 
    orders_id,
    revenue, 
    quantity, 
    CAST(purchse_price AS FLOAT64) AS purchse_price, 
    ROUND(s.quantity*CAST(p.purchse_price AS FLOAT64),2) AS purchase_cost,
    ROUND(s.revenue - ROUND(s.quantity*CAST(p.purchse_price AS FLOAT64),2), 2) AS margin
FROM {{ ref('stg_gz_raw_data__raw_gz_sales') }} s
LEFT JOIN {{ ref('stg_gz_raw_data__raw_gz_product') }} p 
    USING (products_id)

