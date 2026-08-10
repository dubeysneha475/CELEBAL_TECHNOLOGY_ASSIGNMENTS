USE superstore_db;

-- =========================================================
-- Final Combined Query
-- This query calculates total sales for each customer
-- using a Common Table Expression (CTE), joins the result
-- with the customers table to get customer names,
-- and then ranks customers based on total sales
-- using the RANK() window function.
--
-- Output:
-- Customer Name | Total Sales | Sales Rank
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
    cs.total_sales,
    RANK() OVER (ORDER BY cs.total_sales DESC) AS sales_rank
FROM customer_sales cs
JOIN customers c
    ON cs.customer_id = c.customer_id
ORDER BY sales_rank;