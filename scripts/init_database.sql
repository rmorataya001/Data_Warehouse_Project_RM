/*
============================================
Create database and schemas 
============================================
 Script purpose:
This script creates a new database and names it 'DataWarehouse_RM after checking if it already exists.
If the database exists, it is dropped and recreated. Additionally the script sets up three schemas within the
database, listed as bronze, silver, and gold 

WARNING
	Running this script will drop the entire data warehouse database if it exists.
	 All data in the warehouse will be permanently deleted proceed with cautious
	  And ensure you have proper backups before running this script.
*/

USE master;
GO

--Drop and recreate then 'DataWarehouse_RM'
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse_RM')
BEGIN
	ALTER DATABASE DataWarehouse_RM SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse_RM
END;
GO

--Create the 'DataWarehouse_RM database
CREATE DATABASE DataWarehouse_RM;
GO

USE DataWarehouse_RM;
GO

--Create Schemas
CREATE SCHEMA bronz;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
