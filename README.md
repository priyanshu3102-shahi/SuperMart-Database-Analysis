# SuperMart-Database-Analysis
The analysis covers key business metrics, performance ranking using advanced window functions, and time-series calculations using PostgreSQL.

The project is structured around three core datasets: Customer, Product, and Sales.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

**🛠️ Technology Stack**
- Database: PostgreSQL (Ideal for running the advanced window function queries).
- Management: pgAdmin (or a similar tool like DBeaver, VS Code SQL Client) for database setup and query execution.
- Language: SQL

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

**🚀 Getting Started**

1. Database Setup <br>
- Download Datasets: Ensure you have the three core datasets (Customer.csv, Product.csv, Sales.csv) available.
- Import to pgAdmin: Connect to your PostgreSQL server using pgAdmin.
- Schema and Table Creation: Run the script sql/01_schema_creation.sql to create the Customer, Product, and Sales tables with the appropriate column types.
- Load Data: Use pgAdmin's import/restore feature to load the data from the three CSV files into their respective tables.

2.Running the Analysis <br>
The analytical queries are divided into three files:
- supermart_schema_creation.sql       Table creation and Importing Data into PgAdmin from .csv file
- supermart_basic_queries.sql         Fundamental Aggregations
- supermart_windows_function.sql      Advanced Analytics

You can execute these files directly in your pgAdmin Query Tool to view the results for all 20 questions.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

**💡 Key Analytical Insights**<br>
The included SQL scripts address critical business questions to provide a comprehensive view of SuperMart's performance:

Performance & Distribution<br>
- Regional Performance: Determining the total sales amount and percentage of total sales contributed by each region.
- Customer Segmentation: Quantifying the sales contribution of each customer segment (e.g., Corporate, Consumer).
- Product Success: Identifying top-selling products and total sales for each category and subcategory.

Customer Analysis<br>
- Top Customers: Identifying the Top 5 Customers by sales and the Top 3 Customers by profit within each region.
- Customer Geography: Analyzing customer distribution across various states.

Advanced Time-Series & Ranking <br>
- Cumulative Tracking: Calculating the running total (cumulative sum) of sales and profit over time for individual products and customers.
- Ranking: Implementing the RANK() function to rank products by sales within their specific category.
- Moving Average: Calculating the moving average of sales over the last three orders to smooth out short-term fluctuations and identify trends.
- Sequential Difference: Using the LAG() function to find the difference in sales between consecutive days for each product.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

**📂 Project Structure**

supermart_db_analysis/<br>
├── data/<br>
│   ├── Customer.csv<br>
│   ├── Product.csv<br>
│   └── Sales.csv<br>
├── sql/<br>
│   ├── supermart_schema_creation.sql<br>
│   ├── supermart_basic_analysis_queries.sql<br>
│   ├── supermart_window_function_queries.sql<br>
|   └── main.sql                                      # both basic and windows functions queries at one place           <br>          
└── README.md<br>








