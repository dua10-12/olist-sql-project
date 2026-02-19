-- средний чек общий
SELECT AVG(payment_value) AS avg_check_total
FROM payments;

-- средний чек по категориям
SELECT
pr.product_category_name,
AVG(p.payment_value) AS avg_check
FROM payments p
JOIN orders o ON p.order_id = o.order_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products pr ON oi.product_id = pr.product_id
GROUP BY pr.product_category_name
ORDER BY avg_check DESC;

-- средний чек по регионам
SELECT
c.customer_state,
AVG(p.payment_value) AS avg_check
FROM payments p
JOIN orders o ON p.order_id = o.order_id
JOIN customers c ON c.customer_id = o.customer_id
GROUP BY c.customer_state
ORDER BY avg_check DESC;
