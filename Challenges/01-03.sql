-- Get a list of all sales and all customer data, even if some data is NULL

SELECT c.customerID, c.firstName, c.lastName, s.salesID
FROM customer AS c
FULL JOIN sales AS s USING(customerID)
ORDER BY customerID;

SELECT c.customerID, c.firstName, c.lastName, s.salesID
FROM customer AS c
INNER JOIN sales AS s USING(customerID)
UNION 
SELECT c.customerID, c.firstName, c.lastName, s.salesID
FROM customer AS c
LEFT JOIN sales AS s USING(customerID)
WHERE s.salesID IS NULL
UNION
SELECT c.customerID, c.firstName, c.lastName, s.salesID
FROM customer AS c
RIGHT JOIN sales AS s USING(customerID)
WHERE c.customerID IS NULL
ORDER BY c.customerID;