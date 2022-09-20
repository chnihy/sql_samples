USE TEST_db;

/*
-- create customer profile table
CREATE TABLE customer_profile(
    customer_id INT IDENTITY (100,1) PRIMARY KEY,
    first_name VARCHAR (255) NOT NULL,
    last_name VARCHAR (255) NOT NULL,
    company_name VARCHAR (255) NOT NULL
);
*/


INSERT INTO customer_profile
VALUES ('Bob', 'Loblaw', 'Bob Loblaws Law Firm');

/*
DELETE FROM customer_profile WHERE customer_id = 102;
*/

SELECT * FROM customer_profile;