-- общий GMV
SELECT SUM(payment_value) AS total_gmv
FROM payments;

-- GMV по месяцам
SELECT
date_trunc('month', o.order_purchase_timestamp) AS month,
SUM(p.payment_value) AS gmv
FROM orders o
JOIN payments p ON o.order_id = p.order_id
GROUP BY month
ORDER BY month;

-- GMV по категориям
SELECT
pt.product_category_name_english AS category,
SUM(p.payment_value) AS gmv
FROM payments p
JOIN orders o ON p.order_id = o.order_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products pr ON oi.product_id = pr.product_id
LEFT JOIN product_category_translation pt
ON pr.product_category_name = pt.product_category_name
GROUP BY category
ORDER BY gmv DESC;

-- GMV по штатам клиентов
SELECT
c.customer_state,
SUM(p.payment_value) AS gmv
FROM payments p
JOIN orders o ON p.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY gmv DESC;