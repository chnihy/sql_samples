USE TEST_db;

-- clearing
DROP TABLE IF EXISTS new_order;

-- create new order table
CREATE TABLE new_order(
    order_id INT IDENTITY (1,1) PRIMARY KEY,
    customer_id INT,
    product_id INT,
    product_name VARCHAR (255) NOT NULL,
    order_date DATE NOT NULL,
	category_id INT NOT NULL,
	list_price DECIMAL (10, 2) NOT NULL,
    status VARCHAR (255)
);


-- dummy values
INSERT INTO new_order
VALUES(
    100,
    343,
    'Legal Paper',
    GETDATE(),
    2,
    500.00,
    'open'
),
(
    101,
    347,
    'Shampoo',
    GETDATE(),
    3,
    210.22,
    'open'
),
(
    102,
    341,
    'Crystal Ball',
    GETDATE(),
    9,
    5000.00,
    'open'
);


-- print
SELECT * FROM new_order;


