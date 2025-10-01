--1.What is the total sales amount by region?
SELECT c.region, SUM(s.sales) 
FROM customer AS c INNER JOIN sales AS s
ON c.customer_id=s.customer_id
GROUP BY 1;

--2.Which products generated the most sales?
SELECT p.product_id, p.product_name, SUM(s.sales) AS totalsales 
FROM product AS p INNER JOIN sales AS s
ON p.product_id=s.product_id
GROUP BY 1,2 ORDER BY 3 DESC;

--3.How does the discount affect profit?
SELECT CASE 
WHEN discount=0 THEN 'NO DISCOUNT OR 0% DISCOUNT'
WHEN discount>0 AND discount<=0.5 THEN ' 1-50% DISCOUNT'
ELSE ' 50%+ DISCOUNT'
END AS discount_range, AVG(profit) AS avg_profit, 
SUM(sales) AS total_sales, SUM(profit) AS total_profit FROM sales
GROUP BY discount_range ORDER BY total_profit DESC;
--MAX PROFIT IS IN 0% DISCOUNT AND LEAST IS IN 50+% DISCOUNT

--4.How much sales does each customer segment contribute?
SELECT c.segment, SUM(s.sales) AS total_sales
FROM customer AS c INNER JOIN sales AS s
ON c.customer_id=s.customer_id
GROUP BY 1 ORDER BY 2 ASC;

--5.What are the total sales for each product category?
SELECT p.category, SUM(s.sales) AS totalsales 
FROM product AS p INNER JOIN sales AS s
ON p.product_id=s.product_id
GROUP BY 1 ORDER BY 2 ASC;

--6.How many orders were shipped by each shipping mode?
SELECT ship_mode, COUNT(quantity) FROM sales
GROUP BY 1 ORDER BY 2;

--7.What are the total sales for each month?
SELECT EXTRACT(MONTH FROM order_date) AS order_by_month, 
SUM(sales) AS total_sales FROM sales
GROUP BY 1 ORDER BY 1;

--8.How many customers are there in each state?
SELECT state, COUNT(customer_id)
FROM customer GROUP BY 1 ORDER BY 2 DESC;

--9.Who are the top 5 customers in terms of total sales?
SELECT c.customer_name,c.customer_id, SUM(s.sales) AS total_sales 
FROM sales AS s INNER JOIN customer AS c 
ON c.customer_id= s.customer_id 
GROUP BY 1,2 ORDER BY 3 DESC LIMIT 5;

--10.What is the total sales for each product subcategory?
SELECT p.sub_category, SUM(s.sales) AS total_sales
FROM product AS p INNER JOIN sales AS s 
ON p.product_id=s.product_id GROUP BY 1 ORDER BY 2 DESC;
--THERE ARE TOTAL 17 SUBCATEGORY AND THERE TOTAL_SALES