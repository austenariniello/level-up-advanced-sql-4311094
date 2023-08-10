-- get a list of sales people and rank the car models they've sold the most of

SELECT 
  emp.employeeId, 
  emp.firstName, 
  emp.lastName,
  mod.model,
  COUNT(sls.salesId) AS modelsSold,
  RANK() OVER (PARTITION BY sls.employeeId
               ORDER BY COUNT(sls.salesId) DESC) AS modelRank
FROM employee AS emp
LEFT JOIN sales AS sls USING(employeeId)
INNER JOIN inventory AS inv USING(inventoryId)
INNER JOIN model AS mod USING(modelId)
WHERE emp.title = 'Sales Person'
GROUP BY emp.employeeId, mod.model
ORDER BY emp.employeeId, modelsSold DESC;

