use retailanalytics;
DROP TABLE retail_sales;
CREATE TABLE retail_sales (
    row_id INT,
    order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales FLOAT,
    quantity INT,
    discount FLOAT,
    profit FLOAT
);
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Superstore.csv'
INTO TABLE retail_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
SELECT * FROM retail_sales LIMIT 5;
SELECT SUM(sales) AS Total_Sales
FROM retail_sales;
SELECT customer_name,
       SUM(sales) AS Total_Sales
FROM retail_sales
GROUP BY customer_name
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT product_name,
       SUM(quantity) AS Quantity_Sold
FROM retail_sales
GROUP BY product_name
ORDER BY Quantity_Sold DESC
LIMIT 10;
SELECT MONTH(order_date) AS Month,
       SUM(sales) AS Revenue
FROM retail_sales
GROUP BY Month
ORDER BY Month;
SELECT category,
       SUM(profit) AS Profit
FROM retail_sales
GROUP BY category;