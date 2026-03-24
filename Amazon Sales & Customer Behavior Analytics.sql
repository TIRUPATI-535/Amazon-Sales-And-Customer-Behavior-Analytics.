use project;

select * from amazon;

-- Total Orders 
select count(*) from amazon;

-- Total Revenue 
select sum(TotalAmount) as Total_Revenue
from amazon;

-- Category wise Revenue
select Category ,
sum(TotalAmount) as Revenue
from amazon
group by Category
order by Revenue desc;

-- Top 10 product
select ProductName ,
sum(TotalAmount) as Top_product
from amazon
group by ProductName
order by Top_product desc
limit 10;

-- City wise Totalsales
select City, 
sum(Sales) over(partition by City order by Sales) as City_sales
from amazon; 

-- assign Ranking to row
select * , 
rank() over(partition by Category order by TotalAmount desc) as cat_Rank
from amazon; 

-- Top 3 Products 
select ProductName,
sum(TotalAmount) as Top_product
from amazon
group by ProductName
order by Top_product desc
limit 3;

-- Average Revenue
with cte_sales as (
 SELECT
 AVG(TotalAmount) AS avg_Revenue
from amazon
) 
select * from cte_sales;

-- Order Status
SELECT OrderStatus, COUNT(*) Order_status_count
FROM amazon
GROUP BY OrderStatus;

-- Payment Method Analysis 
SELECT PaymentMethod, COUNT(*) AS Orders
FROM amazon
GROUP BY PaymentMethod;