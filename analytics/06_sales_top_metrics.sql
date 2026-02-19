* топ-10 товаров по выручке
* топ-10 категорий
* категории с самым высоким AOV(средняя стоимость заказа)


SELECT 
    pr.product_category_name,
    SUM(p.payment_value) AS payment_category
FROM payments p
JOIN order_items oi ON p.order_id = oi.order_id
JOIN products pr ON oi.product_id = pr.product_id
GROUP BY pr.product_category_name
ORDER BY payment_category DESC LIMIT 10;


SELECT 
    pr.product_category_name,
    COUNT(oi.product_id) AS count_of_product
FROM products pr
JOIN order_items oi ON oi.product_id = pr.product_id
JOIN orders o ON o.order_id = oi.order_id
GROUP BY pr.product_category_name
ORDER BY count_of_product DESC
LIMIT 10;


SELECT 
    pr.product_category_name,
    AVG(p.payment_value) AS AOV
FROM payments p
JOIN order_items oi ON p.order_id = oi.order_id
JOIN products pr ON oi.product_id = pr.product_id
GROUP BY pr.product_category_name
ORDER BY AOV DESC LIMIT 10;