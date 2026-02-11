/*
Purpose:- 
	This script creates to the bronze layer following are its functions:-
	* Inserts data in the corresponding tables created by ddl_bronze.
	* Shows the time taken to complete the operation for each table,
	and for the entire layer.

Principal:- This script runs by truncating a table, and then inserting clean data

Precaution:- Running this script trunctates all existing tables, of the names specified in the
script.

Running Command:- EXEC bronze.load_bronze
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze_GS AS
BEGIN		
	BEGIN TRY
		DECLARE @start_time DATETIME, @end_time DATETIME , @start_bronze DATETIME , @end_bronze DATETIME 
		SET @start_bronze = GETDATE()
		PRINT '==============================================='
		PRINT 'Customer Table'
		PRINT '==============================================='

		SET @start_time = GETDATE()
		PRINT 'TRUNCATING TABLE bronze.customers'
		TRUNCATE TABLE bronze.customers
		PRINT 'INSERTING DATA IN TABLE bronze.customers'
		BULK INSERT bronze.customers
		FROM 'C:\GrindGS\sources\customers.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		)
		SET @end_time = GETDATE()
		PRINT 'Time take to load customers ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR)


		PRINT '==============================================='
		PRINT 'Product Table'
		PRINT '==============================================='
		SET @start_time = GETDATE()
		PRINT 'TRUNCATING TABLE bronze.products'
		TRUNCATE TABLE bronze.products
		PRINT 'INSTERING DATA IN TABLE bronze.products'
		BULK INSERT bronze.products
		FROM 'C:\GrindGS\sources\products.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		)
		SET @end_time = GETDATE()
		PRINT 'TIME TAKEN TO LOAD products table is ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR)

		PRINT '==============================================='
		PRINT 'Order Tables'
		PRINT '==============================================='
		PRINT '2023'
		SET @start_time = GETDATE()
		PRINT 'TRUNCATING TABLE orders_2023'
		TRUNCATE TABLE bronze.orders_2023 
		BULK INSERT bronze.orders_2023
		FROM 'C:\GrindGS\sources\Orders_2023.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		)
		SET @end_time = GETDATE()
		PRINT 'Time taken to load orders_2023 ' + CAST(DATEDIFF(second, @start_time, @end_time)AS NVARCHAR) + ' seconds'


		PRINT '2024'
		SET @start_time = GETDATE()
		PRINT 'TRUNCATING TABLE orders_2024'
		TRUNCATE TABLE bronze.orders_2024 
		BULK INSERT bronze.orders_2024
		FROM 'C:\GrindGS\sources\Orders_2024.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		)
		SET @end_time = GETDATE()
		PRINT 'Time taken to load orders_2024 ' + CAST(DATEDIFF(second, @start_time, @end_time)AS NVARCHAR) + ' seconds'

		PRINT '2025'
		SET @start_time = GETDATE()
		PRINT 'TRUNCATING TABLE orders_2025'
		TRUNCATE TABLE bronze.orders_2025 
		BULK INSERT bronze.orders_2025
		FROM 'C:\GrindGS\sources\Orders_2025.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		)
		SET @end_time = GETDATE()
		PRINT 'Time taken to load orders_2025 ' + CAST(DATEDIFF(second, @start_time, @end_time)AS NVARCHAR) + ' seconds'

		SET @end_bronze = GETDATE()
		PRINT 'TIME TAKE TO LOAD BRONZE LAYER ' + CAST(DATEDIFF(second, @start_bronze, @end_bronze) AS NVARCHAR) + ' seconds'
	END TRY
	
	BEGIN CATCH
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER' 
		PRINT 'ERROR MESSAGE' + CAST(ERROR_NUMBER() AS NVARCHAR(50))
	END CATCH
END 
