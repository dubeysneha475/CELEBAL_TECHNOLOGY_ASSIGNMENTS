USE superstore_db;

-- =========================================================
-- Mini Project Query 1: Top 5 Customers by Total Sales
-- This query calculates total sales for each customer
-- and displays the top 5 customers with the highest sales.
-- =========================================================
WITH customer_sales AS (
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)
SELECT
    c.customer_name,
    cs.total_sales
FROM customer_sales cs
JOIN customers c
    ON cs.customer_id = c.customer_id
ORDER BY cs.total_sales DESC
LIMIT 5;


-- =========================================================
-- Mini Project Query 2: Bottom 5 Customers by Total Sales
-- This query calculates total sales for each customer
-- and displays the bottom 5 customers with the lowest sales.
-- =========================================================
WITH customer_sales AS (
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)
SELECT
    c.customer_name,
    cs.total_sales
FROM customer_sales cs
JOIN customers c
    ON cs.customer_id = c.customer_id
ORDER BY cs.total_sales ASC
LIMIT 5;

-- =========================================================
-- Mini Project Query 3: Customers Who Made Only One Order
-- This query finds customers who placed only one distinct order.
-- COUNT(DISTINCT o.order_id) is used because one order
-- may contain multiple products in the dataset.
-- =========================================================
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(DISTINCT o.order_id) = 1;

-- =========================================================
-- Mini Project Query 4: Customers with Above-Average Sales
-- This query calculates total sales for each customer
-- and returns only those customers whose total sales
-- are greater than the average total sales of all customers.
-- =========================================================
WITH customer_sales AS (
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)
SELECT
    c.customer_name,
    cs.total_sales
FROM customer_sales cs
JOIN customers c
    ON cs.customer_id = c.customer_id
WHERE cs.total_sales > (
    SELECT AVG(total_sales)
    FROM customer_sales
)
ORDER BY cs.total_sales DESC;

-- =========================================================
-- Mini Project Query 5: Highest Order Value Per Customer
-- This query first finds the maximum sales value for each customer
-- and then joins it back with the orders table to display
-- the highest order value along with customer name and order ID.
-- =========================================================
WITH max_sales_per_customer AS (
    SELECT
        customer_id,
        MAX(sales) AS max_sales
    FROM orders
    GROUP BY customer_id
)
SELECT
    o.customer_id,
    c.customer_name,
    o.order_id,
    o.sales AS highest_order_value
FROM orders o
JOIN max_sales_per_customer m
    ON o.customer_id = m.customer_id
   AND o.sales = m.max_sales
JOIN customers c
    ON o.customer_id = c.customer_id
ORDER BY c.customer_name;