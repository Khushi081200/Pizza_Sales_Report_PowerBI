SELECT * FROM pizza_sales
SELECT SUM( total_price) AS Total_Revenue FROM pizza_sales
SELECT SUM (total_price) / COUNT(DISTINCT order_id) AS avg_order_value from pizza_sales
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales
SELECT COUNT(DISTINCT order_id) AS Total_Orders from pizza_sales
SELECT CAST(CAST(SUM (quantity) AS DECIMAL(10,2))/
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2))AS DECIMAL(10,2)) AS Avg_pizza_Per_Order From pizza_sales
SELECT DATENAME(DW , order_date) AS order_day, COUNT (DISTINCT order_id) AS Total_orders FROM pizza_sales
GROUP BY DATENAME(DW ,order_date)
 SELECT DATENAME(MONTH , order_date) AS Month_Name , COUNT (DISTINCT order_id) AS Total_orders
 From pizza_sales
 GROUP BY DATENAME(MONTH,order_date)
 ORDER BY Total_orders DESC
SELECT pizza_category ,CAST (SUM (total_price) AS DECIMAL(10,2)) AS Total_Sales ,SUM (total_price)* 100 / 
(SELECT SUM (total_price) FROM pizza_sales WHERE MONTH ( order_date) =1) AS PCT
FROM pizza_sales
WHERE MONTH ( order_date) =1
GROUP BY pizza_category

  SELECT pizza_size ,SUM (total_price) AS Total_Sales ,Cast (SUM (total_price)* 100 / 
  (SELECT SUM (total_price) FROM pizza_sales WHERE DATEPART (Quarter, order_date)=1) AS DECIMAL (10,2))AS PCT
  FROM pizza_sales
  WHERE DATEPART (Quarter, order_date)=1
  GROUP BY pizza_size
  ORDER BY PCT DESC
  SELECT TOP 5 pizza_name, SUM(total_price)AS Total_Revenue FROM pizza_sales
  GROUP BY pizza_name
  ORDER BY Total_Revenue DESC
  SELECT TOP 5 pizza_name, SUM(quantity)AS Total_Quantity FROM pizza_sales
  GROUP BY pizza_name
  ORDER BY Total_Quantity desc
  SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_orders FROM pizza_sales
  GROUP BY pizza_name
  ORDER BY Total_orders desc