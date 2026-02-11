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


### Gold Layer
  - Data type corrections
  - Implements a dimensional model (Star Schema).
  - Fact tables store transactional metrics.
  - Dimension tables provide descriptive attributes.

![image](https://github.com/abhi8934/GrindSales---DataWarehouse-Dashboard-/blob/main/all_orders.png?raw=true)
