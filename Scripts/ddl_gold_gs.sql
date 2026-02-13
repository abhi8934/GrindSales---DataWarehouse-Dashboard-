IF OBJECT_ID('gold.vw_all_orders', 'V') IS NOT NULL
	DROP VIEW gold.vw_all_orders
GO

CREATE VIEW gold.vw_all_orders
AS
SELECT
	order_id,
	cust_id,
	product_id,
	ord_date,
	quantity,
	CAST(TRIM(revenue) AS DECIMAL(10, 2)) AS revenue,
	CAST(TRIM(COGS) AS DECIMAL(10, 2)) AS cogs
FROM silver.orders_2023

UNION ALL

SELECT
	order_id,
	cust_id,
	product_id,
	ord_date,
	quantity,
	CAST(TRIM(revenue) AS DECIMAL(10, 2)),
	CAST(TRIM(COGS) AS DECIMAL(10, 2))
FROM silver.orders_2024

UNION ALL
SELECT
	order_id,
	cust_id,
	product_id,
	ord_date,
	quantity,
	CAST(TRIM(revenue) AS DECIMAL(10, 2)),
	CAST(TRIM(COGS) AS DECIMAL(10, 2))
FROM silver.orders_2025
GO



-- This where we are are filtering the view --
IF OBJECT_ID('gold.final_table', 'V') IS NOT NULL
	DROP VIEW gold.final_table
GO

CREATE VIEW gold.final_table
AS 
SELECT * FROM 
(
	SELECT
		a.order_id,
		a.cust_id,
		p.product_id,
		p.product_name,
		p.category,
		p.price,
		p.base_cost,
		a.ord_date,
		DATEADD(WEEK, DATEDIFF(week, 0 ,a.ord_date),0)AS week_date,
		a.quantity,
		c.region,
		c.cust_join_date,
		CASE 
			WHEN a.revenue IS NULL THEN p.price * a.quantity
			ELSE a.revenue
		END AS revenue,
		a.revenue - a.COGS AS profit,
		CAST(a.cogs AS DECIMAL(10, 2)) AS cogs
	FROM gold.vw_all_orders AS a
	LEFT JOIN silver.products AS p
	ON a.product_id = p.product_id
	LEFT JOIN silver.customers AS c
	ON a.cust_id = c.customer_id
)t 
WHERE profit IS NOT NULL
GO

SELECT * FROM gold.final_table