/* Assignment 8.sql 
  Antoine Vo
   CS 31A, Spring 2018
*/

/* put the database name into this command */
USE bookstore;

/* Query 1 */
CREATE VIEW customer_address AS 
SELECT c.customer_id, c.email_address, c.last_name, c.first_name, a.line1, a.line2, 
a.city, a.state, a.zip_code
FROM customer c INNER JOIN address a ON c.customer_id = a.customer_id;

SELECT customer_id, last_name, first_name, city, state
FROM customer_address;

/* Query 2 */
UPDATE customer_address
SET line1 = '1990 Westwood Blvd.'
WHERE customer_id = 11119;

/* Query 3 */
CREATE VIEW product_summary AS
SELECT product_id, SUM(quantity) AS order_count, SUM(item_price) AS order_total
FROM orderitems
GROUP BY product_id;

/* Query 4 */
CREATE VIEW cheap_products AS 
SELECT *
FROM product
WHERE list_price < 50
WITH CHECK OPTION;

/* Query  5 */
INSERT INTO cheap_products(product_id, category_id, product_code, product_name, description, list_price, discount_percent, date_added, vendor_id)
VALUES (17888, 41, 'book db', 'Fundamental of Database Systems', 'Fundamental of Database Systems Elmasri', (45.99), (20.00), '2015-06-01 11:12:59', 2);

/* Query 6 */
CREATE VIEW contact AS
SELECT contact_fname, phone
FROM vendor;

CREATE OR REPLACE VIEW contact AS
SELECT DISTINCT contact_fname, phone
FROM vendor;

/* Query 7 */ 
CREATE VIEW order_items AS
SELECT orders.order_id, orders.order_date, orders.tax_amount, orders.ship_date,
orderitems.item_price, orderitems.discount_amount, (orderitems.item_price - orderitems.discount_amount) AS final_price, orderitems.quantity, (orderitems.item_price - orderitems.discount_amount) * orderitems.quantity as item_total,
product.product_name
FROM orders
JOIN orderitems ON orders.order_id = orderitems.order_id
JOIN product ON product.product_id = orderitems.product_id;

/* Query 8 */
CREATE VIEW reorder_info AS
SELECT product.product_id, product.product_name, vendor.contact_fname, vendor.phone
FROM product
JOIN vendor ON product.vendor_id = vendor.vendor_id;


