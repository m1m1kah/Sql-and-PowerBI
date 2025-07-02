-- Data Cleaning--

-- Top 3 most profitable products per category using CTE + RANK in MySQL


WITH ProductProfit AS (
    SELECT
        `Category`,
        `Sub-Category`,
        `Product Name`,
        SUM(`Profit`) AS total_profit
    FROM salesdata
    GROUP BY `Category`, `Sub-Category`, `Product Name`
),
-- Above is a CTE called "ProductProfit" that calculates total profit for each product grouped by "Category", "Sub-Category", Product Name"
-- "WITH" is a key command to create the CTE 


Ranked AS (
    SELECT *,
        RANK() OVER (
            PARTITION BY `Category`
            ORDER BY total_profit DESC
        ) AS profit_rank
    FROM ProductProfit
)
-- This  creates a CTE called "Ranked" built on the previous one "Product Profit"
-- Within each "Category", it ranks products by "total_profit" 


SELECT *
FROM Ranked
WHERE profit_rank <= 3
ORDER BY `Category`, profit_rank;
-- This selects all the data from the Ranked CTE and orders the results by "Category" and "profit_rank" 
-- Then it returns hte top 3 most profitable products per Category (through WHERE statement)  
