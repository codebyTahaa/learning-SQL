SELECT city,count(city) AS count_of_city
FROM sales.customers
GROUP BY city
ORDER BY city

SELECT order_id YEAR (order_id) AS order_year
FROM sales.orders
GROUP BY order_id, YEAR(order_date); 


--aggregate function
--SUM,AVG,MIN,MAX,COUNT
SELECT category_id,SUM(list_price)
FROM production.products
GROUP BY category_id
SELECT category_id, AVG(list_price)
FROM production.products
GROUP BY category_id
SELECT category_id,MIN(list_price)
FROM production.products
GROUP BY category_id
SELECT category_id,MAX(list_price)
FROM production.products
GROUP BY category_id
SELECT category_id,COUNT(list_price)
FROM production.products
GROUP BY category_id

SELECT category_id, MIN (list_price) as min_value ,
		MAX(list_price) as max_value,
		AVG(list_price) as avg_value
FROM production.products
GROUP BY category_id
HAVING MIN(list_price)>100 AND MAX(list_price)>3000

SELECT
    b.brand_name AS brand,
    c.category_name AS category,
    p.model_year,
    round(
        SUM (
            quantity * i.list_price * (1 - discount)
        ),
        0
    ) sales INTO sales.sales_summary
FROM
    sales.order_items i
INNER JOIN production.products p ON p.product_id = i.product_id
INNER JOIN production.brands b ON b.brand_id = p.brand_id
INNER JOIN production.categories c ON c.category_id = p.category_id
GROUP BY
    b.brand_name,
    c.category_name,
    p.model_year
ORDER BY
    b.brand_name,
    c.category_name,
    p.model_year;
SELECT *
FROM sales.sales_summary

--group by brand
SELECT brand, SUM(sales) as total_sales
FROM sales.sales_summary
GROUP BY  brand
ORDER BY brand

--group by category and brand
SELECT
    brand,
    category,
    SUM (sales) sales
FROM
    sales.sales_summary
GROUP BY
    brand,
    category
ORDER BY
    brand,
    category; 
--grouping set
SELECT
	SUM(sales) sales
FROM 
	sales.sales_summary

--grouping set
SELECT
	brand,
	category,
	SUM (sales) sales
FROM
	sales.sales_summary
GROUP BY
	GROUPING SETS (
		(brand, category),
		(brand),
		(category),
		()
	)
ORDER BY
	brand,
	category;
--cube
SELECT brands,category ,SUM as total_sales
FROM sales.sales_summary
	ROLLUP(category,brand)
GROUP BY brand,category

--union
SELECT first_name,last_name
FROM sales.customers
UNION
SELECT first_name,last_name
FROM sales.staffs
SELECT first_name,last_name
FROM sales.customers
UNION ALL
SELECT first_name,last_name
FROM sales.staffs
SELECT first_name,last_name
FROM sales.customers
INTERSECT	
SELECT first_name,last_name
FROM sales.staffs
