-- DROP DATABASE
DROP DATABASE IF EXISTS ecommerce_db;

-- CREATE DATABASE
CREATE DATABASE ecommerce_db;

-- USE DATABASE
USE ecommerce_db;

-- DROP TABLES IF THEY EXIST
DROP TABLE IF EXISTS product_tags;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS categories;

-- CREATE TABLES
CREATE TABLE categories (
  id INT AUTO_INCREMENT PRIMARY KEY,
  category_name VARCHAR(50) NOT NULL
);

CREATE TABLE products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  stock INT NOT NULL DEFAULT 10,
  category_id INT,
  FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE
);

CREATE TABLE tags (
  id INT AUTO_INCREMENT PRIMARY KEY,
  tag_name VARCHAR(50)
);

CREATE TABLE product_tags (
  id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT,
  tag_id INT,
  FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,
  FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
);

-- INSERT DATA INTO TABLES
INSERT INTO categories (category_name) VALUES
('Electronics'),
('Clothing'),
('Books');

INSERT INTO products (product_name, price, stock, category_id) VALUES
('Laptop', 999.99, 20, 1),
('Smartphone', 599.99, 30, 1),
('T-Shirt', 19.99, 50, 2),
('Jeans', 39.99, 40, 2),
('Python Programming Book', 29.99, 25, 3),
('JavaScript Programming Book', 29.99, 30, 3);

INSERT INTO tags (tag_name) VALUES
('Electronics'),
('Clothing'),
('Books');

INSERT INTO product_tags (product_id, tag_id) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 3);