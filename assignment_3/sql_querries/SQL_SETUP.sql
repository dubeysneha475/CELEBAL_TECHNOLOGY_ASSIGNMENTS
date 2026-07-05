-- =========================================================
-- Step 1: Create and select the database
-- This creates the database for the Superstore project
-- and sets it as the active database.
-- =========================================================
CREATE DATABASE IF NOT EXISTS superstore_db;
USE superstore_db;

-- =========================================================
-- Step 2: View a sample of the imported raw dataset
-- This query displays the first 5 rows of the superstore_raw table
-- to verify that the dataset was imported successfully.
-- =========================================================
SELECT * FROM superstore_raw LIMIT 5;

-- =========================================================
-- Step 3: Check the structure of the raw table
-- This shows the column names and data types
-- of the imported superstore_raw table.
-- =========================================================
DESCRIBE superstore_raw;

-- =========================================================
-- Step 4: Drop existing normalized tables if they already exist
-- This ensures a clean setup before creating fresh tables.
-- =========================================================
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- =========================================================
-- Step 5: Create the customers table
-- This table stores customer-related information such as
-- customer ID, customer name, segment, and location details.
-- =========================================================
CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    region VARCHAR(50)
);

-- =========================================================
-- Step 6: Create the products table
-- This table stores product-related information such as
-- product ID, category, sub-category, and product name.
-- =========================================================
CREATE TABLE products (
    product_id VARCHAR(50) PRIMARY KEY,
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255)
);

-- =========================================================
-- Step 7: Create the orders table
-- This table stores order-level transaction details including
-- order ID, dates, sales, quantity, discount, and profit.
-- =========================================================
CREATE TABLE orders (
    row_id INT PRIMARY KEY,
    order_id VARCHAR(50),
    order_date VARCHAR(20),
    ship_date VARCHAR(20),
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    product_id VARCHAR(50),
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(10,2)
);

-- =========================================================
-- Step 8: Insert data into the customers table
-- This query extracts unique customer records from the raw dataset.
-- GROUP BY Customer ID is used to ensure one record per customer.
-- =========================================================
INSERT INTO customers (
    customer_id,
    customer_name,
    segment,
    country,
    city,
    state,
    postal_code,
    region
)
SELECT
    `Customer ID` AS customer_id,
    MAX(`Customer Name`) AS customer_name,
    MAX(Segment) AS segment,
    MAX(Country) AS country,
    MAX(City) AS city,
    MAX(State) AS state,
    MAX(`Postal Code`) AS postal_code,
    MAX(Region) AS region
FROM superstore_raw
GROUP BY `Customer ID`;

-- =========================================================
-- Step 9: Insert data into the products table
-- This query extracts unique product records from the raw dataset.
-- GROUP BY Product ID is used to ensure one record per product.
-- =========================================================
INSERT INTO products (
    product_id,
    category,
    sub_category,
    product_name
)
SELECT
    `Product ID` AS product_id,
    MAX(Category) AS category,
    MAX(`Sub-Category`) AS sub_category,
    MAX(`Product Name`) AS product_name
FROM superstore_raw
GROUP BY `Product ID`;

-- =========================================================
-- Step 10: Insert data into the orders table
-- This query loads order-level transaction data from the raw table
-- into the orders table. DISTINCT is used to avoid duplicate rows.
-- =========================================================
INSERT INTO orders (
    row_id,
    order_id,
    order_date,
    ship_date,
    ship_mode,
    customer_id,
    product_id,
    sales,
    quantity,
    discount,
    profit
)
SELECT DISTINCT
    `Row ID`,
    `Order ID`,
    `Order Date`,
    `Ship Date`,
    `Ship Mode`,
    `Customer ID`,
    `Product ID`,
    Sales,
    Quantity,
    Discount,
    Profit
FROM superstore_raw;
