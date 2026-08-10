-- =====================================================
-- Section E: Advanced Concepts (CASE, ACID, Transactions)
-- Celebal Technologies Summer Internship 2026
-- =====================================================

USE shopease_db;

-- =====================================================
-- Q24. Classify products into price tiers using CASE.
-- =====================================================

SELECT
    product_name,
    unit_price,
    CASE
        WHEN unit_price < 1000 THEN 'Budget'
        WHEN unit_price BETWEEN 1000 AND 3000 THEN 'Mid-Range'
        ELSE 'Premium'
    END AS price_tier
FROM products;


-- =====================================================
-- Q25. Count Delivered vs Not Delivered orders.
-- =====================================================

SELECT
    SUM(CASE WHEN status = 'Delivered' THEN 1 ELSE 0 END) AS Delivered_Orders,
    SUM(CASE WHEN status <> 'Delivered' THEN 1 ELSE 0 END) AS Not_Delivered_Orders
FROM orders;

-- =====================================================
-- Q27. SQL Transaction
-- =====================================================

START TRANSACTION;

-- Insert a new order
INSERT INTO orders
(order_id, customer_id, order_date, status, total_amount)
VALUES
(1011, 102, CURDATE(), 'Pending', 1598.00);

-- Insert first order item
INSERT INTO order_items
(item_id, order_id, product_id, quantity, unit_price, discount_pct)
VALUES
(5016, 1011, 206, 1, 1299.00, 0);

-- Insert second order item
INSERT INTO order_items
(item_id, order_id, product_id, quantity, unit_price, discount_pct)
VALUES
(5017, 1011, 208, 1, 599.00, 0);

-- Update stock quantity
UPDATE products
SET stock_qty = stock_qty - 1
WHERE product_id = 206;

UPDATE products
SET stock_qty = stock_qty - 1
WHERE product_id = 208;

COMMIT;