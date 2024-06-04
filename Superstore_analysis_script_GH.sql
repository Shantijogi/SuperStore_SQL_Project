-- just to check the data impoerted well
select * from superstore_data
limit 5;


-- Totale sales
select sum(sales) as total_sales
from superstore_data;


-- Total profit
select sum(profit) as total_profit
from superstore_data;


-- total cost
select sum(cost) as total_cost
from superstore_data;


-- Total unique customers Overall
select count(distinct customerID) as Total_customers from superstore_data;


-- total unique products
select count(distinct productname) as Total_products from superstore_data;


-- profit margin
select round((sum(profit)/sum(sales)*100),2) as Profit_Margin
from superstore_data;


-- state wise profit margin
select state, round((sum(profit)/sum(sales)*100),2) as Profit_Margin
from superstore_data
group by state
order by profit_margin desc;


-- total sale and profit for each year
select year(orderdate) as year, round(sum(profit),0) Total_Profit, round(sum(Sales),0) as Total_Sale
from superstore_data
group by year(OrderDate)
order by year asc;


-- Quater wise sales and profit
select year(orderdate) as year, concat("Q",quarter(OrderDate)) as Quarter, 
	ROUND(sum(Profit),0) as Total_Profit,
	round(sum(Sales),0) as Total_Sale
from superstore_data
group by year(orderdate),concat("Q",quarter(OrderDate))
order by year asc;


-- What region generates the highest sales and profits ?
select region, sum(sales) as Total_Sale, sum(profit) as Total_Profit
from superstore_data
group by region
order by Total_sale Desc;


-- profit margin by region
select region, round((sum(profit)/sum(sales)*100),2) as Profit_Margin
from superstore_data
group by region
order by Profit_margin desc;


-- Top 10 state  wise
select state, sum(profit) as Total_Profit
from superstore_data
group by state
order by Total_profit desc limit 10;


-- 6. Bottom 10 state  wise
select state, sum(profit) as Total_Profit
from superstore_data
group by state
order by Total_profit limit 10;


-- Top 10 city wise
select city, sum(profit) as Total_Profit
from superstore_data
group by city
order by Total_profit desc limit 10;


-- bottom 10 cities
select city, sum(profit) as Total_Profit
from superstore_data
group by city
order by Total_profit limit 10;


-- correlation between sales and Discount  (not a correlation coefficient)
select Discount, Avg(Sales) As Avg_Sales
from superstore_data
group by Discount
order by Discount;


--  Total Discount BY Category
select category, sum(discount) as Total_discount from superstore_data
group by category
order by total_discount desc;


--  Category and Sybcategory wise Total Discount
select category, subcategory, sum(discount) as Total_discount
from superstore_data
group by category, subcategory
order by total_discount desc;


-- which category generates highest sale and profit by each region
select category, region, sum(sales) as Total_sales, sum(profit) as Total_profit
from superstore_data
group by region, category
order by total_sales desc;


-- which category generates highest sale and profit by each state
select category, state, sum(profit) as total_profit, sum(sales) as total_sales
from superstore_data
group by category,state
order by total_profit Desc;


--  lowest sale and profit by category and state
select category, state, sum(sales) as total_sales, sum(profit) as total_profit
from superstore_data
group by category,state
order by total_sales;


-- subcategory generates highest sale and profit
select subcategory, sum(sales) as total_sales, sum(profit) as total_profits
from superstore_data
group by subcategory
order by total_sales desc;


-- subcategory generates highest sale and profit by state
select subcategory, state, sum(profit)as total_profit, sum(sales) as total_sales
from superstore_data
group by state, subcategory
order by total_profit desc;


-- subcategory generates lowest sale and profit by state
select subcategory,state, sum(profit) as total_profit, sum(sales) as total_sales
from superstore_data
group by state, subcategory
order by total_profit;


-- Total cost
select sum(cost) as Total_cost from superstore_data;


-- calculate region and state wise cost, sales, profit
select region, state, sum(cost) as Total_cost,
	sum(sales) as total_sales,
    sum(profit) as total_profit
from superstore_data
group by region, state
order by total_cost desc;


-- calculate category of cost by state wise
select category, state, sum(cost) as Total_cost
from superstore_data
group by state, category
order by total_cost desc;


-- subcategory generates highest sale and profit by Region
select subcategory, region, sum(profit) as Total_profit, sum(sales) as Total_sale
from superstore_data
group by subcategory, region
order by total_profit desc;


-- subcategory generates lowest sales and profit by region
select subcategory, region, sum(profit) as Total_profit, sum(sales) as Total_sale
from superstore_data
group by subcategory, region
order by total_profit;


-- most profitable products
select productname, sum(profit) as total_profit
from superstore_data
group by productname
order by total_profit desc
limit 10;


-- less profitable products
select productname, sum(profit) as total_profit
from superstore_data
group by productname
order by total_profit;


-- segment wise profit and sale
select segment, sum(profit) as total_profit, sum(sales) as total_sale
from superstore_data
group by segment
order by total_sale desc;


-- segment wise cost
select segment, sum(cost) as total_cost
from superstore_data
group by segment
order by total_cost desc;


-- unique customer per region 
select region, count(distinct customerid) as Unique_customers
from superstore_data
group by region
order by unique_customers desc;


-- unique cust per state
select state, count(distinct customerid) as Unique_customers
from superstore_data
group by state
order by unique_customers desc;


-- least customer in each state
select state, count(distinct customerid) as Unique_customers
from superstore_data
group by state
order by unique_customers;

-- to give customer reward who give us most of the sale 
-- Customer ID wise Sale and Profit
select customerid, sum(sales) as Total_Sales, sum(profit) as Total_profit
from superstore_data
group by customerid
order by total_sales desc
limit 10;


-- above query which seems odd for top sale of a customer
-- so i checked to see the customer sale,profit, cost 
select customerid, sum(sales) as sale, sum(profit) as profit, sum(cost) as cost
from superstore_data
where customerid = 'SM-20320'
group by customerid;
# company incurred cost more than sale it might be delivery charges, taxes etc 


-- avg shipping time
select ShipMode ,round(avg(ShipDate - OrderDate),2) as Avg_Shipping_time
from superstore_data
group by ShipMode
Order by Avg_Shipping_time;

-- sales by shipmode
select shipmode, sum(sales) as total_sales
from superstore_data
group by shipmode
order by total_sales desc;