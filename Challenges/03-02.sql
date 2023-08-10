-- create a report that shows the amount of sales per employee for each month in 2021

-- query to get the needed data
SELECT emp.employeeId, emp.firstName, emp.lastName, sls.soldDate, sls.salesAmount
FROM employee AS emp
LEFT JOIN sales AS sls USING(employeeId)
WHERE soldDate >= '2021-01-01'
  AND soldDate <= '2021-12-31';

-- case statement to separate by month
SELECT emp.firstName, emp.lastName,
  CASE WHEN STRFTIME('%m', soldDate) = '01'
    THEN SUM(salesAmount) END AS JanSales,
  CASE WHEN STRFTIME('%m', soldDate) = '02'
    THEN SUM(salesAmount) END AS FebSales,
  CASE WHEN STRFTIME('%m', soldDate) = '03'
    THEN SUM(salesAmount) END AS MarSales,
  CASE WHEN STRFTIME('%m', soldDate) = '04'
    THEN SUM(salesAmount) END AS AprSales,
  CASE WHEN STRFTIME('%m', soldDate) = '05'
    THEN SUM(salesAmount) END AS MaySales,
  CASE WHEN STRFTIME('%m', soldDate) = '06'
    THEN SUM(salesAmount) END AS JunSales,
  CASE WHEN STRFTIME('%m', soldDate) = '07'
    THEN SUM(salesAmount) END AS JulSales,
  CASE WHEN STRFTIME('%m', soldDate) = '08'
    THEN SUM(salesAmount) END AS AugSales,
  CASE WHEN STRFTIME('%m', soldDate) = '09'
    THEN SUM(salesAmount) END AS SepSales,
  CASE WHEN STRFTIME('%m', soldDate) = '10'
    THEN SUM(salesAmount) END AS OctSales,
  CASE WHEN STRFTIME('%m', soldDate) = '11'
    THEN SUM(salesAmount) END AS NovSales,
  CASE WHEN STRFTIME('%m', soldDate) = '12'
    THEN SUM(salesAmount) END AS DecSales
FROM employee AS emp
LEFT JOIN sales AS sls USING(employeeId)
WHERE soldDate >= '2021-01-01'
  AND soldDate <= '2021-12-31'
GROUP BY emp.lastName, emp.firstName
ORDER BY emp.lastName, emp.firstName;
