/*
=============================================================
Create Database and Tables (MySQL)
=============================================================
Script Purpose:
    Creates the DataWarehouseAnalytics database.
    Drops it first if it already exists.
    Creates the gold tables.
=============================================================
*/

-- Drop Database if it exists
DROP DATABASE IF EXISTS DataWarehouseAnalytics;

-- Create Database
CREATE DATABASE DataWarehouseAnalytics;

-- Use Database
USE DataWarehouseAnalytics;

-- =========================================================
-- Create Tables
-- =========================================================

CREATE TABLE dim_customers (
    customer_key INT,
    customer_id INT,
    customer_number VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    country VARCHAR(50),
    marital_status VARCHAR(50),
    gender VARCHAR(50),
    birthdate DATE,
    create_date DATE
);

CREATE TABLE dim_products (
    product_key INT,
    product_id INT,
    product_number VARCHAR(50),
    product_name VARCHAR(50),
    category_id VARCHAR(50),
    category VARCHAR(50),
    subcategory VARCHAR(50),
    maintenance VARCHAR(50),
    cost INT,
    product_line VARCHAR(50),
    start_date DATE
);

CREATE TABLE fact_sales (
    order_number VARCHAR(50),
    product_key INT,
    customer_key INT,
    order_date DATE,
    shipping_date DATE,
    due_date DATE,
    sales_amount INT,
    quantity TINYINT,
    price INT
);

-- =========================================================
-- Empty Tables
-- =========================================================

TRUNCATE TABLE dim_customers;
TRUNCATE TABLE dim_products;
TRUNCATE TABLE fact_sales;

-- =========================================================
-- Import CSV Files
-- =========================================================
SHOW VARIABLES LIKE 'secure_file_priv';
LOAD DATA INFILE 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\dim_customers.csv'
INTO TABLE dim_customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\dim_products.csv'
INTO TABLE dim_products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\fact_sales.csv'
INTO TABLE fact_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SHOW VARIABLES LIKE 'secure_file_priv';
SHOW VARIABLES LIKE 'local_infile';
SELECT @@version, @@hostname, @@datadir;
SHOW GRANTS FOR CURRENT_USER();
SELECT CURRENT_USER();