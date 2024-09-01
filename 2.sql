SELECT 
    CUSTOMERS.CustomerKey,
    CUSTOMERS.FirstName,
    SUM(SALES.OrderQuantity) as QtdPedidos
FROM AdventureWorks_Sales_2017 AS SALES
INNER JOIN AdventureWorks_Customers AS CUSTOMERS ON SALES.CustomerKey = CUSTOMERS.CustomerKey
GROUP BY CUSTOMERS.CustomerKey, CUSTOMERS.FirstName
ORDER BY QtdPedidos DESC
OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY;
