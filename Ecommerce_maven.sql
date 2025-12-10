CREATE DATABASE maven_fuzzy;
USE maven_fuzzy;

-- Table products
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    created_at DATETIME,
    product_name VARCHAR(255)
);

-- Table Website session
CREATE TABLE website_sessions (
    website_session_id INT PRIMARY KEY,
    created_at DATETIME,
    user_id INT,
    is_repeat_session TINYINT,
    utm_source VARCHAR(255),
    utm_campaign VARCHAR(255),
    utm_content VARCHAR(255),
    device_type VARCHAR(100),
    http_referer VARCHAR(500)
);

-- Table Website pageview
CREATE TABLE website_pageviews (
    website_pageview_id INT PRIMARY KEY,
    created_at DATETIME,
    website_session_id INT,
    pageview_url VARCHAR(500),
    FOREIGN KEY (website_session_id) REFERENCES website_sessions(website_session_id)
);

-- Table Orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    created_at DATETIME,
    website_session_id INT,
    user_id INT,
    primary_product_id INT,
    items_purchased INT,
    price_usd DECIMAL(10,2),
    cogs_usd DECIMAL(10,2),
    FOREIGN KEY (website_session_id) REFERENCES website_sessions(website_session_id),
    FOREIGN KEY (primary_product_id) REFERENCES products(product_id)
);

-- Table Order items
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    created_at DATETIME,
    order_id INT,
    product_id INT,
    is_primary_item TINYINT,
    price_usd DECIMAL(10,2),
    cogs_usd DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Table Order item refunds
CREATE TABLE order_item_refunds (
    order_item_refund_id INT PRIMARY KEY,
    created_at DATETIME,
    order_item_id INT,
    order_id INT,
    refund_amount_usd DECIMAL(10,2),
    FOREIGN KEY (order_item_id) REFERENCES order_items(order_item_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

SELECT * FROM order_items LIMIT 10;






