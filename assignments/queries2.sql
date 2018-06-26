/* Assignment 2.sql 
  Antoine Vo
   CS 31A, Spring 2018
*/

/* put the database name into this command */

USE bookstore;

/* Query 0 */
SELECT user(), current_date();


/* Query 1 */
SELECT last_name, first_name, customer_id 
FROM customer 
WHERE customer_id != 77779;

/* Query 2 */
SELECT product_name, description 
FROM product 
WHERE category_id > 21;

/* Query 3 */
 SELECT last_name, first_name, customer_id, email_address 
 FROM customer 
 WHERE customer_id = 11119;


/* Query 4 */
SELECT item_id, item_price, discount_amount, quantity, item_price * quantity as price_total, discount_amount * quantity as discount_total, (item_price - discount_amount) * quantity as item_total
FROM orderitems
HAVING item_total > 900
ORDER BY item_total ASC;



/* Query 5 */
SELECT store_id FROM store;
SELECT region_id FROM store;
SELECT region_name FROM store;

/* Query 6 */
SELECT customer_id, email_address FROM customer;

/* Query 7 */
SELECT DISTINCT customer_id FROM ORDERS;

/* Query 8 */
SELECT customer_id, line1, CONCAT(city, ', ', state) as city_and_state, zip_code FROM address;

/* Query 9 */
SELECT product_name, list_price, discount_percent, list_price * (.01*discount_percent) as discount_amount, list_price - (list_price * discount_percent*.01)as discount_price
FROM product
ORDER BY discount_price DESC
LIMIT 5;

/*  Query 10 */
SELECT CONCAT(last_name , ", ", first_name) as full_name FROM customer;



/* Query 11 */
SELECT product_name, category_id FROM product;


/* Query 12 */
SELECT product_name, list_price, list_price * 20 as new_list_price FROM product;

