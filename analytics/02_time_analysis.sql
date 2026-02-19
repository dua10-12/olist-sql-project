-- количество заказов по месяцам
SELECT
date_trunc('month', order_purchase_timestamp) AS month,
COUNT(order_id) AS orders_count
FROM orders
GROUP BY month
ORDER BY month;

-- рост заказов год к году
SELECT
date_trunc('year', order_purchase_timestamp) AS year,
COUNT(order_id) AS orders_count
FROM orders
GROUP BY year
ORDER BY year;

-- средний чек по месяцам
SELECT
date_trunc('month', o.order_purchase_timestamp) AS month,
AVG(p.payment_value) AS avg_check
FROM orders o
JOIN payments p ON o.order_id = p.order_id
GROUP BY month
ORDER BY month;