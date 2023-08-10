-- find all sales where the car is an electric car

-- find all electric car models
SELECT modelId, model, EngineType
FROM model
WHERE EngineType = 'Electric';

-- find all electric models in inventory
SELECT inventoryId, modelId
FROM inventory AS inv
WHERE modelId IN (
  SELECT modelId
  FROM model
  WHERE EngineType = 'Electric'
);

-- find all electric car models sold
SELECT inv.modelId, sls.salesId, sls.salesAmount, sls.soldDate
FROM sales AS sls 
INNER JOIN inventory AS inv USING(inventoryId)
WHERE inv.modelId IN (
  SELECT modelId
  FROM model
  WHERE EngineType = 'Electric'
)
ORDER BY inv.modelId, sls.soldDate;