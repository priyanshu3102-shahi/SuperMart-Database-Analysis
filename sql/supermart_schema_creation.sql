/* Creating tables and importing recordings for all the tables */

/* Creating table for Sales */
-- Table: Sales (The fact table containing transaction data)
CREATE TABLE Sales (
    "Order Line" INTEGER NOT NULL,          -- Unique ID for each line item, Primary Key
    "Order ID" TEXT NOT NULL,
    "Order Date" DATE NOT NULL,
    "Ship Date" DATE,
    "Ship Mode" TEXT,
    "Customer ID" TEXT NOT NULL,            -- Foreign Key to Customer table
    "Product ID" TEXT NOT NULL,             -- Foreign Key to Product table
    Sales NUMERIC(10, 4),                   -- Sales amount (float64 in CSV)
    Quantity INTEGER,                       -- Number of units sold (int64 in CSV)
    Discount NUMERIC(5, 4),                 -- Discount percentage (float64 in CSV)
    Profit NUMERIC(10, 4),                  -- Profit amount (float64 in CSV)

    -- Define Primary Key
    PRIMARY KEY ("Order Line")
    -- Define Foreign Keys (assuming Customer and Product tables exist)
    -- FOREIGN KEY ("Customer ID") REFERENCES Customer(customer_id),
    -- FOREIGN KEY ("Product ID") REFERENCES Product(product_id)
);
/*importing records*/
COPY Sales
FROM 'C:\Program Files\PostgreSQL\17\import\5.Files for SQL-EXERCISES\Sales.csv' -- change this path accordingly
DELIMITER ';'
CSV HEADER;


/* creating table for Product*/
CREATE TABLE Product (
    product_id TEXT NOT NULL,               -- Primary Key
    product_name TEXT,
    category TEXT,
    sub_category TEXT,

    PRIMARY KEY (product_id)
);
/* Importing recrods */
COPY Product
FROM 'C:\Program Files\PostgreSQL\17\import\5.Files for SQL-EXERCISES\Product.csv'
DELIMITER ';'
CSV HEADER;



/* Creating table for Customer */
CREATE TABLE Customer (
    customer_id TEXT NOT NULL,              -- Primary Key
    customer_name TEXT,
    segment TEXT,
    region TEXT,
    state TEXT,

    PRIMARY KEY (customer_id)
);

/* Importing records into Customer table */
COPY Customer
FROM 'C:/Program Files/PostgreSQL/17/data/files/Final Data to import/Customer.csv'
DELIMITER ';'  
CSV HEADER;

