CREATE TABLE Sales_Data (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR(10),
    Category VARCHAR(20),
    OrderDate DATE,
    OrderValue INT
);
INSERT INTO Sales_Data (OrderID, CustomerID, Category, OrderDate, OrderValue) VALUES
(1001, 'C201', 'Electronics', '2024-01-05', 12500),
(1002, 'C203', 'Apparel', '2024-01-07', 3200),
(1003, 'C205', 'Home', '2024-01-10', 5800),
(1004, 'C201', 'Electronics', '2024-01-15', 8900),
(1005, 'C207', 'Apparel', '2024-01-18', 2100),
(1006, 'C210', 'Home', '2024-01-22', 4700),
(1007, 'C203', 'Electronics', '2024-02-01', 15300),
(1008, 'C212', 'Apparel', '2024-02-05', 1800),
(1009, 'C205', 'Home', '2024-02-08', 6200),
(1010, 'C214', 'Electronics', '2024-02-12', 9400),
(1011, 'C207', 'Apparel', '2024-02-17', 2900),
(1012, 'C210', 'Electronics', '2024-02-20', 11000),
(1013, 'C212', 'Home', '2024-03-01', 3500),
(1014, 'C201', 'Apparel', '2024-03-05', 4100),
(1015, 'C214', 'Home', '2024-03-10', 7800);

SELECT * FROM Sales_Data;

select  category ,sum(ordervalue) as total_revenue from sales_data group by category;

select category, count(OrderID) as total_order from sales_data group by category order by total_order;

select category,max(OrderValue) as max_ordervalue from sales_data group by category;

select distinct category from sales_data;

select distinct customerID from sales_data;



select distinct customerID  as uniq_customerID ,category as uniq_cartegory from sales_data;

-- LEVEL 3 — MEDIUM GROUP BY with Multiple Columns

select customerID,category ,sum(ordervalue) as total_revenue from sales_data 
group by category,customerID;


select customerID,category, count(customerID) as order_count from sales_data group by customerID,category;

SELECT category,MONTH(OrderDate) AS order_month,SUM(ordervalue) AS total_revenue 
FROM sales_data GROUP BY category, MONTH(OrderDate);


-- Level 4 — Expected Output
-- Q1. Categories with Revenue > $20,000

select category,sum(ordervalue) as total_revenue from sales_data
group by category having sum(ordervalue)>20000;


-- Q2. Customers with More Than 1 Order

select customerID,count(orderID) as order_count from sales_data group by customerID;


-- Q3. Customer + Category Combinations Spending > $10,000

SELECT * FROM Sales_Data;
select customerID,category,sum(ordervalue) as total_spent 
from sales_data group by customerID,category having sum(ordervalue)>10000;

-- Level 5 — Expected Output
-- Q1. Category Summary (Avg Order Value > $5,000, sorted by Revenue)

select category,count(orderID) as total_orders ,sum(ordervalue) as total_revenue ,
avg(ordervalue) as avg_ordervalue from sales_data
 group by category having avg_ordervalue>5000;
 
 
 -- Q2. High-Value Repeat Customers (>1 order, Avg OrderValue > $6,000)
 
select customerID,count(ordervalue) as order_count,avg(ordervalue) as avg_ordervalue
from sales_data group by customerID having COUNT(orderID) > 1 AND AVG(ordervalue) > 6000;


SELECT category, MONTH(OrderDate) AS order_month,COUNT(orderID) AS orders, 
SUM(ordervalue) AS total_revenue, ROUND(AVG(ordervalue), 2) AS avg_ordervalue 
FROM sales_data
GROUP BY category, MONTH(OrderDate) HAVING COUNT(orderID) >= 2;




 
 












