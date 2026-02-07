/*
Purpose:-
	* This script loads data from to the silver layer, by perfroming transformations,
	enrichment, cleaning etc as deemed necessary by the corresponding EDA scripts.

	* Shows the time taken to complete the operation for each table,
	and for the entire layer.

Principal:- This script runs by truncating a table of its existing data, 
and then inserting clean data

Precaution:- Running this script trunctates all existing tables, of the names specified in the
script.

Running Command:- EXEC silver.load_silver
*/

CREATE OR ALTER PROCEDURE silver.load_silver_GS AS
BEGIN
	DECLARE @START_TIME DATETIME, @END_TIME DATETIME, @START_SILVER DATETIME, @END_SILVER DATETIME 
	BEGIN TRY
			SET @START_SILVER = GETDATE()
			PRINT '======================================================================'
			PRINT ' Customers table'
			PRINT '======================================================================'
			SET @START_TIME = GETDATE()
			PRINT '>> Truncating silver.customers'
			TRUNCATE TABLE silver.customers
			PRINT '>> Inserting data silver.customers'
			INSERT INTO silver.customers
			(
				customer_id,
				region,
				cust_join_date
			)
			
			
			SELECT
				customer_id,
				region,
				cust_join_date
			FROM bronze.customers
			SET @END_TIME = GETDATE()
			PRINT 'Time taken to load customers table ' + CAST(DATEDIFF(second, @START_TIME, @END_TIME) AS NVARCHAR) + ' seconds'
			
			
			
			PRINT '======================================================================'
			PRINT ' Products table'
			PRINT '======================================================================'
			SET @START_TIME = GETDATE()
			PRINT '>> Truncating silver.products'
			TRUNCATE TABLE silver.products
			PRINT '>> Inserting data into silver.products'
			INSERT INTO silver.products
			(
				product_id,
				product_name,
				category,
				price,
				base_cost
			)
			
			SELECT
				product_id,
				product_name,
				category,
				CAST(TRIM(price) AS DECIMAL(10,2)) AS price,
				CAST(TRIM(base_cost) AS DECIMAL(10,2)) AS base_cost
			FROM bronze.products
			SET @END_TIME = GETDATE()
			PRINT 'Time taken to load products ' + CAST(DATEDIFF(second, @START_TIME, @END_TIME) AS NVARCHAR) + ' seconds'

			
			PRINT '======================================================================'
			PRINT ' orders_2023'
			PRINT '======================================================================'
			PRINT '>> Truncate table orders_2023'
			TRUNCATE TABLE silver.orders_2023
			PRINT '>> Insert data in table orders_2023'
			INSERT INTO silver.orders_2023
			(
				order_id,
				cust_id,
				product_id,
				ord_date,
				quantity,
				revenue,
				cogs,
				source_file
			)
			SELECT
				order_id,
				cust_id,
				product_id,
				ord_date,
				quantity,
				CAST(TRIM(revenue) AS DECIMAL(10,2)) AS revenue,
				CAST(TRIM(cogs) AS DECIMAL(10,2)) AS cogs,
				source_file
			FROM bronze.orders_2023
			
			PRINT '======================================================================'
			PRINT ' orders_2024'
			PRINT '======================================================================'
			PRINT '>> Truncate table orders_2024'
			TRUNCATE TABLE silver.orders_2024
			PRINT '>> Insert data in table orders_2024'
			INSERT INTO silver.orders_2024
			(
				order_id,
				cust_id,
				product_id,
				ord_date,
				quantity,
				revenue,
				cogs,
				source_file
			)
			SELECT
				order_id,
				cust_id,
				product_id,
				ord_date,
				quantity,
				CAST(TRIM(revenue) AS DECIMAL(10,2)) AS revenue,
				CAST(TRIM(cogs) AS DECIMAL(10,2)) AS cogs,
				source_file
			FROM bronze.orders_2024

			PRINT '======================================================================'
			PRINT ' orders_2025'
			PRINT '======================================================================'
			PRINT '>> Truncate table orders_2025'
			TRUNCATE TABLE silver.orders_2025
			PRINT '>> Insert data in table orders_2025'
			INSERT INTO silver.orders_2025
			(
				order_id,
				cust_id,
				product_id,
				ord_date,
				quantity,
				revenue,
				cogs,
				source_file
			)
			SELECT
				order_id,
				cust_id,
				product_id,
				ord_date,
				quantity,
				CAST(TRIM(revenue) AS DECIMAL(10,2)) AS revenue,
				CAST(TRIM(cogs) AS DECIMAL(10,2)) AS cogs,
				source_file
			FROM bronze.orders_2025
			PRINT '----------------------------------------------------------------------------'
			
	
			SET @END_SILVER = GETDATE()
			PRINT '>> TIME TAKEN TO LOAD SILVER LAYER ' + CAST(DATEDIFF(second, @START_SILVER, @END_SILVER) AS NVARCHAR) + ' seconds'
	END TRY
	BEGIN CATCH
		PRINT 'ERROR OCCURED DURING LOADING SILVER LAYER' 
		PRINT 'ERROR MESSAGE ' + CAST(ERROR_NUMBER() AS NVARCHAR(50))
	END CATCH
END

