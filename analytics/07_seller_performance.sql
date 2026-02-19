-- Топ-20 продавцов по обороту (GMV)
SELECT
    oi.seller_id,
    SUM(oi.price) AS gmv
FROM order_items oi
GROUP BY oi.seller_id
ORDER BY gmv DESC
LIMIT 20;

-- Средний GMV (выручка) на одного продавца
SELECT
    AVG(gmv) AS avg_gmv_per_seller
FROM (
    SELECT
        seller_id,
        SUM(price) AS gmv
    FROM order_items
    GROUP BY seller_id
) t;

-- Распределение выручки среди всех продавцов
SELECT
    seller_id,
    SUM(price) AS gmv
FROM order_items
GROUP BY seller_id
ORDER BY gmv DESC;
