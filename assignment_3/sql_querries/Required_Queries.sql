USE superstore_db;

-- =========================================================
-- Query 1: Find all orders where sales are greater than
-- the average sales of all orders
-- This query uses a subquery to calculate the average sales
-- and then filters orders having sales greater than that average.
-- =========================================================
SELECT *
FROM orders
WHERE sales > (
    SELECT AVG(sales)
    FROM orders
);

-- =========================================================
-- Query 2: Find the highest sales order for each customer
-- This query first finds the maximum sales value for each customer
-- and then joins it back with the orders table to display
-- the customer ID, customer name, order ID, and sales value.
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
    o.sales
FROM orders o
JOIN max_sales_per_customer m
    ON o.customer_id = m.customer_id
   AND o.sales = m.max_sales
JOIN customers c
    ON o.customer_id = c.customer_id
ORDER BY c.customer_name;

-- =========================================================
-- Query 3: Calculate total sales for each customer
-- This query uses a Common Table Expression (CTE)
-- to calculate total sales grouped by customer ID,
-- then joins with the customers table to display customer names.
-- =========================================================
WITH customer_sales AS (
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)
SELECT
    cs.customer_id,
    c.customer_name,
    cs.total_sales
FROM customer_sales cs
JOIN customers c
    ON cs.customer_id = c.customer_id
ORDER BY cs.total_sales DESC;

-- =========================================================
-- Query 4: Find customers whose total sales are above average
-- This query first calculates total sales per customer
-- and then filters only those customers whose total sales
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
    cs.customer_id,
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
-- Query 5: Rank all customers based on total sales
-- This query calculates total sales for each customer
-- and assigns a rank using the RANK() window function
-- in descending order of total sales.
-- =========================================================
WITH customer_sales AS (
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)
SELECT
    cs.customer_id,
    c.customer_name,
    cs.total_sales,
    RANK() OVER (ORDER BY cs.total_sales DESC) AS sales_rank
FROM customer_sales cs
JOIN customers c
    ON cs.customer_id = c.customer_id
ORDER BY sales_rank;

-- =========================================================
-- Query 6: Assign row numbers to each order within a customer
-- This query uses ROW_NUMBER() with PARTITION BY customer_id
-- to assign a separate order ranking for each customer
-- based on sales in descending order.
-- =========================================================
SELECT
    customer_id,
    order_id,
    sales,
    ROW_NUMBER() OVER (
        PARTITION BY customer_id
        ORDER BY sales DESC
    ) AS row_num
FROM orders;

-- =========================================================
-- Query 7: Display top 3 customers based on total sales
-- This query calculates total sales for each customer,
-- ranks them using RANK(), and then displays only
-- the top 3 ranked customers.
-- =========================================================
WITH customer_sales AS (
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
),
ranked_customers AS (
    SELECT
        cs.customer_id,
        c.customer_name,
        cs.total_sales,
        RANK() OVER (ORDER BY cs.total_sales DESC) AS sales_rank
    FROM customer_sales cs
    JOIN customers c
        ON cs.customer_id = c.customer_id
)
SELECT *
FROM ranked_customers
WHERE sales_rank <= 3
ORDER BY sales_rank;