-- ============================================
-- A. INSERT
-- ============================================
INSERT INTO customers (name, phone)
VALUES ('David Müller', '07700777888');

-- PRODUCTS — Wraps
INSERT INTO products (name, category, price) VALUES
('Caesar Wrap',       'wrap',   6.49);   -- 6
 
-- PRODUCTS — Fries & Sides
INSERT INTO products (name, category, price) VALUES
('Small Fries',       'fries',  2.49),   -- 7
('Large Fries',       'fries',  3.49),   -- 8
('Curly Fries',       'fries',  3.29),   -- 9
('Nuggets 6 Box',     'nuggets',3.99),   -- 10  comes with 1 sauce
('Nuggets 9 Box',     'nuggets',4.99),   -- 11  comes with 2 sauces
('Nuggets 20 Box',    'nuggets',8.99);   -- 12  comes with 3 sauces
 
-- PRODUCTS — Extra Sauce Packets
INSERT INTO products (name, category, price) VALUES
('Ketchup Packet',       'sauce', 0.30),  -- 13
('Mayo Packet',          'sauce', 0.30),  -- 14
('Sour Cream Packet',    'sauce', 0.30),  -- 15
('Suss-Sour Packet',     'sauce', 0.30),  -- 16
('Sweet Chilli Packet',  'sauce', 0.30);  -- 17
 
-- PRODUCTS — Hot Drinks
INSERT INTO products (name, category, price) VALUES
('Cafe',              'drink',  1.99),   -- 18
('Espresso',          'drink',  1.79),   -- 19
('Cappuccino',        'drink',  2.49),   -- 20
('Latte',             'drink',  2.49);   -- 21
 
-- PRODUCTS — Cold Drinks
INSERT INTO products (name, category, price) VALUES
('Cola',              'drink',  1.99),   -- 22
('Cola Zero',         'drink',  1.99),   -- 23
('Cola Light',        'drink',  1.99),   -- 24
('Fanta',             'drink',  1.99),   -- 25
('Ice Tea',           'drink',  1.99),   -- 26
('Sprite',            'drink',  1.99),   -- 27
('Vio Medium Water',  'drink',  1.49),   -- 28
('Vio Still Water',   'drink',  1.49);   -- 29
 
 
-- ============================================
-- INGREDIENTS
-- ============================================
INSERT INTO ingredients (name, unit, stock_qty, reorder_level) VALUES
-- Buns
('Small Bun',              'pieces', 300, 60),   -- 1  chicken burger + cheeseburger
('Big Mac Bun (3 layer)',  'pieces', 200, 40),   -- 2
('Royal TS Bun',           'pieces', 150, 30),   -- 3
('Crispy Bun',             'pieces', 150, 30),   -- 4
('Wrap Tortilla',          'pieces', 100, 20),   -- 5
-- Proteins
('Chicken Patty',          'pieces', 200, 50),   -- 6
('Crispy Chicken Patty',   'pieces', 150, 40),   -- 7
('Beef Patty Regular',     'pieces', 250, 60),   -- 8
('Beef Patty Big Mac',     'pieces', 200, 50),   -- 9
-- Salad & veg
('Eisberg Salat',          'g',     5000, 500),  -- 10
('Gurken (pickles)',        'pieces', 400, 80),   -- 11
('Tomato',                 'pieces', 300, 60),   -- 12
('Onion',                  'pieces', 200, 40),   -- 13
-- Dairy
('Cheese Slice',           'pieces', 400, 80),   -- 14
-- Kitchen sauces
('Sweet Chilli Sauce',     'ml',    3000, 500),  -- 15
('Mustard',                'ml',    2000, 400),  -- 16
('Ketchup',                'ml',    4000, 600),  -- 17
('Big Mac Sauce',          'ml',    2000, 400),  -- 18
('Caesar Sauce',           'ml',    1500, 300),  -- 19
('Sandwich Sauce',         'ml',    2000, 400),  -- 20
('Ranch Sauce',            'ml',    1500, 300),  -- 21
-- Nuggets
('Chicken Nuggets',        'pieces', 500, 100),  -- 22
-- Sauce packets
('Ketchup Packet',         'pieces', 500, 80),   -- 23
('Mayo Packet',            'pieces', 500, 80),   -- 24
('Sour Cream Packet',      'pieces', 300, 60),   -- 25
('Suss-Sour Packet',       'pieces', 300, 60),   -- 26
('Sweet Chilli Packet',    'pieces', 300, 60),   -- 27
-- Drinks supplies
('Coffee Beans',           'g',    10000, 1000), -- 28
('Cola Syrup',             'ml',   20000, 3000), -- 29
('Fanta Syrup',            'ml',   10000, 2000), -- 30
('Sprite Syrup',           'ml',   10000, 2000), -- 31
('Ice Tea Syrup',          'ml',    8000, 1500), -- 32
('Vio Water Bottle',       'pieces', 200, 40),   -- 33
('Milk',                   'ml',   10000, 2000), -- 34
-- Frozen
('Fries (frozen)',         'kg',     100, 20),   -- 35
('Curly Fries (frozen)',   'kg',      60, 15);   -- 36
 
 
-- ============================================
-- RECIPES — Product Ingredients
-- ============================================
 
-- Chicken Burger: small bun, chicken patty, eisberg salat, sweet chilli
INSERT INTO product_ingredients (product_id, ingredient_id, quantity_needed) VALUES
(1, 1, 1),(1, 6, 1),(1, 10, 30),(1, 15, 20);
 
-- Cheeseburger: small bun, beef patty, mustard, ketchup, gurken, cheese
INSERT INTO product_ingredients (product_id, ingredient_id, quantity_needed) VALUES
(2, 1, 1),(2, 8, 1),(2, 16, 10),(2, 17, 10),(2, 11, 3),(2, 14, 1);
 
-- Big Mac: big mac bun, 2x beef patty, big mac sauce, eisberg salat, gurken
INSERT INTO product_ingredients (product_id, ingredient_id, quantity_needed) VALUES
(3, 2, 1),(3, 9, 2),(3, 18, 20),(3, 10, 30),(3, 11, 3);
 
-- Royal TS: royal bun, beef patty, sandwich sauce, onion, tomato, eisberg salat, cheese
INSERT INTO product_ingredients (product_id, ingredient_id, quantity_needed) VALUES
(4, 3, 1),(4, 8, 1),(4, 20, 20),(4, 13, 2),(4, 12, 2),(4, 10, 30),(4, 14, 1);
 
-- Crispy Chicken: crispy bun, crispy chicken patty, ranch sauce, eisberg salat
INSERT INTO product_ingredients (product_id, ingredient_id, quantity_needed) VALUES
(5, 4, 1),(5, 7, 1),(5, 21, 20),(5, 10, 30);
 
-- Caesar Wrap: tortilla, chicken patty, caesar sauce, eisberg salat, tomato, cheese
INSERT INTO product_ingredients (product_id, ingredient_id, quantity_needed) VALUES
(6, 5, 1),(6, 6, 1),(6, 19, 20),(6, 10, 30),(6, 12, 2),(6, 14, 1);
 
-- Nuggets 6 Box: 6 nuggets + 1 sauce packet
INSERT INTO product_ingredients (product_id, ingredient_id, quantity_needed) VALUES
(10, 22, 6),(10, 23, 1);
 
-- Nuggets 9 Box: 9 nuggets + 2 sauce packets
INSERT INTO product_ingredients (product_id, ingredient_id, quantity_needed) VALUES
(11, 22, 9),(11, 23, 2);
 
-- Nuggets 20 Box: 20 nuggets + 3 sauce packets
INSERT INTO product_ingredients (product_id, ingredient_id, quantity_needed) VALUES
(12, 22, 20),(12, 23, 3);
 
-- Fries
INSERT INTO product_ingredients (product_id, ingredient_id, quantity_needed) VALUES
(7, 35, 1),(8, 35, 2),(9, 36, 1);
 
-- Drinks
INSERT INTO product_ingredients (product_id, ingredient_id, quantity_needed) VALUES
(18, 28, 15),(18, 34, 100),  -- cafe
(19, 28, 20),                -- espresso
(20, 28, 15),(20, 34, 150),  -- cappuccino
(21, 28, 15),(21, 34, 250),  -- latte
(22, 29, 300),               -- cola
(23, 29, 300),               -- cola zero
(24, 29, 300),               -- cola light
(25, 30, 300),               -- fanta
(26, 32, 300),               -- ice tea
(27, 31, 300),               -- sprite
(28, 33, 1),                 -- vio medium
(29, 33, 1);                 -- vio still
 
 
-- ============================================
-- SUPPLIER
-- ============================================
INSERT INTO suppliers (name, contact_name, phone, email) VALUES
('HAVI Logistics', 'John Smith', '+49 7700 900000', 'orders@havi.com');
 
 
-- ============================================
-- STORAGE
-- ============================================
INSERT INTO storage (item_name, category, quantity_in_stock, unit, reorder_threshold) VALUES
('Small Buns',             'bakery',  300, 'pieces', 60),
('Big Mac Buns',           'bakery',  200, 'pieces', 40),
('Royal TS Buns',          'bakery',  150, 'pieces', 30),
('Crispy Buns',            'bakery',  150, 'pieces', 30),
('Wrap Tortillas',         'bakery',  100, 'pieces', 20),
('Chicken Patties',        'meat',    200, 'pieces', 50),
('Crispy Chicken Patties', 'meat',    150, 'pieces', 40),
('Beef Patties Regular',   'meat',    250, 'pieces', 60),
('Beef Patties Big Mac',   'meat',    200, 'pieces', 50),
('Eisberg Salat',          'produce', 5000,'g',      500),
('Gurken (pickles)',       'produce', 400, 'pieces', 80),
('Tomatoes',               'produce', 300, 'pieces', 60),
('Onions',                 'produce', 200, 'pieces', 40),
('Cheese Slices',          'dairy',   400, 'pieces', 80),
('Sweet Chilli Sauce',     'sauces',  3000,'ml',     500),
('Mustard',                'sauces',  2000,'ml',     400),
('Ketchup',                'sauces',  4000,'ml',     600),
('Big Mac Sauce',          'sauces',  2000,'ml',     400),
('Caesar Sauce',           'sauces',  1500,'ml',     300),
('Sandwich Sauce',         'sauces',  2000,'ml',     400),
('Ranch Sauce',            'sauces',  1500,'ml',     300),
('Chicken Nuggets',        'frozen',  500, 'pieces', 100),
('Fries (frozen)',         'frozen',  100, 'kg',     20),
('Curly Fries (frozen)',   'frozen',  60,  'kg',     15),
('Coffee Beans',           'drinks',  10000,'g',     1000),
('Cola Syrup',             'drinks',  20000,'ml',    3000),
('Fanta Syrup',            'drinks',  10000,'ml',    2000),
('Sprite Syrup',           'drinks',  10000,'ml',    2000),
('Ice Tea Syrup',          'drinks',  8000, 'ml',    1500),
('Vio Water Bottles',      'drinks',  200,  'pieces',40),
('Milk',                   'drinks',  10000,'ml',    2000),
('Ketchup Packets',        'packets', 500, 'pieces', 80),
('Mayo Packets',           'packets', 500, 'pieces', 80),
('Sour Cream Packets',     'packets', 300, 'pieces', 60),
('Suss-Sour Packets',      'packets', 300, 'pieces', 60),
('Sweet Chilli Packets',   'packets', 300, 'pieces', 60);
 
 
-- ============================================
-- CUSTOMERS
-- ============================================
INSERT INTO customers (name, phone) VALUES
('Alice Johnson', '07700111222'),
('Bob Smith',     '07700333444'),
('Carol White',   '07700555666');
 
 
-- ============================================
-- ORDERS + ITEMS + PAYMENTS
-- ============================================
INSERT INTO orders (order_number, customer_id, order_source, status, total_amount) VALUES
('ORD-0001', 1, 'kiosk',      'ready',     14.07),
('ORD-0002', 2, 'mobile_app', 'preparing', 13.47),
('ORD-0003', 3, 'counter',    'collected', 13.77);
 
-- ORD-0001: Big Mac + Large Fries + Cola + Ketchup packet
INSERT INTO order_items (order_id, product_id, quantity, unit_price, display_target) VALUES
(1, 3,  1, 7.49, 'kitchen'),
(1, 8,  1, 3.49, 'front'),
(1, 22, 1, 1.99, 'front'),
(1, 13, 1, 0.30, 'front'),
(1, 14, 1, 0.30, 'front');
 
-- ORD-0002: Chicken Burger + Nuggets 9 Box + Fanta + Sweet Chilli packet
INSERT INTO order_items (order_id, product_id, quantity, unit_price, display_target) VALUES
(2, 1,  1, 6.49, 'kitchen'),
(2, 11, 1, 4.99, 'kitchen'),
(2, 25, 1, 1.99, 'front'),
(2, 17, 1, 0.30, 'front');
 
-- ORD-0003: Royal TS + Curly Fries + Cappuccino + Mayo packet
INSERT INTO order_items (order_id, product_id, quantity, unit_price, display_target) VALUES
(3, 4,  1, 7.99, 'kitchen'),
(3, 9,  1, 3.29, 'front'),
(3, 20, 1, 2.49, 'front');
 
INSERT INTO payments (order_id, method, amount_paid, status) VALUES
(1, 'card',       14.07, 'paid'),
(2, 'mobile_pay', 13.47, 'paid'),
(3, 'cash',       13.77, 'paid');



-- ============================================
-- B. UPDATE
-- ============================================
UPDATE orders
SET status = 'ready'
WHERE order_number = 'ORD-0002';

-- Checks

SELECT order_number, status FROM orders;
-- ============================================
-- C. DELETE
-- ============================================
DELETE FROM orders
WHERE order_number = 'ORD-0003';
-- Always use WHERE with UPDATE and DELETE — without it you change or delete EVERYTHING!


