CREATE DATABASE Ispit_2020_08_07
GO

USE Ispit_2020_08_07
GO

CREATE TABLE dim_products (
	dim_products_key int IDENTITY(1, 1),
	product_id int NOT NULL,
	product_name varchar(255) NOT NULL,
	brand_id int NOT NULL,
	category_id int NOT NULL,
	model_year smallint NOT NULL,
	list_price decimal(10, 2) NOT NULL,
	CONSTRAINT PK_dim_products PRIMARY KEY (dim_products_key)
)
GO

CREATE TABLE dim_orders_customers (
	dim_orders_customers_key int IDENTITY(1, 1),
	order_id int NOT NULL,
	customer_id int NOT NULL,
	order_date date NOT NULL,
	state varchar(25),
	CONSTRAINT PK_dim_orders_customers PRIMARY KEY (dim_orders_customers_key)
)
GO

CREATE TABLE dim_stores_orders (
	dim_stores_orders_key int IDENTITY(1, 1),
	order_id int NOT NULL,
	store_id int NOT NULL,
	store_name varchar(255),
	city varchar(255),
	CONSTRAINT PK_dim_stores_orders PRIMARY KEY (dim_stores_orders_key)
)
GO

CREATE TABLE fact_items (
	fact_items_key int IDENTITY(1, 1),
	dim_products_key int,
	dim_orders_customers_key int,
	dim_stores_orders_key int,
	quantity int NOT NULL,
	list_price decimal(10, 2) NOT NULL,
	discount decimal(4, 2) NOT NULL,
	CONSTRAINT PK_fact_items PRIMARY KEY (fact_items_key),
	CONSTRAINT FK_fact_items_dim_products FOREIGN KEY (dim_products_key)
		REFERENCES dim_products (dim_products_key),
	CONSTRAINT FK_fact_items_dim_orders_customers FOREIGN KEY (dim_orders_customers_key)
		REFERENCES dim_orders_customers (dim_orders_customers_key),
	CONSTRAINT FK_fact_items_dim_stores_orders FOREIGN KEY (dim_stores_orders_key)
		REFERENCES dim_stores_orders (dim_stores_orders_key)

)
GO

SELECT *
FROM dim_products
GO

SELECT *
FROM dim_orders_customers
GO

SELECT * 
FROM dim_stores_orders
GO

SELECT * 
FROM fact_items
GO