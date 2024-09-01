USE Desafio1
GO

WITH Top10Vendas AS (
    SELECT 
        sum(OrderQuantity) as qtd,
        SALES.ProductKey
    FROM AdventureWorks_Sales_2016 AS SALES
    INNER JOIN AdventureWorks_Products AS PRODUTOS ON (PRODUTOS.ProductKey=SALES.ProductKey)
    WHERE PRODUTOS.ProductSubcategoryKey IN (1, 2, 3)
    GROUP BY SALES.ProductKey
    UNION ALL
    SELECT 
        sum(OrderQuantity) as qtd,
        SALES.ProductKey
    FROM AdventureWorks_Sales_2017 AS SALES
    INNER JOIN AdventureWorks_Products AS PRODUTOS ON (PRODUTOS.ProductKey=SALES.ProductKey)
    WHERE PRODUTOS.ProductSubcategoryKey IN (1, 2, 3)
    GROUP BY SALES.ProductKey
)
SELECT 
    sum(qtd) as total_qtd,
    ProductKey
FROM Top10Vendas
GROUP BY ProductKey
ORDER BY total_qtd DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;