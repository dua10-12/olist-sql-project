-- Финальная сборка датасета для модели предсказания времени доставки

DROP TABLE IF EXISTS ml_delivery_dataset;

CREATE TABLE ml_delivery_dataset AS
SELECT
    dt.order_id,
    
    -- Целевая переменная
    dt.delivery_time_days,

    -- Признаки заказа
    ofe.total_price,
    ofe.total_freight,
    ofe.num_items,

    -- Признаки товара
    ofe.avg_product_weight_g,
    ofe.avg_product_length_cm,
    ofe.avg_product_height_cm,
    ofe.avg_product_width_cm,
    ofe.avg_product_volume_cm3,

    -- Признаки даты покупки
    ofe.purchase_dayofweek,
    ofe.purchase_month,

    -- География покупателей и продавцов
    ofe.customer_state,
    ofe.seller_state

FROM delivery_target dt
JOIN order_features ofe ON ofe.order_id = dt.order_id
WHERE
    dt.delivery_time_days IS NOT NULL
    AND dt.delivery_time_days >= 0
    AND ofe.total_price IS NOT NULL
    AND ofe.total_freight IS NOT NULL
    AND ofe.num_items > 0;