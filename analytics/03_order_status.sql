-- сколько delivered / canceled / unavailable
SELECT order_status, COUNT(*)
FROM orders
GROUP BY order_status;

-- процент отмен
SELECT
COUNT(*) FILTER (WHERE order_status = 'canceled') * 100.0 / COUNT(*) AS canceled_percent
FROM orders;