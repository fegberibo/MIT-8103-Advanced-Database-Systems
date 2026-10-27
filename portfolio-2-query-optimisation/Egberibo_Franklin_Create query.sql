-- 1. Query to retrieve customer order history and product details
SELECT c.Customer_Name, p.Product_Name, o.Quantity_Ordered, o.Total_Amount, o.Order_Date
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
JOIN Products p ON o.Product_ID = p.Product_ID
WHERE o.Order_Date BETWEEN '2026-09-01' AND '2026-09-30';

-- 2. Create an index to optimise date range filtering on orders
CREATE INDEX idx_order_date ON Orders(Order_Date);

-- 3. Generate execution plan to verify index usage
EXPLAIN SELECT c.Customer_Name, p.Product_Name, o.Quantity_Ordered, o.Total_Amount, o.Order_Date
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
JOIN Products p ON o.Product_ID = p.Product_ID
WHERE o.Order_Date BETWEEN '2026-09-01' AND '2026-09-30';