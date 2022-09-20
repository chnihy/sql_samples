USE TEST_db;

DROP TABLE IF EXISTS all_orders;

-- create all orders table
CREATE TABLE all_orders(
    order_id INT PRIMARY KEY,
    product_id INT,
	product_name VARCHAR (255) NOT NULL,
	category_id INT NOT NULL,
	list_price DECIMAL (10, 2) NOT NULL,
    customer_id INT UNIQUE,
    customer_name VARCHAR (255) NOT NULL,
    company_name VARCHAR (255) NOT NULL,
    order_date DATETIME NOT NULL,
    status VARCHAR (255),
    etl_ts DATE
);

SELECT * from all_orders;
