/* Assignment 7.sql 
  Antoine Vo
   CS 31A, Spring 2018
*/

/* put the database name into this command */
USE bookstore;

/* Query 1 */

SELECT DISTINCT category_name
FROM category 
WHERE category.category_id IN 
	(SELECT product.category_id
	 FROM product)
ORDER BY category_name;

/* Query 2 */

SELECT product_name, list_price FROM product
WHERE list_price > (Select AVG(list_price) FROM product)
ORDER BY list_price DESC;

/* Query 3 */

SELECT category_name 
FROM category
WHERE EXISTS (SELECT 1 FROM product WHERE product.category_ID != category.category_ID);

/* Query 4 */

SELECT customer.email_address
FROM customer
WHERE customer_id IN 
	(SELECT orders.order_id, (orderitems.item_price * orderitems.quantity) AS order_total
	 FROM orders, orderitems
	 WHERE orderitems.order_id = orders.order_id)
GROUP BY customer.email_address;

/* Query 5 */
SELECT DISTINCT email_address, (order_id = 1) AS order_id,
	(SELECT MIN(order_date) FROM orders
	 WHERE customer.customer_id = orders.customer_id) AS order_date
FROM customer, orders;

/* Query 6 */

SELECT product_id, product_name, list_price
FROM product
WHERE product_id IN (SELECT product_id FROM orderitems
GROUP BY product_id HAVING COUNT(*) > 1);

/* Query 7 */
SELECT last_name, first_name
FROM customer
WHERE customer_id IN 
	(SELECT customer_id 
	 FROM orders, orderitems
	 WHERE orderitems.item_price > 300
	);



/* Query 8 */
SELECT last_name, first_name, email_address
FROM customer
WHERE customer_id IN 
	(SELECT customer_id
		FROM orders
		WHERE orders.order_id = 1 OR orders.order_id = 2 OR orders.order_id = 3
	);

/* Query 9 */ 
SELECT DISTINCT last_name, first_name, email_address 
FROM customer
WHERE customer_id IN 
(SELECT orders.customer_id 
FROM orders, orderitems, product 
WHERE (product.product_name like "H%") AND (orders.order_id = orderitems.order_id)
);


/* Query 10 */
SELECT product_id, product_name, list_price 
FROM product
WHERE product_id IN (
	SELECT product_id
	FROM orderitems
	GROUP BY product_id
	HAVING SUM(quantity) > 2);

/* Query 11 */

SELECT order_id, SUM(quantity * item_price) AS total_amount
FROM orderitems
GROUP BY order_id
HAVING SUM(quantity * item_price) >
(SELECT SUM(quantity * item_price)
FROM orderitems
WHERE order_id = 7);


/* Query 12 */
SELECT order_id, order_date, ship_date 
from orders
WHERE ship_date - order_date = (SELECT MAX(ship_date- order_date) FROM ORDERS);

