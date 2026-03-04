# Sales Performance & Loss Analysis Dashboard
## EXECUTIVE SUMMARY

This project analyzes company sales performance and profitability using SQL and Power BI.</br>
The analysis focuses on identifying revenue trends, regional performance, and loss-making customers.</br>
Although overall sales performance is strong, deeper analysis revealed that a segment of customers is negatively impacting profitability.</br>
The dashboard provides actionable insights to help management optimize pricing strategies and improve margins.

## BUSINESS PROBLEM
### Problem Statement
The company is generating strong revenue, but profitability concerns exist at the customer and product level.</br></br>
**Management needs answers to:** </br>
•	Are we truly profitable?</br>
•	Which regions drive the most revenue?</br>
•	Are certain customers causing financial losses?</br>
•	What factors may be impacting margins?

## Analytical Flow </br>
Raw Sales Data</br>
            ↓</br>
SQL Aggregation & Cleaning</br>
            ↓</br>
Power BI KPI Creation (DAX Measures)</br>
            ↓</br>
Loss Detection (Profit < 0)</br>
            ↓</br>
Customer Ranking (Top 10 Loss Customers)</br>
            ↓</br>
Regional & Time Trend Analysis</br>
            ↓</br>
Business Recommendations</br>

## METHODOLOGY</br>
Step 1: Data Preparation</br>
- Connected MySQL database to Power BI</br>
- Validated data consistency</br>
- Created derived columns (Year from Order Date)</br>

Step 2: KPI Development / Created DAX measures:</br>
- Total Sales</br>
- Total Profit</br>
- Total Orders</br>
- Profit Margin %</br>
- Loss Rank (RANKX logic)</br>
- Loss Customer Count</br>

Step 3: Loss Analysis</br>
- Filtered customers where Total Profit < 0</br>
- Identified 157 loss-making customers</br>
- Applied ranking logic to detect top 10 contributors</br>

Step 4: Visualization & Dashboard Design</br>
- Designed KPI cards</br>
- Created regional performance chart</br>
- Built loss customer table</br>
- Developed Top 10 loss customer bar chart</br>
- Added slicers (Year, Region, Category)</br>

## SKILLS DEMONSTRATED
Technical Skills</br>
- SQL (Aggregation, Group By, Filtering)</br>
- Power BI</br>
- DAX (RANKX, CALCULATE, FILTER, DISTINCTCOUNT)</br>
- Data Modeling</br>
- Data Visualization</br>
- Business Analysis</br>

Analytical Skills</br>
- Profitability analysis</br>
- Loss detection</br>
- Ranking logic</br>
- Filter context understanding</br>
- Business storytelling</br>

## RESULTS & BUSINESS RECOMMENDATIONS

- Key Results</br>
- Total Sales: £2.27M</br>
- Total Profit: £280K</br>
- Profit Margin: 12%</br>
- 157 customers contributed £71K in losses</br>
- Top 10 customers significantly impact total losses</br>
- West region generates highest sales</br>
- November 2017 was peak sales month</br>

## Business Insights

While overall revenue performance is strong, profitability is impacted by a concentrated group of loss-making customers.</br>
The top 10 customers alone contribute a significant portion of total losses, indicating potential pricing or discount inefficiencies.

## Recommendations

- Review discount policies for high-loss customers</br>
- Re-evaluate pricing strategy for low-margin segments</br>
- Focus retention efforts on profitable customers</br>
- Monitor profitability trends by region and product category</br>

## Dashboard Preview
<img width="1755" height="1241" alt="image" src="https://github.com/user-attachments/assets/98330003-55fd-4e36-adb6-9b605b3b8330" />


## NEXT STEPS

Potential future enhancements:</br>
- Discount vs Profit correlation analysis</br>
- Category-level loss analysis</br>
- Customer profitability segmentation</br>
- Year-over-Year growth analysis</br>



