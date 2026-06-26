-- =====================================================
-- Section C: Aggregation (GROUP BY, SUM, COUNT, AVG, MIN, MAX)
-- Celebal Technologies Summer Internship 2026
-- =====================================================

USE shopease_db;

-- Q13. Count the total number of orders in the orders table.
SELECT COUNT(*) AS Total_Orders
FROM orders;


-- Q14. Find the total revenue (SUM of total_amount)
-- from all 'Delivered' orders.
SELECT SUM(total_amount) AS Total_Revenue
FROM orders
WHERE status = 'Delivered';


-- Q15. Calculate the average unit_price
-- of products in each category.
SELECT category,
       AVG(unit_price) AS Average_Unit_Price
FROM products
GROUP BY category;


-- Q16. For each order status,
-- find the count of orders and total revenue.
-- Sort by total revenue in descending order.

SELECT status,
       COUNT(*) AS Order_Count,
       SUM(total_amount) AS Total_Revenue
FROM orders
GROUP BY status
ORDER BY Total_Revenue DESC;


-- Q17. Find the most expensive (MAX)
-- and cheapest (MIN) product in each category.

SELECT category,
       MAX(unit_price) AS Most_Expensive_Product,
       MIN(unit_price) AS Cheapest_Product
FROM products
GROUP BY category;


-- Q18. List all product categories
-- where the average unit_price is greater than ₹2000.

SELECT category,
       AVG(unit_price) AS Average_Unit_Price
FROM products
GROUP BY category
HAVING AVG(unit_price) > 2000;