
USE TEST_db;

-- create timestamp
DROP TABLE IF EXISTS etl_ts
SELECT
    GETDATE() AS etl_ts
INTO 
    etl_ts
;

-- create new order staging table
DROP TABLE IF EXISTS new_order_stage;

CREATE TABLE new_order_stage(
    --order_id INT IDENTITY (1,1),
    product_id INT,
	product_name VARCHAR (255) NOT NULL,
	category_id INT NOT NULL,
	list_price DECIMAL (10, 2) NOT NULL,
    customer_id INT UNIQUE,
    customer_name VARCHAR (255) NOT NULL,
    company_name VARCHAR (255) NOT NULL,
    order_date DATETIME NOT NULL,
    status VARCHAR (255) NOT NULL,
);

-- Bring in data 
INSERT INTO new_order_stage
SELECT
    --order_id,
    product_id,
    product_name,
    category_id,
    list_price,
    customer_id,
    customer_name,
    company_name,
    order_date,
    status
FROM
( SELECT 
    --ORD.order_id,
    ORD.product_id,
	ORD.product_name,
	ORD.category_id,
	ORD.list_price,
    ORD.customer_id,
    CP.last_name as customer_name,
    CP.company_name,
    ORD.order_date,
    ORD.status

FROM new_order ORD
JOIN customer_profile CP 
ON ORD.customer_id = CP.customer_id
WHERE ORD.status != 'pending'
) AS OD
;


-- TRUNCATE all_orders table
TRUNCATE TABLE all_orders;

-- Merge new_order_staging table into all_orders
MERGE INTO 
    all_orders AS DEST
USING 
    new_order_stage as ORIG
    --ON ORIG.order_id = DEST.order_id
    ON ORIG.product_id = DEST.product_id
	AND ORIG.product_name = DEST.product_name
	AND ORIG.category_id = DEST.category_id
	AND ORIG.list_price = DEST.list_price
    AND ORIG.customer_id = DEST.customer_id
    AND ORIG.customer_name = DEST.customer_name
    AND ORIG.company_name = DEST.company_name
    AND ORIG.order_date = DEST.order_date
    AND ORIG.status = DEST.status
WHEN NOT MATCHED THEN INSERT
(
    --order_id,
    product_id,
    product_name,
    category_id,
    list_price,
    customer_id,
    customer_name,
    company_name,
    order_date,
    status,
    etl_ts
)
VALUES
(
    --order_id,
    product_id,
    product_name,
    category_id,
    list_price,
    customer_id,
    customer_name,
    company_name,
    order_date,
    status,
    (SELECT etl_ts FROM etl_ts)
);

SELECT * FROM all_orders;