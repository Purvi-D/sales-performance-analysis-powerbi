SELECT *
FROM orders;

-- Row Count

SELECT count(*) AS total_rows 
FROM orders;

-- Checking Data

SELECT * 
FROM orders 
LIMIT 10;

-- ---------------Cleaning Data---------
-- Changing date type from TEXT to DATE

SELECT `Order Date`, str_to_date(`Order Date`,'%m%d%Y')
FROM orders
LIMIT 5;

-- Convert Order Date
UPDATE orders
SET `Order Date` = STR_TO_DATE(`Order Date`, '%m/%d/%Y');

-- Convert Ship Date
UPDATE orders
SET `Ship Date` = str_to_date(`Ship Date`,'%m/%d/%Y');

-- Change Column Type to DATE

ALTER TABLE orders
MODIFY `Order Date` DATE; 

ALTER TABLE orders
MODIFY `Ship Date` DATE;

-- Verify and check
SELECT `Order Date`, `Ship Date`
FROM orders
LIMIT 5;

-- ---------DATA CLEANING IS DONE NOW DOING ANALYSIS--------

-- 1. Checking company's performance

SELECT 
    ROUND(SUM(Sales),2) AS Total_sales,
    ROUND(SUM(Profit),2) AS Total_profit,
    ROUND((SUM(Profit)/SUM(Sales))*100,2) AS Profit_margin_percent
FROM orders;

-- 2. Sales by region

SELECT Region,
	ROUND(SUM(Sales),2) AS Total_sales,
    ROUND(SUM(Profit),2) AS Total_profit
FROM orders
GROUP BY Region
ORDER BY Total_sales DESC;

-- --------Now time to check CATEGORY and PROFIT ANALYSIS--------
-- 1. SALES and PROFIT by CATEGORY

-- CATEGORY WITH HIGHEST SALES
SELECT Category,
	ROUND(SUM(Sales),2) AS Total_sales,
    ROUND(SUM(Profit),2) AS Total_profit,
    ROUND((SUM(Profit)/SUM(Sales))*100,2) AS Profit_margin_percent
FROM orders
GROUP BY Category
ORDER BY Total_sales DESC
;   -- Tech,Fur,Off Supp

-- CATEGORY WITH HIGHEST PROFIT
SELECT Category,
	ROUND(SUM(Sales),2) AS Total_sales,
    ROUND(SUM(Profit),2) AS Total_profit,
    ROUND((SUM(Profit)/SUM(Sales))*100,2) AS Profit_margin_percent
FROM orders
GROUP BY Category
ORDER BY Total_profit DESC
;  -- Tech,Off Supp,Fur 
 
-- CATEGORY WITH LOW MARGIN
SELECT Category,
	ROUND(SUM(Sales),2) AS Total_sales,
    ROUND(SUM(Profit),2) AS Total_profit,
    ROUND((SUM(Profit)/SUM(Sales))*100,2) AS Profit_margin_percent
FROM orders
GROUP BY Category
ORDER BY Profit_margin_percent
;  -- Furniture is with Low margin


-- Now I will check Profits by Sub-Category

SELECT `Sub-Category`,
ROUND(SUM(Profit),2) AS Total_profit
FROM orders
GROUP BY `Sub-Category`
Order BY Total_Profit ASC
; -- Tables	-17725.48, Bookcases -3472.56, Supplies	-1348.57 making LOSSES
  -- Copiers	55617.82 making PROFIT
 
 
-- Suspect discounts may cause losses.
SELECT 
    Discount,
    ROUND(AVG(Profit),2) AS avg_profit,
    COUNT(*) AS order_count
FROM orders
GROUP BY Discount
ORDER BY Discount;

-- Q.Does higher discount reduce profit? -> Yes

-- Q. At what discount does profit turn negative? -> 0.3 Onwards

-- Q.Should company cap discounts?


-- Now checking are loss-making Tables heavily discounted?
SELECT 
    `Sub-Category`,
    Discount,
    ROUND(AVG(Profit),2) AS avg_profit,
    COUNT(*) AS order_count
FROM orders
WHERE `Sub-Category` = 'Tables'
GROUP BY Discount
ORDER BY Discount;


-- Top 10 CUSTOMERS by SALES
SELECT `Customer Name`,
    ROUND(SUM(Sales),2) AS Total_sales,
    ROUND(SUM(Profit),2) AS Total_profit
FROM orders
GROUP BY `Customer Name`
ORDER BY Total_sales DESC
LIMIT 10
;

-- Which segment is most profitable
SELECT 
    Segment,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit,
    ROUND((SUM(Profit)/SUM(Sales))*100,2) AS margin_percent
FROM orders
GROUP BY Segment
ORDER BY total_sales DESC;


-- calculating customers who placed more than 1 order
SELECT `Customer Name`,
	COUNT(DISTINCT `Order ID`) AS Total_orders,
    ROUND(SUM(Sales),2) AS Total_sales
FROM orders
GROUP BY `Customer Name`
HAVING Total_orders > 1
ORDER BY Total_orders DESC
LIMIT 10
;


-- Customer Retention Indicator
SELECT 
    COUNT(DISTINCT `Customer ID`) AS total_customers,
    COUNT(DISTINCT CASE WHEN order_count > 1 THEN `Customer ID` END) AS repeat_customers
FROM (
    SELECT 
        `Customer ID`,
        COUNT(DISTINCT `Order ID`) AS order_count
    FROM orders
    GROUP BY `Customer ID`
) sub;

-- Counting Loss Making Customers
SELECT COUNT(*) AS loss_making_customers
FROM (
    SELECT `Customer Name`
    FROM orders
    GROUP BY `Customer Name`
    HAVING SUM(Profit) < 0
) t;  -- 157


-- Monthly Revenue
SELECT 
    DATE_FORMAT(`Order Date`, '%Y-%m') AS month,
    ROUND(SUM(Sales),2) AS monthly_sales,
    ROUND(SUM(Profit),2) AS monthly_profit
FROM orders
GROUP BY month
ORDER BY month;

-- Yearly Growth(Showing Year with Highest Sales)
SELECT 
    YEAR(`Order Date`) AS year,
    ROUND(SUM(Sales),2) AS yearly_sales
FROM orders
GROUP BY year
ORDER BY year;

-- Top Performing Month
SELECT *
FROM (
    SELECT 
        DATE_FORMAT(`Order Date`, '%Y-%m') AS month,
        SUM(Sales) AS total_sales,
        RANK() OVER (ORDER BY SUM(Sales) DESC) AS sales_rank
    FROM orders
    GROUP BY month
) ranked
WHERE sales_rank = 1;