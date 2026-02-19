-- Среднее время доставки (от передачи курьеру до получения клиентом) по каждому продавцу
SELECT 
    oi.seller_id,
    AVG(o.order_delivered_customer_date - o.order_delivered_carrier_date) AS avg_delivery_time
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE 
    o.order_delivered_customer_date IS NOT NULL
    AND o.order_delivered_carrier_date IS NOT NULL
    AND o.order_delivered_customer_date >= o.order_delivered_carrier_date
GROUP BY oi.seller_id
ORDER BY avg_delivery_time;


-- Топ-5 штатов продавцов с самым долгим средним временем доставки
SELECT
    s.seller_state, -- штат продавца
    AVG(o.order_delivered_customer_date - o.order_delivered_carrier_date) AS avg_delivery_time
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN sellers s ON s.seller_id = oi.seller_id
WHERE
    o.order_delivered_customer_date IS NOT NULL
    AND o.order_delivered_carrier_date IS NOT NULL
    AND o.order_delivered_customer_date >= o.order_delivered_carrier_date
GROUP BY s.seller_state
ORDER BY avg_delivery_time DESC
LIMIT 5;