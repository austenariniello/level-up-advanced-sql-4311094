-- Get a list of salespeople with 0 sales

SELECT 
  e.employeeID, 
  e.firstName, 
  e.lastName,
  COUNT(s.salesID) AS salesCount
FROM employee AS e
LEFT JOIN sales AS s USING(employeeID)
WHERE e.title = 'Sales Person'
GROUP BY e.employeeID
HAVING COUNT(s.salesID) = 0;