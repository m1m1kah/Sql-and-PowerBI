-- Customers with Highest Profit Margins -- 

WITH CustomerStats AS (
    SELECT 
        `Customer ID`, `Customer Name`,
        SUM(`Profit`) AS total_profit,
        SUM(`Sales`) AS total_sales
    FROM salesdata
    GROUP BY `Customer ID`, `Customer Name`
)
SELECT *,
       ROUND(total_profit / NULLIF(total_sales, 0), 2) AS profit_margin
FROM CustomerStats
ORDER BY profit_margin DESC;
