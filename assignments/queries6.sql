/* Assignment 6.sql 
  Antoine Vo
   CS 31A, Spring 2018
*/

/* put the database name into this command */
USE bookstore;

/* Query 1 */
SELECT COUNT(*) FROM orders;
SELECT SUM(tax_amount) FROM orders;

/* Query 2 */
SELECT p.product_id, COUNT(p.product_id) AS NumOrders
FROM product p JOIN orderitems o
ON p.product_id = o.product_id
GROUP BY p.product_id 
ORDER BY NumOrders DESC;

/* Query 3 */
SELECT c.category_name, COUNT(c.category_id) AS product_count, MAX(p.list_price) AS most_expensive_product 
FROM category c JOIN product p
ON c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY product_count DESC;

/* Query 4 */
SELECT c.email_address, SUM(oi.item_price * oi.quantity) AS item_price_total, SUM(oi.discount_amount * oi.quantity) AS discount_amount_total
FROM customer c 
JOIN orders o ON c.customer_id = o.customer_id
JOIN orderitems oi ON o.order_id = oi.order_id
GROUP BY c.email_address;

/* Query 5 */
SELECT c.email_address, COUNT(oi.order_id) AS order_count, SUM((oi.item_price - oi.discount_amount) * oi.quantity) as order_total
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
JOIN orderitems oi ON o.order_id = oi.order_id
GROUP BY c.email_address
HAVING order_Count > 1
ORDER BY order_total DESC;

/* Query 6 */
SELECT c.email_address, COUNT(oi.order_id) AS order_count, SUM((oi.item_price - oi.discount_amount) * oi.quantity) as order_total
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
JOIN orderitems oi ON o.order_id = oi.order_id
WHERE oi.item_price > 400
GROUP BY c.email_address
HAVING order_Count > 1
ORDER BY order_total DESC;

/* Query 7 */
SELECT c.email_address, COUNT(product_id) AS number_of_products
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
JOIN orderitems oi ON o.order_id = oi.order_id
GROUP BY c.email_address
HAVING COUNT(o.customer_id) > 1;

/* Query 8 */
SELECT vendor_id, COUNT(*)
FROM product 
WHERE list_price >= 100
GROUP BY vendor_id;

/* Query 9 */
SELECT vendor_id, category_id, COUNT(product_id) AS number_of_products, AVG(list_price) AS average_price
FROM product
GROUP BY category_id, vendor_id
HAVING COUNT(product_id) > 1;

/* Query 10 */
SELECT COUNT(product_id) AS number_of_printers
FROM category
JOIN product ON category.category_id = product.category_id
WHERE category_name = 'printer';

/* Query 11 */
SELECT SUM((orderitems.item_price-orderitems.discount_amount)*orderitems.quantity) AS total_profit
FROM orders 
JOIN orderitems ON orders.order_id = orderitems.order_id
WHERE customer_id = 77779;

/* Query 12 */
SELECT card_number, 
LENGTH(card_number) AS card_number_length, 
RIGHT(card_number, 4) AS last_four_digits,
CONCAT('XXXX-XXXX-XXXX-', RIGHT(card_number,4)) AS formatted_number
FROM orders;






