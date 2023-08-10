-- report of employees that have made more than 5 sales this year
SELECT e.employeeId, e.firstName, e.lastName
FROM employee AS e 
INNER JOIN sales AS s USING(employeeId)
WHERE s.soldDate >= DATE('now', 'start of year')
GROUP BY e.employeeId
HAVING COUNT(s.salesId) > 5;