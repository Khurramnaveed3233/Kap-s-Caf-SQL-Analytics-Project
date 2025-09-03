# Kap's-Cafe - SQL-Analytics-Project

![CoverImage](https://github.com/user-attachments/assets/672c199f-aaaf-4ea7-8c77-df550529f424)

##  Objective

The objective of this project is to analyze **sales, orders, and product quantities** at Kap's Café using SQL Server.  
By applying SQL queries, we aim to uncover **monthly trends, growth patterns, and customer demand behavior**, ultimately enabling data-driven decisions to increase revenue and optimize operations.

---

##  Problem Statement

Kap's Café management wanted to answer key business questions, including:  

1. How much sales revenue is generated each month?  
2. Are sales increasing or decreasing month-over-month?  
3. What is the difference in sales and orders compared to the previous month?  
4. How many unique customer orders are received each month?  
5. How much product quantity is sold, and how does it change monthly?  

Currently, management lacked a structured analysis of their transactional database, making it difficult to track performance and identify areas for growth.

---

##  Data Description

- **Table Name:** `KAPS`  
- **Columns Used:**  
  - `transaction_id` → Unique identifier for each order  
  - `transaction_date` → Date of transaction  
  - `unit_price` → Price of a single unit  
  - `transaction_qty` → Quantity sold in the transaction  

- **Derived Metrics:**  
  - **Revenue** = `unit_price * transaction_qty`  
  - **Monthly Sales, Orders, and Quantities** aggregated using SQL  

---

## Approach
- Wrote **10 SQL queries** in SQL Server to answer business questions.  
- Used **aggregation, CTEs, and window functions (LAG)** for insights.  
- Grouped data by **month (yyyy-MM)** for time-series analysis.  
- Compared **Month-over-Month (MoM)** changes in sales, orders, and quantities.  
- Derived **absolute differences** to highlight the magnitude of change.  

---

## Key Insights

### 1. Monthly Revenue Trends (Q1–Q3)  
- Revenue fluctuated across months, with certain months showing strong growth while others declined.  
- **MoM revenue changes** revealed seasonal patterns.  
- The **absolute sales difference** highlighted high-variance months where business performance shifted significantly.  

### 2. Customer Orders (Q4–Q6)  

- Total number of unique orders varied each month.  
- **MoM order growth** aligned with revenue trends, confirming that higher orders generally drove higher sales.  
- Some months showed **declining orders but stable revenue**, suggesting higher average spend per order.  

### 3. Product Quantities Sold (Q7–Q10)  

- Quantity sold per month showed peaks, possibly linked to promotions or seasonal demand.  
- **MoM change in quantities** revealed demand spikes.  
- **Absolute differences** flagged months with sharp increases/decreases, useful for inventory planning.  

---

##  Recommendations

1. **Boost Revenue in Low-Performing Months**  
   - Launch targeted promotions or discounts in historically weak months.  

2. **Inventory & Supply Chain Optimization**  
   - Use monthly quantity sold trends to predict demand and avoid over/under stocking.  

3. **Customer Retention Programs**  
   - Since orders vary, introducing **loyalty programs** may stabilize demand.  

4. **Pricing Strategy**  
   - In months where orders dropped but sales remained high, study **premium product performance** and replicate strategies.  

---

##  SQL Implementation

Below are **sample queries** (full set available in [`KAPS.sql`](./KAPS.sql)).

### Q1: Monthly Total Sales

       SELECT 
       FORMAT(transaction_date, 'yyyy-MM') AS Month,
       ROUND(SUM(unit_price * transaction_qty), 2) AS Total_Sales
       FROM KAPS
       GROUP BY FORMAT(transaction_date, 'yyyy-MM')
       ORDER BY MIN(transaction_date);

### Q2: Month-over-Month Change in Sales

      WITH MonthlySales AS (
      SELECT 
        FORMAT(transaction_date, 'yyyy-MM') AS Month,
        SUM(unit_price * transaction_qty) AS Total_Sales
      FROM KAPS
      GROUP BY FORMAT(transaction_date, 'yyyy-MM')
      )
      SELECT 
      Month,
      Total_Sales,  (Total_Sales - LAG(Total_Sales) OVER (ORDER BY Month)) AS MoM_Change
      FROM MonthlySales
      ORDER BY Month;

## Conclusion

This project demonstrates the ability to:

- Analyze real-world transactional data in SQL Server
- Apply advanced SQL techniques (CTEs, window functions)
- Translate raw data into business insights and recommendations

By integrating SQL skills with business understanding, this project showcases end-to-end data analytics capabilities valuable for stakeholders and portfolio presentations.

