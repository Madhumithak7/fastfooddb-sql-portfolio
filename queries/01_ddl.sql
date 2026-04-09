-- ============================================
-- A. CREATE TABLE 
-- ============================================

CREATE DATABASE IF NOT EXISTS FastFoodDB;
USE FastFoodDB;
 
-- ============================================
-- 1. PRODUCTS
-- ============================================
CREATE TABLE products (
    product_id       INT AUTO_INCREMENT PRIMARY KEY,
    name             VARCHAR(100) NOT NULL,
    category         ENUM('burger', 'wrap', 'fries', 'nuggets', 'sauce', 'drink', 'dessert', 'combo') NOT NULL,
    price            DECIMAL(10, 2) NOT NULL,
    is_available     BOOLEAN DEFAULT TRUE,
    created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
 
-- ============================================
-- 2. INGREDIENTS
-- ============================================
CREATE TABLE ingredients (
    ingredient_id    INT AUTO_INCREMENT PRIMARY KEY,
    name             VARCHAR(100) NOT NULL,
    unit             VARCHAR(20),
    stock_qty        INT NOT NULL DEFAULT 0,
    reorder_level    INT DEFAULT 20,
    created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
 
-- ============================================
-- 3. PRODUCT INGREDIENTS (Recipe table)
-- ============================================
CREATE TABLE product_ingredients (
    id               INT AUTO_INCREMENT PRIMARY KEY,
    product_id       INT NOT NULL,
    ingredient_id    INT NOT NULL,
    quantity_needed  INT NOT NULL DEFAULT 1,
    FOREIGN KEY (product_id)    REFERENCES products(product_id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(ingredient_id)
);
 
-- ============================================
-- 4. CUSTOMERS
-- ============================================
CREATE TABLE customers (
    customer_id      INT AUTO_INCREMENT PRIMARY KEY,
    name             VARCHAR(100) NOT NULL,
    phone            VARCHAR(20),
    email            VARCHAR(100),
    created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
 
-- ============================================
-- 5. ORDERS
-- ============================================
CREATE TABLE orders (
    order_id         INT AUTO_INCREMENT PRIMARY KEY,
    order_number     VARCHAR(20) UNIQUE NOT NULL,
    customer_id      INT,
    order_source     ENUM('kiosk', 'counter', 'mobile_app') NOT NULL,
    status           ENUM('pending', 'preparing', 'ready', 'collected') DEFAULT 'pending',
    total_amount     DECIMAL(10, 2) NOT NULL,
    created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
 
-- ============================================
-- 6. ORDER ITEMS
--    display_target = kitchen (burgers/nuggets)
--                   = front   (drinks/fries/sauces)
-- ============================================
CREATE TABLE order_items (
    item_id          INT AUTO_INCREMENT PRIMARY KEY,
    order_id         INT NOT NULL,
    product_id       INT NOT NULL,
    quantity         INT NOT NULL DEFAULT 1,
    unit_price       DECIMAL(10, 2) NOT NULL,
    display_target   ENUM('kitchen', 'front') NOT NULL,
    is_ready         BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (order_id)   REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
 
-- ============================================
-- 7. PAYMENTS
-- ============================================
CREATE TABLE payments (
    payment_id       INT AUTO_INCREMENT PRIMARY KEY,
    order_id         INT NOT NULL UNIQUE,
    method           ENUM('cash', 'card', 'mobile_pay') NOT NULL,
    amount_paid      DECIMAL(10, 2) NOT NULL,
    status           ENUM('paid', 'pending', 'refunded') DEFAULT 'paid',
    paid_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
 
-- ============================================
-- 8. STORAGE (store room supplies)
-- ============================================
CREATE TABLE storage (
    storage_id         INT AUTO_INCREMENT PRIMARY KEY,
    item_name          VARCHAR(100) NOT NULL,
    category           VARCHAR(50),
    quantity_in_stock  INT NOT NULL DEFAULT 0,
    unit               VARCHAR(20),
    reorder_threshold  INT DEFAULT 10,
    last_updated       TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
 
-- ============================================
-- 9. SUPPLIERS
-- ============================================
CREATE TABLE suppliers (
    supplier_id      INT AUTO_INCREMENT PRIMARY KEY,
    name             VARCHAR(100) NOT NULL,
    contact_name     VARCHAR(100),
    phone            VARCHAR(20),
    email            VARCHAR(100),
    created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
 
-- ============================================
-- 10. SUPPLIER ORDERS
-- ============================================
CREATE TABLE supplier_orders (
    supplier_order_id  INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id        INT NOT NULL,
    storage_id         INT NOT NULL,
    quantity_ordered   INT NOT NULL,
    status             ENUM('placed', 'confirmed', 'delivered') DEFAULT 'placed',
    ordered_at         TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    delivered_at       TIMESTAMP NULL,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id),
    FOREIGN KEY (storage_id)  REFERENCES storage(storage_id)
);

-- ============================================
-- B. ALTER by adding customers Loyalty Points
-- ============================================

ALTER TABLE customers
ADD COLUMN loyalty_points INT DEFAULT 0;

-- Check whether it works
SELECT * FROM customers;

-- ============================================
-- C. DROP 
-- ============================================
-- Never run this on a table you need!
DROP TABLE customers;
