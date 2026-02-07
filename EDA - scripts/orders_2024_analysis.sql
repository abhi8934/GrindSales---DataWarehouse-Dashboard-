-- Analyzing orders_2024
SELECT * FROM bronze.orders_2024

-- Checking for NULL order_ID 
SELECT order_id
FROM bronze.orders_2024
WHERE order_id is NULL -- ALL CLEAR

-- Checking for NULL product_ids
SELECT * FROM bronze.orders_2024 
WHERE ord_date > '2023-12-31'  and ord_date < '2022-12-31' -- ALL clear

-- Checking quantity
SELECT * FROM bronze.orders_2024 
WHERE quantity IS NULL or quantity < 0
-- Since no business logic is given we leave NULLs in cogs and revenue column