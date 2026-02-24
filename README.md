# Olist Delivery Time Prediction
Этот проект посвящён построению полноценного ML-пайплайна на основе открытого датасета бразильского маркетплейса Olist.

# Работа включает:
* создание схемы БД
* загрузку данных
* построение признаков через SQL
* формирование финального ML-датасета
* анализ данных (EDA)
* обучение модели (RandomForest) и оценку результатов

# Цель проекта
Построить модель, способную предсказывать количество дней доставки заказа на основе информации:
* о заказе,
* товарах,
* географии покупателя и продавца,
* логистических характеристиках.

# Структура провекта
```

olist-sql-project/
│
├── data/
│   ├── raw/                # Исходные CSV Olist
│   └── processed/          # Готовые датасеты для ML
│
├── diagrams/
│   └── olist_schema.png    # ER-диаграмма базы данных
│
├── schema/
│   ├── create_tables.sql   # Создание таблиц
│   ├── drop.sql            # Удаление таблиц
│   └── load_data.sql       # Загрузка CSV в PostgreSQL
│
├── sql/
│   ├── 01_build_target.sql         # Создание целевой переменной (delivery_time_days)
│   ├── 02_build_features.sql       # Создание признаков заказа, товара и логистики
│   └── 03_build_final_dataset.sql  # Объединение target + features в ML-датасет
│
├── notebooks/
│   ├── 01_eda.ipynb                # Исследовательский анализ данных
│   └── 02_model_training.ipynb     # Обучение RandomForest + оценка модели
│
├── requirements.txt
└── README.md
```

Источник данных:
https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce




# Как запустить проект

1) Создать базу данных PostgreSQL

2) Выполнить SQL-скрипты по порядку:
- schema/drop.sql - опционально, очищает схему
- schema/create_tables.sql - создаёт таблицы
- schema/load_data.sql - загружает сырые данные в базу

3) вВыполнить запросы из директории /sql/:
- 01_build_target.sql
- 02_build_features.sql
- 03_build_final_dataset.sql

4) Выгрузить финальный датасет:
в PostgreSQL выполнить:

\copy ml_delivery_dataset TO 'path/to/data/processed/ml_delivery_dataset.csv' CSV HEADER;

5) Запустить ноутбуки:
- notebooks/01_eda.ipynb - Exploratory Data Analysis
- notebooks/02_model_training.ipynb - обучение модели и оценка качества


# Финальный вывод
Был создан полный ML-пайплайн от SQL до модели.
Данные очищены, выбросы обработаны, признаки сформированы.
Модель RandomForest показала стабильные результаты с MAE ≈ 4 дней.
География покупателей и стоимость доставки оказались ключевыми факторами.