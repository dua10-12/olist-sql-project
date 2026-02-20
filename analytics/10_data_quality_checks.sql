-- GMV по месяцам
SELECT
    date_trunc('month', o.order_purchase_timestamp) AS month,
    SUM(p.payment_value) AS gmv
FROM orders o
JOIN payments p ON o.order_id = p.order_id
GROUP BY 1
ORDER BY 1;

-- накопительный GMV по месяцам
SELECT
    month,
    gmv,
    SUM(gmv) OVER (ORDER BY month) AS cumulative_gmv
FROM (
    SELECT
        date_trunc('month', o.order_purchase_timestamp) AS month,
        SUM(p.payment_value) AS gmv
    FROM orders o
    JOIN payments p ON o.order_id = p.order_id
    GROUP BY 1
) t
ORDER BY month;
