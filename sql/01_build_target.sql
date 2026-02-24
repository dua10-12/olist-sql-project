-- Создание таблицы с целевой переменной delivery_time_days

DROP TABLE IF EXISTS delivery_target;

CREATE TABLE delivery_target AS
SELECT
    o.order_id,
    
    -- Время доставки в днях (целевой признак)
    (o.order_delivered_customer_date::date - o.order_purchase_timestamp::date) 
        AS delivery_time_days,

    -- Оставим даты для контроля качества
    o.order_purchase_timestamp,
    o.order_delivered_customer_date

FROM orders o
WHERE 
    o.order_status = 'delivered'
    AND o.order_purchase_timestamp IS NOT NULL
    AND o.order_delivered_customer_date IS NOT NULL
    AND o.order_delivered_customer_date >= o.order_purchase_timestamp;