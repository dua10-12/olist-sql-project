\copy customers FROM 'PATH_TO_YOUR_FILE/olist_customers_dataset.csv' CSV HEADER;

\copy geolocation FROM 'PATH_TO_YOUR_FILE/olist_geolocation_dataset.csv' CSV HEADER;

\copy sellers FROM 'PATH_TO_YOUR_FILE/olist_sellers_dataset.csv' CSV HEADER;

\copy product_category_translation FROM 'PATH_TO_YOUR_FILE/product_category_name_translation.csv' CSV HEADER;

\copy products FROM 'PATH_TO_YOUR_FILE/olist_products_dataset.csv' CSV HEADER;

\copy orders FROM 'PATH_TO_YOUR_FILE/olist_orders_dataset.csv' CSV HEADER;

\copy order_items FROM 'PATH_TO_YOUR_FILE/olist_order_items_dataset.csv' CSV HEADER;

\copy payments FROM 'PATH_TO_YOUR_FILE/olist_order_payments_dataset.csv' CSV HEADER;

\copy reviews FROM 'PATH_TO_YOUR_FILE/olist_order_reviews_dataset.csv' CSV HEADER ENCODING 'LATIN1';
