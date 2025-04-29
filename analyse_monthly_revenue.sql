CREATE DATABASE ElevateLabs;

CREATE TABLE Sales_Data(
Order_Date DATE,
Order_ID INT,
Product VARCHAR(100),
Product_ean FLOAT,
categories VARCHAR(100),
Purchase_Address VARCHAR(100),
Quantity_Ordered INT,
Price_each FLOAT,
Cost_price FLOAT,
turnover FLOAT,
margin FLOAT
);
COPY Sales_Data FROM 'C:\Elevate lab internship\sales_data.csv\sales_data.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM Sales_Data;

SELECT
    EXTRACT(YEAR FROM Order_Date) AS Year,
    EXTRACT(MONTH FROM Order_Date) AS Month,
    ROUND(SUM(turnover)::numeric, 2) AS Total_Revenue,
    COUNT(DISTINCT Order_ID) AS Order_Volume
FROM
    Sales_Data
GROUP BY
    Year, Month
ORDER BY
    Year ASC, Month ASC;


SELECT
    EXTRACT(YEAR FROM Order_Date) AS Year,
    EXTRACT(MONTH FROM Order_Date) AS Month,
    ROUND(SUM(turnover)::numeric, 2) AS Total_Revenue,
    COUNT(DISTINCT Order_ID) AS Order_Volume,
    (SUM(turnover)/COUNT(DISTINCT Order_ID)::numeric, 2) AS Avg_Revenue_Per_Order
FROM
    Sales_Data
/* 
CHOOSE ONE TIME FRAME FILTER (REMOVE OTHER WHERE CLAUSES):
*/
-- 1. For specific year (e.g., 2023)
WHERE EXTRACT(YEAR FROM Order_Date) = 2019

-- 2. For date range (e.g., entire 2022-2023)
-- WHERE Order_Date BETWEEN '2022-01-01' AND '2023-12-31'

-- 3. For last 12 months (rolling period)
-- WHERE Order_Date >= CURRENT_DATE - INTERVAL '12 months'

-- 4. For specific quarter (e.g., Q2 2023)
-- WHERE EXTRACT(YEAR FROM Order_Date) = 2023 
-- AND EXTRACT(QUARTER FROM Order_Date) = 2

-- 5. For year-to-date analysis
-- WHERE EXTRACT(YEAR FROM Order_Date) = EXTRACT(YEAR FROM CURRENT_DATE)
-- AND Order_Date <= CURRENT_DATE
GROUP BY
    Year, Month
ORDER BY
 Total_Revenue ASC;

	


