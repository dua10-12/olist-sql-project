-- месячный AOV

WITH monthly AS (
    SELECT
        date_trunc('month', o.order_purchase_timestamp) AS month,
        SUM(p.payment_value) AS gmv,
        COUNT(o.order_id) AS orders_count,
        -- перевод к numeric, чтобы не потерять дробную часть при делении
        SUM(p.payment_value)::NUMERIC / COUNT(o.order_id) AS aov
    FROM orders o
    JOIN payments p ON o.order_id = p.order_id
    GROUP BY 1
)
SELECT * FROM monthly;



-- скользящий AOV (3 месяца)

SELECT
    month,
    aov,
    AVG(aov) OVER (
        ORDER BY month
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_avg_aov_3m
FROM monthly
ORDER BY month;
