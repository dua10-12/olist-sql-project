DROP TABLE IF EXISTS order_features;

CREATE TABLE order_features AS
WITH item_agg AS (
    -- Агрегация товаров внутри заказа
    SELECT
        oi.order_id,
        SUM(oi.price) AS total_price,
        SUM(oi.freight_value) AS total_freight,
        COUNT(*) AS num_items,
        AVG(p.product_weight_g) AS avg_product_weight_g,
        AVG(p.product_length_cm) AS avg_product_length_cm,
        AVG(p.product_height_cm) AS avg_product_height_cm,
        AVG(p.product_width_cm) AS avg_product_width_cm,
        
        -- Средний объем товара
        AVG(
            p.product_length_cm 
            * p.product_height_cm 
            * p.product_width_cm
        ) AS avg_product_volume_cm3
    FROM order_items oi
    JOIN products p ON p.product_id = oi.product_id
    GROUP BY oi.order_id
),

order_dates AS (
    -- Дата покупки
    SELECT
        order_id,
        EXTRACT(DOW FROM order_purchase_timestamp)::int AS purchase_dayofweek,
        EXTRACT(MONTH FROM order_purchase_timestamp)::int AS purchase_month
    FROM orders
),

customer_seller AS (
    -- Признаки географии (штат покупателя и продавца)
    SELECT
        oi.order_id,
        c.customer_state,
        s.seller_state
    FROM order_items oi
    JOIN orders o ON o.order_id = oi.order_id
    JOIN customers c ON c.customer_id = o.customer_id
    JOIN sellers s ON s.seller_id = oi.seller_id
    GROUP BY oi.order_id, c.customer_state, s.seller_state
)

SELECT
    ia.order_id,
    
    -- Признаки заказа
    ia.total_price,               -- итоговая стоимость товаров в заказе
    ia.total_freight,             -- стоимость доставки
    ia.num_items,                 -- количество товаров в заказе
    
    -- Признаки товара, усреднённые по всем товарам в заказе
    ia.avg_product_weight_g,      -- средний вес товара
    ia.avg_product_length_cm,     -- средняя длина товара
    ia.avg_product_height_cm,     -- средняя высота товара
    ia.avg_product_width_cm,      -- средняя ширина товара
    ia.avg_product_volume_cm3,    -- средний объём товара (длина * ширина * высота)

    -- Признаки даты покупки
    od.purchase_dayofweek,        -- день недели покупки (0 = воскресенье)
    od.purchase_month,            -- месяц покупки (1-12)

    -- География покупателя и продавца
    cs.customer_state,            -- штат покупателя
    cs.seller_state               -- штат продавца

FROM item_agg ia
LEFT JOIN order_dates od ON od.order_id = ia.order_id
LEFT JOIN customer_seller cs ON cs.order_id = ia.order_id;