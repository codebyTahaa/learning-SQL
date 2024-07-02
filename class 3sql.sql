USE BikeStores

--section 4 filtering data
SELECT city
FROM sales.customers
ORDER BY city
--FOR removing duplication
SELECT DISTINCT city
FROM sales.customers
ORDER BY city
--also used for multiple columns
SELECT DISTINCT city,state
FROM sales.customers
ORDER BY city,state
--distinct always take null values as one entity
SELECT DISTINCT phone
FROM sales.customers
ORDER BY phone
--distinct vs group by
SELECT city,state
FROM sales.customers
GROUP BY city,state
ORDER BY city,state
SELECT DISTINCT city,state,customer_id
FROM sales.customers
GROUP BY city,state,customer_id
ORDER BY city,state,customer_id

SELECT product_id,product_name,model_year,list_price,category_id
FROM production.products
WHERE   model_year = 2018 AND list_price BETWEEN 900.99 AND 2000.99
ORDER BY list_price DESC

SELECT product_id,product_name,model_year,list_price,category_id
FROM production.products
WHERE   category_id = 1 OR model_year = 2018
ORDER BY list_price DESC

SELECT product_id,product_name,model_year,list_price,category_id
FROM production.products
WHERE list_price IN (379.99,999.99,599.99)
ORDER BY list_price DESC

SELECT product_id,
product_name,
model_year AS 'year'
,list_price 'product_price'
,category_id'product_category'
FROM production.products
WHERE product_name LIKE '__ectra%'
ORDER BY product_name 

--section 5 joining tables
CREATE SCHEMA hr ;
go
CREATE TABLE hr.candidates(
    id INT IDENTITY (1,1) PRIMARY KEY,
	fullname VARCHAR (100) NOT NULL
);
CREATE TABLE hr.employees(
    id INT IDENTITY (1,1) PRIMARY KEY,
	fullname VARCHAR (100) NOT NULL
);
INSERT INTO
    hr.candidates(fullname)
VALUES
     ('John Doe'),
    ('Lily Bush'),
    ('Peter Drucker'),
    ('Jane Doe');
INSERT INTO 
    hr.employees(fullname)
VALUES
    ('John Doe'),
    ('Jane Doe'),
    ('Michael Scott'),
    ('Jack Sparrow');

SELECT*
FROM hr.employees;
--inner join
--LEFT TABLE == CANDIDATES
--RIGHT TABLE == EMPLOYEES
SELECT
	c.id,
	c.fullname,
	e.id,
	e.fullname	
FROM hr.candidates c
INNER JOIN hr.employees e
ON c.fullname = e.fullname
--left join	
SELECT
	c.id,
	c.fullname,
	e.id,
	e.fullname	
FROM hr.candidates c
LEFT JOIN hr.employees e
ON c.fullname = e.fullname
--right join
SELECT
	c.id,
	c.fullname,
	e.id,
	e.fullname	
FROM hr.candidates c
RIGHT JOIN hr.employees e
ON c.fullname = e.fullname
--FULL join
SELECT
	c.id,
	c.fullname,
	e.id,
	e.fullname	
FROM hr.candidates c
FULL JOIN hr.employees e
ON c.fullname = e.fullname
--left Anti join
SELECT
	c.id,
	c.fullname,
	e.id,
	e.fullname	
FROM hr.candidates c
LEFT JOIN hr.employees e
ON c.fullname = e.fullname
WHERE e.id IS NULL
--RIGHT anti join
SELECT
	c.id,
	c.fullname,
	e.id,
	e.fullname	
FROM hr.candidates c
RIGHT JOIN hr.employees e
ON c.fullname = e.fullname
WHERE c.id IS NOT NULL
CREATE DATABASE testing;
go
CREATE SCHEMA cross_join
GO

CREATE TABLE Meals(MealName VARCHAR(100));
CREATE TABLE Drinks(DrinkName VARCHAR(100));
INSERT INTO Drinks
VALUES('Orange Juice'), ('Tea'), ('Cofee');
INSERT INTO Meals
VALUES('Omlet'), ('Fried Egg'), ('Sausage');
SELECT *
FROM Meals
CROSS JOIN Drinks;