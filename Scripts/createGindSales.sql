/*
=================================================================
Create Database and Schemas
=================================================================

Script Purpose:
    This script creates a new database named 'GrindSales' after checking if it already exists.
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
    within the database: 'bronze', 'silver', and 'gold'.

WARNING:
    Running this script will drop the entire 'GrindSales' database if it exists.
    All data in the database will be permanently deleted. Proceed with caution
    and ensure you have proper backups before running this script.
*/
--Use master
USE master
Go

--Checking if the database exists 
IF EXISTS (SELECT 1 FROM sys.databases WHERE NAME = 'GrindSales')
BEGIN
	ALTER DATABASE GrindSales
	SET SINGLE_USER WITH ROLLBACK IMMEDIATE
	DROP DATABASE GrindSales
END
GO

--Creating the database
CREATE DATABASE GrindSales
GO

--Using Database GrindSales
USE GrindSales
Go

--Creating schema
--Gold 
CREATE SCHEMA gold
GO

--Silver
CREATE SCHEMA silver
GO
--Bronze 
CREATE SCHEMA bronze
GO