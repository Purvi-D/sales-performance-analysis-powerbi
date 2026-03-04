# Sales Performance & Loss Analysis Dashboard
## EXECUTIVE SUMMARY

This project analyzes company sales performance and profitability using SQL and Power BI.
The analysis focuses on identifying revenue trends, regional performance, and loss-making customers.
Although overall sales performance is strong, deeper analysis revealed that a segment of customers is negatively impacting profitability.
The dashboard provides actionable insights to help management optimize pricing strategies and improve margins.

## BUSINESS PROBLEM
Problem Statement
The company is generating strong revenue, but profitability concerns exist at the customer and product level.
Management needs answers to:
•	Are we truly profitable?
•	Which regions drive the most revenue?
•	Are certain customers causing financial losses?
•	What factors may be impacting margins?

## Analytical Flow 
Raw Sales Data
      ↓
SQL Aggregation & Cleaning
      ↓
Power BI KPI Creation (DAX Measures)
      ↓
Loss Detection (Profit < 0)
      ↓
Customer Ranking (Top 10 Loss Customers)
      ↓
Regional & Time Trend Analysis
      ↓
Business Recommendations

## METHODOLOGY
Step 1: Data Preparation
•	Connected MySQL database to Power BI
•	Validated data consistency
•	Created derived columns (Year from Order Date)
Step 2: KPI Development
Created DAX measures:
•	Total Sales
•	Total Profit
•	Total Orders
•	Profit Margin %
•	Loss Rank (RANKX logic)
•	Loss Customer Count
Step 3: Loss Analysis
•	Filtered customers where Total Profit < 0
•	Identified 157 loss-making customers
•	Applied ranking logic to detect top 10 contributors
Step 4: Visualization & Dashboard Design
•	Designed KPI cards
•	Created regional performance chart
•	Built loss customer table
•	Developed Top 10 loss customer bar chart
•	Added slicers (Year, Region, Category)

## SKILLS DEMONSTRATED
Technical Skills
•	SQL (Aggregation, Group By, Filtering)
•	Power BI
•	DAX (RANKX, CALCULATE, FILTER, DISTINCTCOUNT)
•	Data Modeling
•	Data Visualization
•	Business Analysis
Analytical Skills
•	Profitability analysis
•	Loss detection
•	Ranking logic
•	Filter context understanding
•	Business storytelling

## RESULTS & BUSINESS RECOMMENDATIONS
Key Results
•	Total Sales: £2.27M
•	Total Profit: £280K
•	Profit Margin: 12%
•	157 customers contributed £71K in losses
•	Top 10 customers significantly impact total losses
•	West region generates highest sales
•	November 2017 was peak sales month

## Business Insights
While overall revenue performance is strong, profitability is impacted by a concentrated group of loss-making customers.
The top 10 customers alone contribute a significant portion of total losses, indicating potential pricing or discount inefficiencies.

## Recommendations
•	Review discount policies for high-loss customers
•	Re-evaluate pricing strategy for low-margin segments
•	Focus retention efforts on profitable customers
•	Monitor profitability trends by region and product category

## Dashboard Preview
<img width="1755" height="1241" alt="image" src="https://github.com/user-attachments/assets/98330003-55fd-4e36-adb6-9b605b3b8330" />


## NEXT STEPS
Potential future enhancements:
•	Discount vs Profit correlation analysis
•	Category-level loss analysis
•	Customer profitability segmentation
•	Year-over-Year growth analysis



