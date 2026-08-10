-- =====================================================
-- Section A: SQL Basics
-- Celebal Technologies Summer Internship 2026
-- =====================================================

USE shopease_db;

-- Q1. Display all columns and rows from the customers table.
SELECT *
FROM customers;

-- Q2. Retrieve only the first_name, last_name, and city of all customers.
SELECT first_name, last_name, city
FROM customers;

-- Q3. List all unique categories available in the products table.
SELECT DISTINCT category
FROM products;

-- Q4.
-- Primary Keys:
-- customers  -> customer_id
-- products   -> product_id
-- orders     -> order_id
-- order_items -> item_id
--
-- Explanation:
-- A Primary Key uniquely identifies each record in a table.
-- It must be UNIQUE so that no two rows have the same identifier.
-- It must be NOT NULL because every record must have a valid identifier.

-- Q5.
-- The email column has two constraints:
-- 1. UNIQUE
-- 2. NOT NULL
--
-- If a duplicate email is inserted,
-- MySQL returns a Duplicate Entry error because of the UNIQUE constraint.

-- Q6. Try inserting a product with a negative unit_price.

INSERT INTO products
(product_id, product_name, category, brand, unit_price, stock_qty)
VALUES
(209, 'Test Product', 'Electronics', 'TestBrand', -50, 10);
-- Explanation:
-- The INSERT statement failed because the unit_price value (-50)
-- violates the CHECK constraint:
-- CHECK (unit_price > 0)
--
-- MySQL returned:
-- Error Code: 3819
-- Check constraint 'products_chk_1' is violated.
--
-- This ensures that products cannot have a negative price,
-- helping maintain data integrity.

-- Q6. Try inserting a product with a negative unit_price.

INSERT INTO products
(product_id, product_name, category, brand, unit_price, stock_qty)
VALUES
(209, 'Test Product', 'Electronics', 'TestBrand', -50, 10);

-- Expected Result:
-- MySQL prevents the insertion because of the CHECK constraint:
-- CHECK (unit_price > 0)