--11.How can we rank products by their total sales within each product category?
SELECT * FROM(
SELECT *, DENSE_RANK() OVER(PARTITION BY category ORDER BY total_sales DESC) 
AS ranks FROM(SELECT p.product_id, p.product_name, p.category, 
SUM(s.sales) AS total_sales FROM sales AS s INNER JOIN product AS p
ON s.product_id=p.product_id GROUP BY 1,2,3 ORDER BY 4)
AS rnk) AS top_rank WHERE ranks<=3;

--12.How can we calculate cumulative sales over time (running total) for each product?
SELECT*FROM(SELECT product_id, order_date, FLOOR(sales) AS acc_sales,  
SUM(FLOOR(sales)) OVER(PARTITION BY product_id 
ORDER BY order_date) AS running_total FROM sales) AS pro;

--13.How can we find the top 3 customers based on profit within each region?
SELECT * FROM(
SELECT*, DENSE_RANK() OVER(PARTITION BY region ORDER BY total_profit DESC)
AS ranks FROM(SELECT c.customer_id, c.customer_name,c.region,
SUM(s.profit) as total_profit FROM customer AS c INNER JOIN sales AS s 
ON c.customer_id=s.customer_id GROUP BY 1,2) AS top_3) AS top WHERE ranks<=3;

/*14.How can we find the average sales for each segment and assign a row number to each customer
based on their sales?*/
SELECT*FROM
(SELECT*, AVG(avg_sales) OVER(PARTITION BY segment) AS avg_sales_by_segment, ROW_NUMBER() OVER
(PARTITION BY segment ORDER BY avg_sales) AS row_num_for_avg_sales FROM(SELECT c.segment,c.customer_id,
c.customer_name, AVG(s.sales) AS avg_sales FROM customer AS c INNER JOIN sales AS s ON 
c.customer_id=s.customer_id GROUP BY 2,3) AS sales_avg) AS top_avg_sales WHERE row_num_for_avg_sales<=3;

--15.How can we calculate the difference in sales between consecutive days for each product?
SELECT*,LAG(sales, 1) OVER (PARTITION BY product_name ORDER BY order_date) AS sls_diff_of_cons_day
FROM(SELECT p.product_name, p.product_id, s.order_date, SUM(s.sales) as sales FROM product AS p 
INNER JOIN sales AS s ON p.product_id=s.product_id GROUP BY 1,2,3 ORDER BY 4) AS sls_of_cons_day;

--16.How can we calculate the percentage of total sales contributed by each region
SELECT c.region, SUM(s.sales) AS region_sales, SUM(s.sales) * 100.0 / SUM(SUM(s.sales)) 
OVER () AS sales_percent FROM customer AS c INNER JOIN sales AS s
ON c.customer_id = s.customer_id GROUP BY c.region;

--17.How can we calculate the moving average of sales over the last 3 orders for each product?
SELECT p.product_name, s.order_date, FLOOR(AVG(s.sales)) AS avg_sales, 
AVG(FLOOR(s.sales)) OVER (PARTITION BY p.product_name ORDER BY s.order_date 
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg FROM product AS p 
INNER JOIN sales AS s ON p.product_id=s.product_id GROUP BY 1,2,s.sales;

--18.How can we find the largest and smallest order (by sales) for each customer?
SELECT s.sales, c.customer_name,
MIN(s.sales) OVER (PARTITION BY c.customer_name) AS min_sales,
MAX(s.sales) OVER (PARTITION BY c.customer_name) AS max_sales
FROM customer AS c INNER JOIN sales AS s ON c.customer_id = s.customer_id;

--19.How can we calculate the running total of profit for each customer?
SELECT c.customer_name, s.order_date, FLOOR(s.profit), 
SUM(FLOOR(s.profit)) OVER (PARTITION BY c.customer_name ORDER BY s.order_date) AS running_profit
FROM customer AS c INNER JOIN sales AS s
ON c.customer_id = s.customer_id;

--20.How can we assign a dense rank to each sale based on total sales, grouped by ship mode?
SELECT*FROM (SELECT ship_mode, sales,
DENSE_RANK() OVER (PARTITION BY ship_mode ORDER BY sales DESC) AS sales_total_rank
FROM sales GROUP BY 1,2) AS ranks WHERE sales_total_rank<=2;
