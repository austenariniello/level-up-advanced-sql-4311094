-- report the least and most expensive car sold byb each employee this year

SELECT 
  e.employeeId, e.firstName, e.lastName,
  MAX(s.salesAmount) AS maxSale,
  MIN(s.salesAmount) AS minSale
FROM employee AS e
LEFT JOIN sales AS s USING(employeeId)
WHERE s.soldDate LIKE '%2023%'
GROUP BY e.employeeId;