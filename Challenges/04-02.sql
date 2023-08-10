-- generate a sales report showing total sales per month and an annual running total

SELECT 
  STRFTIME('%Y', sls.soldDate) AS soldYear,
  STRFTIME('%m', sls.soldDate) AS soldMonth,
  SUM(sls.salesAmount) AS monthlySales
FROM sales AS sls
GROUP BY STRFTIME('%Y', sls.soldDate), STRFTIME('%m', sls.soldDate);

WITH cte_sales AS (
  SELECT 
    STRFTIME('%Y', soldDate) AS soldYear,
    STRFTIME('%m', soldDate) AS soldMonth,
    SUM(salesAmount) AS monthlySales
  FROM sales
  GROUP BY soldYear, soldMonth
)
SELECT soldYear, soldMonth, monthlySales,
  SUM(monthlySales) OVER (
    PARTITION BY soldYear
    ORDER BY soldYear, soldMonth) AS annualSalesRunningTotal
FROM cte_sales
ORDER BY soldYear, soldMonth;