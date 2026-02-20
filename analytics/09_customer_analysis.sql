-- сколько клиентов сделали >1 заказ
-- процент повторных клиентов

SELECT 
    COUNT(*) AS customers_with_more_than_one_order
FROM (
    SELECT 
        customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(order_id) > 1
) t;

SELECT 
    (COUNT(*) * 100.0 / (SELECT COUNT(DISTINCT customer_id) FROM orders)) 
        AS percent_repeat_customers
FROM (
    SELECT 
        customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(order_id) > 1
) t;
