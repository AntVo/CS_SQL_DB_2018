/* Assignment 3.sql 
  Antoine Vo
   CS 31A, Spring 2018
*/

/* put the database name into this command */

USE bookstore;

/* Query 1 */

SELECT customer_id 
FROM customer
WHERE customer_id BETWEEN 22229 AND 66669;


/* Query 2 */

SELECT first_name, last_name, salary
FROM employee
WHERE salary NOT IN (3400,3000,6000);

/* Query 3 */

SELECT order_id, order_date, ship_date
FROM orders
WHERE ship_date IS NULL;

/* Query 4 */

SELECT last_name, first_name
FROM customer
WHERE last_name LIKE "%in";

/* Query 5 */

SELECT product_id, product_name, list_price as product_price
FROM product
WHERE list_price > 30 AND list_price < 900;

/* Query 6 */
/* Range Operator */
SELECT order_id, order_date, ship_date 
FROM orders
WHERE order_date BETWEEN '2015-02-28' AND '2015-04-01'
ORDER BY order_date DESC;

/* Logical Operator */
SELECT order_id, order_date, ship_date 
FROM orders
WHERE order_date > '2015-02-28' AND order_date < '2015-04-01'
ORDER BY order_date DESC;

/* Search Pattern */
SELECT order_id, order_date, ship_date 
FROM orders
WHERE order_date LIKE '2015-03%'
ORDER BY order_date DESC;

/* Query 7 */
SELECT product_id, product_code, product_name
FROM product
WHERE product_name LIKE "_e_l%"
ORDER BY product_code DESC;

/* Query 8 */
SELECT product_id, category_id, vendor_id, list_price
FROM product
WHERE (category_id IN (11, 61)) AND (vendor_id IN (2, 3)) AND (list_price >= 100);


/* Query 9 */
SELECT order_id, customer_id, order_date
FROM orders 
WHERE ship_date IS NOT NULL;

/* Query 10 */
INSERT INTO category (category_id, category_name)
VALUES (71, 'Video Game');

/* Modifying the Row to 71, Camera */
UPDATE category
SET category_name='Camera' WHERE category_id = 71;

/* Query 11 */
INSERT INTO product (product_id, category_id, product_code, product_name, description, list_price, discount_percent, date_added, vendor_id)
VALUES (17234, 71, 'Camera640', 'Canon', 'Canon EOS Rebel T5 DSLR Camera', 755.99, 0, '2015-04-30 13:14:15', 2);

/* Query 12 */
DELETE FROM product WHERE category_id = 71;
DELETE FROM category WHERE category_id = 71;

/* Query 13 */
UPDATE orders
SET card_type='American Express'WHERE order_id = 9;

/* Query 14 */
UPDATE employee
SET salary=6500 WHERE salary=6000;

/* Query 15 */
INSERT INTO customer (customer_id, email_address, password, first_name, last_name)
VALUES (99999, 'rick@raven.com', '', 'Rick', 'Raven');

/* Query 16 */
RENAME TABLE ADMINISTRATORS TO ADMINISTRATORS_BACKUP;
SHOW TABLES;

