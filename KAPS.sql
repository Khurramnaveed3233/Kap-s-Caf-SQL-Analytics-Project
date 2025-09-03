create database kaps_cafe 

use kaps_cafe

select * from kaps

-- Q.1. What is the total sales value (₹) for each month?

SELECT 
    FORMAT(transaction_date, 'yyyy-MM') AS Month,
    ROUND(SUM(unit_price * transaction_qty), 2) AS Total_Sales
FROM KAPS
GROUP BY FORMAT(transaction_date, 'yyyy-MM')
ORDER BY MIN(transaction_date);


-- Q.2. What is the month-on-month (MoM) increase or decrease in total sales (₹)?

WITH MonthlySales AS (
    SELECT 
        FORMAT(transaction_date, 'yyyy-MM') AS Month,
        SUM(unit_price * transaction_qty) AS Total_Sales
    FROM KAPS
    GROUP BY FORMAT(transaction_date, 'yyyy-MM')
)
SELECT 
    Month, Total_Sales, (Total_Sales - LAG(Total_Sales) OVER (ORDER BY Month)) AS MoM_Change
FROM MonthlySales
ORDER BY Month;

-- Q.3 What is the absolute difference in total sales (₹) between the selected month and its previous 

WITH MonthlySales AS (
    SELECT 
        FORMAT(transaction_date, 'yyyy-MM') AS Month,
        SUM(unit_price * transaction_qty) AS Total_Sales
    FROM KAPS
    GROUP BY FORMAT(transaction_date, 'yyyy-MM')
)
SELECT 
    Month,
    Total_Sales,
    ABS(Total_Sales - LAG(Total_Sales) OVER (ORDER BY Month)) AS Abs_Difference
FROM MonthlySales
ORDER BY Month;


-- Q.4. What is the total number of orders for each month?

SELECT 
    FORMAT(transaction_date, 'yyyy-MM') AS Month,
    COUNT(DISTINCT transaction_id) AS Total_Orders
FROM KAPS
GROUP BY FORMAT(transaction_date, 'yyyy-MM')
ORDER BY MIN(transaction_date);


-- Q.5.  What is the month-on-month (MoM) increase or decrease in the number of orders?

WITH MonthlyOrders AS (
    SELECT 
        FORMAT(transaction_date, 'yyyy-MM') AS Month,
        COUNT(DISTINCT transaction_id) AS Total_Orders
    FROM KAPS
    GROUP BY FORMAT(transaction_date, 'yyyy-MM')
)
SELECT 
    Month,
    Total_Orders,
    (Total_Orders - LAG(Total_Orders) OVER (ORDER BY Month)) AS MoM_Change_Orders
FROM MonthlyOrders
ORDER BY Month;


-- Q.6.  What is the absolute difference in the number of orders between the selected month and its previous month?

WITH MonthlyOrders AS (
    SELECT 
        FORMAT(transaction_date, 'yyyy-MM') AS Month,
        COUNT(DISTINCT transaction_id) AS Total_Orders
    FROM KAPS
    GROUP BY FORMAT(transaction_date, 'yyyy-MM')
)
SELECT 
    Month,
    Total_Orders,
    ABS(Total_Orders - LAG(Total_Orders) OVER (ORDER BY Month)) AS Abs_Difference_Orders
FROM MonthlyOrders
ORDER BY Month;


--- Q.7. . Total Quantity Sold Analysis

WITH MonthlyQty AS (
    SELECT 
        FORMAT(transaction_date, 'yyyy-MM') AS Month,
        SUM(transaction_qty) AS Total_Qty
    FROM KAPS
    GROUP BY FORMAT(transaction_date, 'yyyy-MM')
)
SELECT 
    Month,
    Total_Qty,
    (Total_Qty - LAG(Total_Qty) OVER (ORDER BY Month)) AS MoM_Change_Qty,
    ABS(Total_Qty - LAG(Total_Qty) OVER (ORDER BY Month)) AS Abs_Difference_Qty
FROM MonthlyQty
ORDER BY Month;


--- Q.8. What is the total quantity sold (units) for each month?

SELECT 
    FORMAT(transaction_date, 'yyyy-MM') AS Month,
    SUM(transaction_qty) AS Total_Qty_Sold
FROM KAPS
GROUP BY FORMAT(transaction_date, 'yyyy-MM')
ORDER BY MIN(transaction_date);

-- Q.9. What is the month-on-month (MoM) increase or decrease in total quantity sold?

WITH MonthlyQty AS (
    SELECT 
        FORMAT(transaction_date, 'yyyy-MM') AS Month,
        SUM(transaction_qty) AS Total_Qty_Sold
    FROM KAPS
    GROUP BY FORMAT(transaction_date, 'yyyy-MM')
)
SELECT 
    Month,
    Total_Qty_Sold,
    (Total_Qty_Sold - LAG(Total_Qty_Sold) OVER (ORDER BY Month)) AS MoM_Change_Qty
FROM MonthlyQty
ORDER BY Month;

--- Q.10. What is the absolute difference in total quantity sold between the selected month and its previous month?

WITH monthly_qty AS
(
    SELECT FORMAT(transaction_date, 'yyyy-MM') AS month,
           SUM(transaction_qty)                AS total_qty_sold
    FROM   KAPS
    GROUP  BY FORMAT(transaction_date, 'yyyy-MM')
)
SELECT  Month,
        Total_qty_sold,
        ISNULL(ABS(total_qty_sold - LAG(total_qty_sold) OVER (ORDER BY month)), 0) AS Abs_difference_qty
FROM    monthly_qty
ORDER  BY month;

===============================================================================================






