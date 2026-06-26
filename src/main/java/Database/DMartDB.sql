-- =========================================================
-- DMart Billing & Inventory Management Database
-- Portable SQL Script
-- =========================================================

BEGIN;

DROP TABLE IF EXISTS bill_items CASCADE;
DROP TABLE IF EXISTS bills CASCADE;
DROP TABLE IF EXISTS product CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS cashier CASCADE;

CREATE TABLE cashier (
    username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(100) NOT NULL
);

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    mobile_number VARCHAR(10) UNIQUE NOT NULL
);

CREATE TABLE product (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price NUMERIC(10,2) NOT NULL,
    quantity INT NOT NULL,
    manufacturer_name VARCHAR(100),
    manufacture_date DATE,
    expiry_date DATE,
    image_path VARCHAR(255),
    created_by INT,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE bills (
    bill_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    bill_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount NUMERIC(10,2) NOT NULL,
    payment_type VARCHAR(20) NOT NULL,
    CONSTRAINT fk_customer
        FOREIGN KEY(customer_id)
        REFERENCES customers(customer_id)
);

CREATE TABLE bill_items (
    bill_item_id SERIAL PRIMARY KEY,
    bill_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price NUMERIC(10,2) NOT NULL,
    gst NUMERIC(5,2) NOT NULL,
    CONSTRAINT fk_bill
        FOREIGN KEY(bill_id)
        REFERENCES bills(bill_id),
    CONSTRAINT fk_product
        FOREIGN KEY(product_id)
        REFERENCES product(product_id)
);

INSERT INTO cashier(username,password)
VALUES ('cashier1','1234');

INSERT INTO customers(customer_id,customer_name,mobile_number)
VALUES
(1,'Charan','9876543210');

INSERT INTO product
(product_id,product_name,category,price,quantity,manufacturer_name,
manufacture_date,expiry_date,image_path,
created_by,created_date,updated_by,updated_date)
VALUES
(1,'Amul Milk','Dairy',30.00,100,'Amul',
'2026-06-25','2026-06-26',
'1b353fba-cef0-4cec-b832-4e3552ee23be_Amulmilk.webp',
1,'2026-06-25 01:26:15.560766',
1,'2026-06-25 01:26:15.560766'),

(3,'Water Bottle','Grocery',20.00,100,'TATA',
'2026-06-25','2027-10-13',
'80179e8c-d31b-41a8-a6de-da47d1f4c060_tataWaterBottle.png',
1,'2026-06-25 12:47:59.653224',
1,'2026-06-25 12:47:59.653224'),

(4,'Water Bottle','Grocery',10.00,0,'TATA',
'2026-06-11','2026-06-25',
'5f96a80f-13e4-4094-ba50-c732c444ca2e_tataWaterBottle.png',
1,'2026-06-25 12:50:15.213570',
1,'2026-06-25 13:22:40.258521');

SELECT setval('customers_customer_id_seq',
COALESCE((SELECT MAX(customer_id) FROM customers),1),true);

SELECT setval('product_product_id_seq',
COALESCE((SELECT MAX(product_id) FROM product),1),true);

SELECT setval('bills_bill_id_seq',1,false);
SELECT setval('bill_items_bill_item_id_seq',1,false);

COMMIT;
