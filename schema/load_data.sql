\copy customers FROM 'C:/Users/d3-l5/Documents/olist-sql-project/data/raw/olist_customers_dataset.csv' CSV HEADER;

\copy geolocation FROM 'C:/Users/d3-l5/Documents/olist-sql-project/data/raw/olist_geolocation_dataset.csv' CSV HEADER;

\copy sellers FROM 'C:/Users/d3-l5/Documents/olist-sql-project/data/raw/olist_sellers_dataset.csv' CSV HEADER;

\copy product_category_translation FROM 'C:/Users/d3-l5/Documents/olist-sql-project/data/raw/product_category_name_translation.csv' CSV HEADER;

\copy products FROM 'C:/Users/d3-l5/Documents/olist-sql-project/data/raw/olist_products_dataset.csv' CSV HEADER;

\copy orders FROM 'C:/Users/d3-l5/Documents/olist-sql-project/data/raw/olist_orders_dataset.csv' CSV HEADER;

\copy order_items FROM 'C:/Users/d3-l5/Documents/olist-sql-project/data/raw/olist_order_items_dataset.csv' CSV HEADER;

\copy payments FROM 'C:/Users/d3-l5/Documents/olist-sql-project/data/raw/olist_order_payments_dataset.csv' CSV HEADER;

\copy reviews FROM 'C:/Users/d3-l5/Documents/olist-sql-project/data/raw/olist_order_reviews_dataset.csv' CSV HEADER ENCODING 'LATIN1';
