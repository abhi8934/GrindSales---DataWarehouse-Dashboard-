CREATE OR ALTER PROCEDURE bronze.ddl_bronze_GS AS 
BEGIN
	BEGIN TRY
		-- Checking if the table customer_data exists or not.
		IF OBJECT_ID('bronze.customers', 'U') IS NOT NULL
			DROP TABLE bronze.customers;

		--  Creating the customer_data
		CREATE TABLE bronze.customers
		(
			customer_id NVARCHAR(100),
			region NVARCHAR(50),
			cust_join_date DATE,
		)

		-- Checking if the table products_data exists or not.
		IF OBJECT_ID('bronze.products', 'U') IS NOT NULL
			DROP TABLE bronze.products


		-- Creating the table product_data
		CREATE TABLE bronze.products
		(
			product_id INT,
			product_name NVARCHAR(100),
			category NVARCHAR(50),
			price NVARCHAR(50),
			base_cost NVARCHAR(50)
		)

		IF OBJECT_ID('bronze.orders_2023','U') IS NOT NULL
			DROP TABLE bronze.orders_2023
		CREATE TABLE bronze.orders_2023
		(
			order_id NVARCHAR(50),
			cust_id NVARCHAR(50),
			product_id INT,
			ord_date DATE,
			quantity INT,
			revenue NVARCHAR(50),
			cogs NVARCHAR(50),
			source_file NVARCHAR(50)
		)

		IF OBJECT_ID('bronze.orders_2024','U') IS NOT NULL
			DROP TABLE bronze.orders_2024
		CREATE TABLE bronze.orders_2024
		(
			order_id NVARCHAR(50),
			cust_id NVARCHAR(50),
			product_id INT,
			ord_date DATE,
			quantity INT,
			revenue NVARCHAR(50),
			cogs NVARCHAR(50),
			source_file NVARCHAR(50)
		)

		IF OBJECT_ID('bronze.orders_2025','U') IS NOT NULL
			DROP TABLE bronze.orders_2025
		CREATE TABLE bronze.orders_2025
		(
			order_id NVARCHAR(50),
			cust_id NVARCHAR(50),
			product_id INT,
			ord_date DATE,
			quantity INT,
			revenue NVARCHAR(50),
			cogs NVARCHAR(50),
			source_file NVARCHAR(50)
		)
	END TRY
	BEGIN CATCH
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER' 
		PRINT 'ERROR MESSAGE' + CAST(ERROR_NUMBER() AS NVARCHAR(50))
	END CATCH
END