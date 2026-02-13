# GrindSales (DataWarehouse + Dashboard)
This repo houses the my attempt on the GrindSales dashboard project as shown by Absent Data:- https://youtu.be/Yhx_2HT-TU0?si=f7fgsMjklNbLzfiY and a DataWarehouse Layer of my addition using SQL in SSMS.

## Description
The warehouse layer is based on medallion architecture (bronze -> silver -> gold), data is taken from the users system and processed as specified
in the data flow diagrams diagrams after the general.
![image](https://github.com/abhi8934/GrindSales---DataWarehouse-Dashboard-/blob/main/Data_flow.drawio.png?raw=true)

## DataWareHouse
### Bronze Layer - 
  - Data is ingested as-is to preserve source faithfulness.
  - No business logic is applied at this stage.
  - Tables are structured to mirror source schemas.
  - Designed for traceability and reprocessing.

### Silver Layer
  - Removal of duplicates
  - Handling missing values
  - Standardizing date and numeric formats
  - Data type corrections
### EDR of the all_orders table
![image](https://github.com/abhi8934/GrindSales---DataWarehouse-Dashboard-/blob/main/all_orders.png?raw=true)

### Gold Layer
  - Implements a dimensional model (Star Schema).
  - Fact tables store transactional metrics.
  - Dimension tables provide descriptive attributes.
### Star Schema
![image](https://github.com/abhi8934/GrindSales---DataWarehouse-Dashboard-/blob/main/star_schema.drawio.png?raw=true)

## How to run?
  - Download the source files and save them in the given path *"C:\GrindGS\sources"*.
  - Run [createGrindSales.sql](https://github.com/abhi8934/GrindSales---DataWarehouse-Dashboard-/blob/main/Scripts/createGrindSales.sql) script, to create the schemas and database grind sales.
  - Run [ddl_bronze_GS.sql](https://github.com/abhi8934/GrindSales---DataWarehouse-Dashboard-/blob/main/Scripts/ddl_bronze_GS.sql), to create the tables in the bronze layer.
  - Download and execute [proc_load_bronze_GS](https://github.com/abhi8934/GrindSales---DataWarehouse-Dashboard-/blob/main/Scripts/proc_load_bronze_GS.sql).
  - Run *EXEC proc_load_bronze_GS* to feed data into the bronze layer.
  - Run [ddl_silver_GS.sql](https://github.com/abhi8934/GrindSales---DataWarehouse-Dashboard-/blob/main/Scripts/proc_load_bronze_GS.sql), to create the tables in the silver layer.
  - Download and execute [proc_load_silver_GS](https://github.com/abhi8934/GrindSales---DataWarehouse-Dashboard-/blob/main/Scripts/proc_load_silver_GS.sql).
  - Run *EXEC proc_load_silver_GS* to feed, cleansed data into the silver layer.
  - Run [ddl_gold script](https://github.com/abhi8934/GrindSales---DataWarehouse-Dashboard-/blob/main/Scripts/ddl_gold_gs.sql) to create business ready views.
## Dashboard:-
### **Page-1 Showing all the KPIs**
![image](https://github.com/abhi8934/GrindSales---DataWarehouse-Dashboard-/blob/main/dashboard_pg_1.png)
### **Page-2 Showing tables**
![image](https://github.com/abhi8934/GrindSales---DataWarehouse-Dashboard-/blob/main/dashboard_pg_2.png)
