-- Retrieve a list of employees with their first and last names and the first and last names of their managers

SELECT 
  e1.firstName AS employeeFirst,
  e1.lastName AS employeeLast,
  e1.title AS employeeTitle,
  e2.firstName AS managerFirst,
  e2.lastName AS managerLast,
  e2.title AS managerTitle
FROM employee AS e1
LEFT JOIN employee AS e2
ON e1.managerID = e2.employeeID; 