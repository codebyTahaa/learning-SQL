--veriy version
SELECT @@VERSION
--we created database
USE BikeStores;
--select all
SELECT * FROM sales.customers;
--slicing
SELECT first_name,last_name FROM sales.customers;
--select with filter
SELECT * FROM sales.customers WHERE state = 'CA';
SELECT * FROM sales.customers WHERE state = 'NY';
--select with filter and order
FROM >> WHERE >> GROUP BY>> HAVING >> SELECT >> ORDER BY
SELECT * FROM sales.customers WHERE state = 'NY' ORDER BY first_name;
--select with filter,order,order by and order by
SELECT City count(*) AS city_count 
FROM sales.customers 
WHERE state = 'NY'  
GROUP BY City 
HAVING count(*) > 10;
--sorting data
SELECT *
FROM sales.customers
ORDER BY first_name; --by default ascending
SELECT *
FROM sales.customers
ORDER BY first_name DESC; --for descending
SELECT *
FROM sales.customers
ORDER BY first_name ASC,last_name DESC;
SELECT first_name,last_name
FROM sales.customers
ORDER BY LEN(first_name),LEN(last_name);
--OFFSET
SELECT *
FROM sales.customers
ORDER BY first_name
OFFSET 10 ROWS;
--fetch always use with offset 
--offset/fetch have limitation that is they can be use only with ORDER BY
SELECT *
FROM sales.customers
ORDER BY first_name
--OFFSET 10 ROWS
OFFSET 0 ROWS
FETCH NEXT 10 ROWS ONLY;
--TOP 
SELECT TOP 2 WITH TIES*
FROM sales.customers
ORDER BY state
--FOR PERCENT 
SELECT TOP 1 PERCENT*
FROM sales.customers
--








