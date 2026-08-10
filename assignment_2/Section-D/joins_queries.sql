-- =====================================================
-- Section D: Joins & Relationships
-- Celebal Technologies Summer Internship 2026
-- =====================================================

USE shopease_db;

-- Q19. Display each order along with the customer's first name,
-- last name, order date and total amount.

SELECT
    o.order_id,
    o.order_date,
    c.first_name,
    c.last_name,
    o.total_amount
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id;


-- Q20. List ALL customers and their orders (if any).
-- Customers without orders should also appear.

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    o.order_id,
    o.order_date,
    o.status
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;


-- Q21. Display order details using three-table JOIN.

SELECT
    o.order_id,
    p.product_name,
    oi.quantity,
    oi.unit_price,
    oi.discount_pct
FROM orders o
INNER JOIN order_items oi
ON o.order_id = oi.order_id
INNER JOIN products p
ON oi.product_id = p.product_id;


-- Q22.
-- Explanation:
--
-- LEFT JOIN returns all records from the left table
-- and matching records from the right table.
-- If no match exists, NULL values are returned.
--
-- Example:
-- customers LEFT JOIN orders
--
-- RIGHT JOIN returns all records from the right table
-- and matching records from the left table.
--
-- Example:
-- orders RIGHT JOIN customers
--
-- FULL OUTER JOIN returns all matching and non-matching
-- rows from both tables.
-- MySQL does not support FULL OUTER JOIN directly.
-- It can be achieved using UNION of LEFT JOIN and RIGHT JOIN.


-- Q23.
-- Foreign Key Relationships:
--
-- 1. orders.customer_id
--    REFERENCES customers.customer_id
--
-- 2. order_items.order_id
--    REFERENCES orders.order_id
--
-- 3. order_items.product_id
--    REFERENCES products.product_id
--
-- Explanation:
-- If we try to insert an order with customer_id = 999,
-- MySQL will reject the insert because customer_id 999
-- does not exist in the customers table.
-- This is enforced by the FOREIGN KEY constraint.

-- Example (Do NOT execute if you want to keep your data unchanged)

INSERT INTO orders
(order_id, customer_id, order_date, status, total_amount)
VALUES
(1011, 999, '2024-09-01', 'Pending', 1500.00);

-- Expected Result:
-- Error: Cannot add or update a child row:
-- a foreign key constraint fails.