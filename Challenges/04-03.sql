-- create a report showing the number of cars sold this month and last month

-- get year and month of each sale
SELECT
  STRFTIME('%Y-%m', soldDate) AS soldYearMonth,
  COUNT(SalesId) AS salesCount,
  LAG(COUNT(SalesId), 1, 0) OVER calMonth AS LastMonthCarsSold
FROM sales
GROUP BY STRFTIME('%Y-%m', soldDate)
WINDOW calMonth AS (ORDER BY STRFTIME('%Y-%m', soldDate))
ORDER BY STRFTIME('%Y-%m', soldDate);