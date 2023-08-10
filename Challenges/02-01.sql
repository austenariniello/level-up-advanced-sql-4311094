-- how many cars have been sold per employee

SELECT e.employeeID, e.firstName, e.lastName, COUNT(s.salesID) AS salesCount
FROM employee AS e
LEFT JOIN sales AS s USING(employeeID)
GROUP BY e.employeeID
ORDER BY salesCount DESC;
