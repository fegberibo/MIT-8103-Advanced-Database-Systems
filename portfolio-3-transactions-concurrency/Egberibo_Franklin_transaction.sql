-- Simulate a customer checkout process ensuring ACID compliance
BEGIN TRANSACTION;

-- Step 1: Insert the new order record
INSERT INTO Orders (Order_ID, Customer_ID, Product_ID, Order_Date, Quantity_Ordered, Total_Amount)
VALUES (501, 1, 102, '2026-10-01', 2, 150.00);

-- Step 2: Update the product stock quantity
UPDATE Products
SET Stock_Quantity = Stock_Quantity - 2
WHERE Product_ID = 102;

-- If stock is sufficient and statements succeed, commit the transaction
COMMIT;

-- If an error occurs (e.g., insufficient stock), rollback to maintain data integrity
-- ROLLBACK;