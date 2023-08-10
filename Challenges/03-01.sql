-- show total sales per year

WITH cte AS (
  SELECT strftime('%Y', soldDate) AS soldYear, salesAmount
  FROM sales
)
SELECT soldYear, ROUND(SUM(salesAmount), 2) AS totalSales
FROM cte
GROUP BY soldYear
ORDER BY soldYear;