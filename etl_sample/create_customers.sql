USE TEST_db;


-- create customer profile table
CREATE TABLE customer_profile(
    customer_id INT IDENTITY (100,1) PRIMARY KEY,
    first_name VARCHAR (255) NOT NULL,
    last_name VARCHAR (255) NOT NULL,
    company_name VARCHAR (255) NOT NULL
);


-- dummy data
INSERT INTO customer_profile
VALUES ('Bob', 'Loblaw', 'Bob Loblaws Law Firm'),
('Dan', 'Druff', 'Dan Druffs Hair Care'),
('Ana', 'Moly', 'AnaMolys Fortune Teller');

-- print
SELECT * FROM customer_profile;