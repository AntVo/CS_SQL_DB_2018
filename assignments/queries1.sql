/*
	Assignment 1.sql
	Antoine Vo
	CS 31A, Spring 2018 
*/


/* Query 0 */

CREATE DATABASE IF NOT EXISTS college;
USE college;

/* Query 1 */

CREATE TABLE instructor (
emp_num int,
dept_code varchar(10),
office varchar(50),
degree varchar(5)
)ENGINE = INNODB;

/* Query 2 */

INSERT INTO instructor VALUES('103','HIST','DRE 156','Ph.D.');
INSERT INTO instructor VALUES('104','ENG','DRE 102','MA');
INSERT INTO instructor VALUES('105','ACCT','KLR 229D','Ph.D.');
INSERT INTO instructor VALUES('110','BIOL','AAK 160','Ph.D.');
INSERT INTO instructor VALUES('114','ACCT','KLR 211','Ph.D.');
INSERT INTO instructor VALUES('209','CIS','KLR 333','Ph.D.');

/* Query 3 */

SHOW TABLES;

/* Query 4 */

DESC instructor;

/* Query 5 */

SELECT * 
FROM instructor;

/* Query 6 */

SELECT emp_num, degree 
FROM instructor;