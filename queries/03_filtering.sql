-- ============================================
-- FILTERING DATA
-- ============================================
-- 1. Full order view
SELECT
    o.order_number,
    c.name            AS customer,
    p.name            AS item,
    oi.quantity,
    oi.unit_price,
    oi.display_target,
    o.status,
    pay.method        AS payment
FROM orders o
JOIN customers c    ON o.customer_id  = c.customer_id
JOIN order_items oi ON o.order_id     = oi.order_id
JOIN products p     ON oi.product_id  = p.product_id
JOIN payments pay   ON o.order_id     = pay.order_id
ORDER BY o.order_number, oi.display_target;
 
-- 2. Kitchen display (burgers + nuggets not yet ready)
SELECT o.order_number, p.name, oi.quantity, o.created_at
FROM order_items oi
JOIN orders o   ON oi.order_id   = o.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE oi.display_target = 'kitchen'
  AND oi.is_ready = FALSE
  AND o.status NOT IN ('collected')
ORDER BY o.created_at;
 
-- 3. Front display (drinks, fries, sauces)
SELECT o.order_number, p.name, oi.quantity, oi.is_ready
FROM order_items oi
JOIN orders o   ON oi.order_id   = o.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE oi.display_target = 'front'
  AND o.status NOT IN ('collected')
ORDER BY o.created_at;
 
-- 4. Customer pickup board
SELECT order_number, total_amount, updated_at AS ready_since
FROM orders
WHERE status = 'ready'
ORDER BY updated_at;
 
-- 5. Recipe viewer — ingredients per product
SELECT p.name AS product, i.name AS ingredient, pi.quantity_needed, i.unit
FROM product_ingredients pi
JOIN products    p ON pi.product_id    = p.product_id
JOIN ingredients i ON pi.ingredient_id = i.ingredient_id
ORDER BY p.name;
 
-- 6. Low stock alert
SELECT item_name, quantity_in_stock, reorder_threshold,
       (reorder_threshold - quantity_in_stock) AS units_needed
FROM storage
WHERE quantity_in_stock < reorder_threshold
ORDER BY units_needed DESC;
 
-- 7. Daily sales by channel
SELECT DATE(created_at) AS order_date, order_source,
       COUNT(order_id) AS total_orders, SUM(total_amount) AS revenue
FROM orders
GROUP BY DATE(created_at), order_source
ORDER BY order_date DESC;
 
-- 8. Best selling products today
SELECT p.name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN orders o   ON oi.order_id   = o.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE DATE(o.created_at) = CURDATE()
GROUP BY p.name
ORDER BY total_sold DESC;
 
-- ============================================
-- FILTERING DATA
-- ============================================
-- 1. Finding specific item on the menu
-- Comparison: show only burgers
SELECT name, price FROM products
WHERE category = 'burger';

-- Greater than: products more expensive than 6€
SELECT name, price FROM products
WHERE price > 6.00;

-- AND: burgers that cost more than 6€
SELECT name, price FROM products
WHERE category = 'burger' AND price > 6.00;

-- OR: show burgers OR drinks
SELECT name, category FROM products
WHERE category = 'burger' OR category = 'drink';

-- BETWEEN: products priced between 2€ and 4€
SELECT name, price FROM products
WHERE price BETWEEN 2.00 AND 4.00;

-- IN: show fries and nuggets only
SELECT name, category FROM products
WHERE category IN ('fries', 'nuggets');

-- LIKE: find all products with 'Burger' in the name
SELECT name FROM products
WHERE name LIKE '%Burger%';

-- NOT: everything except drinks
SELECT name, category FROM products
WHERE category != 'drink';

