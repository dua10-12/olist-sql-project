--поиск пропусков
SELECT *
FROM orders
WHERE order_purchase_timestamp IS NULL;

--Отрицательные цены
SELECT *
FROM order_items
WHERE price < 0;

--Странные веса товаров
SELECT *
FROM products
WHERE product_weight_g <= 0
   OR product_weight_g > 50000;  -- например >50 кг подозрительно

--Orders без order_items
/*
Это значит заказ существует, а товаров внутри нет.
Такие заказы ошибочные или отменённые.
*/
SELECT o.order_id
FROM orders o
LEFT JOIN order_items oi ON o.order_id = oi.order_id
WHERE oi.order_id IS NULL;


