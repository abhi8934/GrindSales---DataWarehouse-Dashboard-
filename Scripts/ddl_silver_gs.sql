CREATE OR ALTER PROCEDURE silver.ddl_silver_GS AS 
BEGIN
	BEGIN TRY
		-- Checking if the table customer_data exists or not.
		IF OBJECT_ID('silver.customers', 'U') IS NOT NULL
			DROP TABLE silver.customers;

		--  Creating the customer_data
		CREATE TABLE silver.customers
		(
			customer_id NVARCHAR(100),
			region NVARCHAR(50),
			cust_join_date DATE,
			dwh_create_date DATETIME2 DEFAULT GETDATE()

		)

		-- Checking if the table products_data exists or not.
		IF OBJECT_ID('silver.products', 'U') IS NOT NULL
			DROP TABLE silver.products


		-- Creating the table product_data
		CREATE TABLE silver.products
		(
			product_id INT,
			product_name NVARCHAR(100),
			category NVARCHAR(50),
			price DECIMAL(10, 2),
			base_cost DECIMAL(10, 2),
			dwh_create_date DATETIME2 DEFAULT GETDATE()
		)

		IF OBJECT_ID('silver.orders_2023','U') IS NOT NULL
			DROP TABLE silver.orders_2023
		CREATE TABLE silver.orders_2023
		(
			order_id NVARCHAR(50),
			cust_id NVARCHAR(50),
			product_id INT,
			ord_date DATE,
			quantity INT,
			revenue NVARCHAR(50),
			cogs NVARCHAR(50),
			source_file NVARCHAR(50),
			dwh_create_date DATETIME2 DEFAULT GETDATE()
		)

		IF OBJECT_ID('silver.orders_2024','U') IS NOT NULL
			DROP TABLE silver.orders_2024
		CREATE TABLE silver.orders_2024
		(
			order_id NVARCHAR(50),
			cust_id NVARCHAR(50),
			product_id INT,
			ord_date DATE,
			quantity INT,
			revenue NVARCHAR(50),
			cogs NVARCHAR(50),
			source_file NVARCHAR(50),
			dwh_create_date DATETIME2 DEFAULT GETDATE()
		)

		IF OBJECT_ID('silver.orders_2025','U') IS NOT NULL
			DROP TABLE silver.orders_2025
		CREATE TABLE silver.orders_2025
		(
			order_id NVARCHAR(50),
			cust_id NVARCHAR(50),
			product_id INT,
			ord_date DATE,
			quantity INT,
			revenue NVARCHAR(50),
			cogs NVARCHAR(50),
			source_file NVARCHAR(50),
			dwh_create_date DATETIME2 DEFAULT GETDATE()
		)
	END TRY
	BEGIN CATCH
		PRINT 'ERROR OCCURED DURING LOADING SILVER LAYER' 
		PRINT 'ERROR MESSAGE' + CAST(ERROR_NUMBER() AS NVARCHAR(50))
	END CATCH
END