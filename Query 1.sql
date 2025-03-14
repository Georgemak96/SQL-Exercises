SHOW DATABASES;
USE coffe_store;
DROP DATABASE test;
CREATE DATABASE coffe_store;
USE coffe_store;
CREATE TABLE products (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30),
price DECIMAL(3,2)
);
CREATE TABLE customers(
id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(30),
last_name VARCHAR(30),
gender ENUM('M','F'),
phone_number VARCHAR(11)
);
CREATE TABLE orders(
id INT AUTO_INCREMENT PRIMARY KEY,
product_id INT,
customer_id INT,
order_time DATETIME,
FOREIGN KEY (product_id) REFERENCES products(id),
FOREIGN KEY (customer_id) REFERENCES customers(id));
SHOW TABLES;

SELECT * FROM products;
ALTER TABLE products
ADD COLUMN coffe_origin VARCHAR(30);
ALTER TABLE products
DROP COLUMN coffe_origin;

SELECT * FROM products;
INSERT INTO products (name, price, coffe_origin)
VALUES ('Espresso','2.50','Brazil');

INSERT INTO products (name, price, coffe_origin)
VALUES  ('Latte','3.50','Indonesia'), ('Americano','3.00','Brazil'), ('Flat White','3.50','Indonesia'),('Filter','3.00','India');

UPDATE products
SET coffe_origin='Sri Lanka'
WHERE id=7;
SET SQL_SAFE_UPDATES=0;

UPDATE products
SET price='3.25', coffe_origin='Ethiopia'
WHERE name='Americano';

UPDATE products
SET coffe_origin='Columbia'
WHERE coffe_origin='Brazil';

DELETE FROM people
WHERE name='John';


INSERT INTO customers (first_name, last_name, gender, phone_number) VALUES ('Chris','Martin','M','01123147789'),('Emma','Law','F','01123439899'),('Mark','Watkins','M','01174592013'),('Daniel','Williams','M',NULL),('Sarah','Taylor','F','01176348290'),('Katie','Armstrong','F','01145787353'),('Michael','Bluth','M','01980289282'),('Kat','Nash','F','01176987789'),('Buster','Bluth','M','01173456782'),('Charlie',NULL,'F','01139287883'),('Lindsay','Bluth','F','01176923804'),('Harry','Johnson','M',NULL),('John','Smith','M','01174987221'),('John','Taylor','M',NULL),('Emma','Smith','F','01176984116'),('Gob','Bluth','M','01176985498'),('George','Bluth','M','01176984303'),('Lucille','Bluth','F','01198773214'),('George','Evans','M','01174502933'),('Emily','Simmonds','F','01899284352'),('John','Smith','M','01144473330'),('Jennifer',NULL,'F',NULL),('Toby','West','M','01176009822'),('Paul','Edmonds','M','01966947113');
INSERT INTO orders (product_id,customer_id,order_time) VALUES (1,1,'2017-01-01 08-02-11'),(1,2,'2017-01-01 08-05-16'),(5,12,'2017-01-01 08-44-34'),(3,4,'2017-01-01 09-20-02'),(1,9,'2017-01-01 11-51-56'),(6,22,'2017-01-01 13-07-10'),(1,1,'2017-01-02 08-03-41'),(3,10,'2017-01-02 09-15-22'),(2,2,'2017-01-02 10-10-10'),(3,13,'2017-01-02 12-07-23'),(1,1,'2017-01-03 08-13-50'),(7,16,'2017-01-03 08-47-09'),(6,21,'2017-01-03 09-12-11'),(5,22,'2017-01-03 11-05-33'),(4,3,'2017-01-03 11-08-55'),(3,11,'2017-01-03 12-02-14'),(2,23,'2017-01-03 13-41-22'),(1,1,'2017-01-04 08-08-56'),(3,10,'2017-01-04 11-23-43'),(4,12,'2017-01-05 08-30-09'),(7,1,'2017-01-06 09-02-47'),(3,18,'2017-01-06 13-23-34'),(2,16,'2017-01-07 09-12-39'),(2,14,'2017-01-07 11-24-15'),(4,5,'2017-01-08 08-54-11'),(1,1,'2017-01-09 08-03-11'),(6,20,'2017-01-10 10-34-12'),(3,3,'2017-01-10 11-02-11'),(4,24,'2017-01-11 08-39-11'),(4,8,'2017-01-12 13-20-13'),(1,1,'2017-01-14 08-27-10'),(4,15,'2017-01-15 08-30-56'),(1,7,'2017-01-16 10-02-11'),(2,10,'2017-01-17 09-50-05'),(1,1,'2017-01-18 08-22-55'),(3,9,'2017-01-19 09-00-19'),(7,11,'2017-01-19 11-33-00'),(6,12,'2017-01-20 08-02-21'),(3,14,'2017-01-21 09-45-50'),(5,2,'2017-01-22 10-10-34'),(6,24,'2017-01-23 08-32-19'),(6,22,'2017-01-23 08-45-12'),(6,17,'2017-01-23 12-45-30'),(2,11,'2017-01-24 08-01-27'),(1,1,'2017-01-25 08-05-13'),(6,11,'2017-01-26 10-49-10'),(7,3,'2017-01-27 09-23-57'),(7,1,'2017-01-27 10-08-16'),(3,18,'2017-01-27 10-13-09'),(4,19,'2017-01-27 11-02-40'),(3,10,'2017-01-28 08-03-21'),(1,2,'2017-01-28 08-33-28'),(1,12,'2017-01-28 11-55-33'),(1,13,'2017-01-29 09-10-17'),(6,6,'2017-01-30 10-07-13'),(1,1,'2017-02-01 08-10-14'),(2,14,'2017-02-02 10-02-11'),(7,10,'2017-02-02 09-43-17'),(7,20,'2017-02-03 08-33-49'),(4,21,'2017-02-04 09-31-01'),(5,22,'2017-02-05 09-07-10'),(3,23,'2017-02-06 08-15-10'),(2,24,'2017-02-07 08-27-26'),(1,1,'2017-02-07 08-45-10'),(6,11,'2017-02-08 10-37-10'),(3,13,'2017-02-09 08-58-18'),(3,14,'2017-02-10 09-12-40'),(5,4,'2017-02-10 11-05-34'),(1,2,'2017-02-11 08-00-38'),(3,8,'2017-02-12 08-08-08'),(7,20,'2017-02-12 09-22-10'),(1,1,'2017-02-13 08-37-45'),(5,2,'2017-02-13 12-34-56'),(4,3,'2017-02-14 08-22-43'),(5,4,'2017-02-14 09-12-56'),(3,5,'2017-02-15 08-09-10'),(6,7,'2017-02-15 09-05-12'),(1,8,'2017-02-15 09-27-50'),(2,9,'2017-02-16 08-51-12'),(3,10,'2017-02-16 13-07-46'),(4,11,'2017-02-17 08-03-55'),(4,12,'2017-02-17 09-12-11'),(5,10,'2017-02-17 11-41-17'),(6,18,'2017-02-17 13-05-56'),(7,19,'2017-02-18 08-33-27'),(1,17,'2017-02-19 08-12-31'),(1,1,'2017-02-20 09-50-17'),(3,5,'2017-02-20 09-51-29'),(4,6,'2017-02-20 10-43-39'),(3,1,'2017-02-21 08-32-17'),(1,1,'2017-02-21 10-30-11'),(3,2,'2017-02-21 11-08-45'),(4,3,'2017-02-22 11-46-32'),(2,15,'2017-02-22 13-35-16'),(6,13,'2017-02-23 08-34-48'),(4,24,'2017-02-24 08-32-03'),(2,13,'2017-02-25 08-03-12'),(7,17,'2017-02-25 09-34-23'),(7,23,'2017-02-25 11-32-54'),(5,12,'2017-02-26 11-47-34'),(6,4,'2017-02-27 12-12-34'),(1,1,'2017-02-28 08-59-22');

SELECT * FROM products
WHERE price<=3.00;
SELECT*FROM customers
WHERE phone_number IS NOT NULL;
SELECT first_name, phone_number FROM customers
WHERE gender='F'
AND last_name='Bluth';
SELECT name FROM products
WHERE price>3.00
OR coffe_origin='Sri Lanka';
SELECT * FROM customers
WHERE gender='M' 
AND  phone_number IS  NULL;
SELECT *FROM customers
WHERE first_name NOT IN('Katie','John','George');
SELECT product_id, customer_id, order_time FROM orders
WHERE customer_id BETWEEN 5 AND 10;
SELECT * FROM customers
WHERE last_name BETWEEN 'A' AND'L';
SELECT * FROM customers
WHERE first_name LIKE '_o_';
SELECT * FROM products
WHERE price LIKE '3%';
SELECT * FROM products
ORDER BY price DESC;
SELECT *FROM customers
ORDER BY last_name DESC;
SELECT *FROM orders
WHERE customer_id=1
ORDER BY order_time ASC;
SELECT name, price FROM products
WHERE coffe_origin='Columbia' 
OR coffe_origin='Indonesia'
ORDER BY name;
SELECT order_time FROM orders
WHERE order_time BETWEEN  '2017-02-10' AND '2019-02-27'
AND customer_id IN(2,4,6,8);
SELECT first_name, phone_number FROM customers
WHERE last_name LIKE'%ar%';
SELECT DISTINCT coffe_origin FROM products;
SELECT DISTINCT customer_id, product_id FROM orders
WHERE order_time BETWEEN '2017-02-01' AND '2017-02-28';
SELECT * FROM customers
ORDER BY last_name
LIMIT 10;
SELECT name AS coffee, price, coffe_origin AS country FROM products;
SELECT DISTINCT last_name FROM customers
ORDER BY last_name;
SELECT order_time FROM orders
WHERE order_time
BETWEEN '2017-02-01' AND '2017-02-28'
AND customer_id=1
ORDER BY order_time ASC
LIMIT 3;
SELECT name, price AS retail_price, coffe_origin FROM products;
SELECT * FROM orders;
SELECT * FROM customers;
SELECT  products.name, orders.order_time FROM orders
INNER JOIN products ON orders.product_id=products.id;
SELECT p.name, p.price, o.order_time FROM orders o
JOIN products p ON o.product_id=p.id
WHERE o.product_id=5
ORDER BY o.order_time;
SELECT c.first_name, c.last_name, o.order_time FROM orders o
JOIN customers c ON o.customer_id=c.id
ORDER BY o.order_time;
UPDATE orders
SET customer_id=1
WHERE id=1;
SELECT o.id, c.phone_number,c.last_name,o.order_time FROM orders o
RIGHT JOIN customers c ON o.customer_id=c.id
ORDER BY o.order_time
LIMIT 10;
SELECT * FROM products;
SELECT*FROM customers;
SELECT * FROM orders;
SELECT p.name, p.price,c.first_name,c.last_name,o.order_time FROM products p
JOIN orders o ON p.id=o.product_id
JOIN customers c ON c.id=o.customer_id
WHERE c.last_name='Martin'
ORDER BY o.order_time;
SELECT c.phone_number,o.id,o.product_id FROM customers c
JOIN orders o ON c.id=o.customer_id
WHERE o.product_id=4;
SELECT p.name, o.order_time FROM products p
JOIN orders o ON o.product_id=p.id
WHERE p.name='Filter' 
AND o.order_time BETWEEN '2017-01-15' AND '2017-02-14';
SELECT p.name,p.price,o.order_time, c.gender FROM products p
JOIN orders o ON p.id=o.product_id
JOIN customers c ON c.id=o.customer_id
WHERE c.gender='F'
AND o.order_time BETWEEN '2017-01-01' AND '2017-01-31'; 












SELECT id,first_name FROM customers;
SELECT CONCAT(first_name,' ' ,last_name) AS name, gender FROM customers;
SELECT phone_number FROM customers
WHERE gender='F' OR first_name='Emma';
SELECT gender FROM customers
WHERE phone_number>01144473330;

SHOW TABLES;
CREATE TABLE customers_archive(
id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(30),
last_name VARCHAR(30),
gender ENUM('M','F'),
phone_number VARCHAR(11)
);
###Insert into table from talbe#####
INSERT INTO customers_archive SELECT*FROM customers;
DROP TABLE customers_archive;
INSERT INTO customers_archive (id, first_name) SELECT id, first_name FROM customers;

##### Order #####
SELECT id,phone_number, first_name FROM customers 
WHERE gender='F' 
HAVING first_name='Emma'
ORDER BY id DESC;


#### Group by####
SELECT id,phone_number, first_name  FROM customers 
GROUP BY gender;
SELECT gender, COUNT(id)  FROM customers 
GROUP BY gender;

####Null###
SELECT id,phone_number, first_name, gender FROM customers 
WHERE gender IS NOT NULL;

####Rename###
RENAME TABLE customers_archive TO clients_archive;

####After####
ALTER TABLE clients_archive 
ADD nicknames DATE
AFTER last_name;

####Limit####
SELECT *FROM customers
LIMIT 6,8;

###Subquery###
SELECT name FROM products WHERE price =(SELECT 
MIN(price) from products);

####Union###
SELECT name FROM products UNION 
SELECT product_id FROM orders;

###Joins###



