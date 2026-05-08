CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_name VARCHAR(50) NOT NULL,
city VARCHAR(30) NOT NULL,
category VARCHAR(30) NOT NULL,
product VARCHAR(50) NOT NULL,
quantity INT NOT NULL,
price DECIMAL(10,2) NOT NULL,
order_date DATE NOT NULL
);

INSERT INTO orders VALUES
(1001, 'Rahul Sharma', 'Mumbai', 'Electronics', 'Laptop', 1,
55000, '2024-01-05'),
(1002, 'Priya Patel', 'Delhi', 'Clothing', 'Kurta', 3,
1500, '2024-01-07'),
(1003, 'Amit Singh', 'Bangalore', 'Electronics', 'Smartphone', 2,
18000, '2024-01-10'),
(1004, 'Sunita Rao', 'Chennai', 'Furniture', 'Chair', 4,
3200, '2024-01-12'),
(1005, 'Vikram Joshi', 'Mumbai', 'Electronics', 'Tablet', 1,
22000, '2024-01-15'),
(1006, 'Neha Gupta', 'Delhi', 'Clothing', 'Saree', 2,
4500, '2024-01-18'),
(1007, 'Kiran Kumar', 'Bangalore', 'Furniture', 'Table', 1,
8500, '2024-01-20'),
(1008, 'Deepak Verma', 'Chennai', 'Electronics', 'Headphones', 5,
2500, '2024-02-02'),
(1009, 'Anjali Mehta', 'Mumbai', 'Clothing', 'Jacket', 2,
3800, '2024-02-05'),
(1010, 'Ravi Nair', 'Bangalore', 'Electronics', 'Monitor', 1,
15000, '2024-02-08'),
(1011, 'Pooja Iyer', 'Chennai', 'Furniture', 'Sofa', 1,
25000, '2024-02-12'),
(1012, 'Suresh Patil', 'Delhi', 'Electronics', 'Keyboard', 3,
1800, '2024-02-15'),
(1013, 'Meena Desai', 'Mumbai', 'Furniture', 'Bookshelf', 2,
6000, '2024-02-18'),
(1014, 'Arun Reddy', 'Bangalore', 'Clothing', 'Jeans', 3,
2200, '2024-02-22'),
(1015, 'Lalita Shah', 'Delhi', 'Electronics', 'Smartwatch', 2,
9500, '2024-02-25');

select * from orders;

-- Q1. How many orders were placed in each city? (Sort by city A–Z) [Easy]

select city ,count(category)  as total_orders from orders group by city;

-- Q2. What is the total revenue (price × quantity) earned from each category? (Sort by
-- total_revenue DESC) [Easy]

select category, sum(price* quantity) as total_revenue 
from orders group by category order by total_revenue desc;

-- Q3. How many orders belong to each category? (Sort by category A–Z) [Easy]

select * from orders;
select category, count(product) as total_orders from orders group by category;

-- Q4. What is the average price of orders in each city? Round to 2 decimal places. (Sort by
-- city A–Z) [Easy]

select city, round(avg(price),2) as avg_price from orders group by city order by city ;

-- Q5. What is the maximum price of a product in each category? (Sort by category A–Z)



select category,max(price) as max_price from orders group by category ;

-- Q6. What is the minimum price of a product ordered in each city? (Sort by city A–Z) [Easy]

select city,min(price) as min_price from orders group by city;

-- Q7. What is the total quantity of items sold per category? (Sort by total_quantity DESC)

select category,sum(quantity )  as total_qty from orders group by category  order by total_qty desc; 

-- Q8. List each city along with the total number of items ordered (sum of quantity). (Sort by
-- total_items DESC) [Easy]

select city , sum(quantity) as total_items from orders group by city order by total_items desc;

-- Q9. Find cities that have more than 3 orders. Show city and order count. (Sort by
-- order_count DESC) [Intermediate]

select city ,count(city) from orders group by city having count(city)>3; 

-- Q10. Find categories where the total revenue (price × quantity) is more than 50000. (Sort by
-- total_revenue DESC) [Intermediate]

select category ,sum(price*quantity) as order_count from orders 
group by category  having sum(price*quantity)>50000 order by order_count desc ;



-- Q11. Which cities have an average order price greater than 10000? Show city and
-- avg_price. (Sort by avg_price DESC) [Intermediate]

select city, avg(price) as avg_price from orders 
group by city having avg(price)>10000 order by avg_price desc;


-- Q12. Find the total revenue per city, but only include orders from the 'Electronics' category.
--  (Sort by total_revenue DESC) [Intermediate]

select city , sum(price*quantity ) as total_revenue from orders  where category='electronics'
group by city order by total_revenue desc ;


-- Q13. Find categories where the total quantity sold is greater than 8. (Sort by total_qty
-- DESC) [Intermediate]

select category, sum(quantity) as total_qty from orders 
group by category having sum(quantity)>8  order by total_qty desc;

-- Q14. Find the number of distinct cities from which each category received orders. (Sort by
-- category A–Z) [Intermediate]

select category,count( distinct city) from orders group by category order by category;

-- Q15. List cities where the minimum order price is less than 2000. Show city and min_price.
-- (Sort by min_price ASC) [Intermediate]

select city,min(price) from orders group by city having min(price)<2000;

-- Q16. Find each city's total revenue (price × quantity). Show only cities where total revenue
-- is between 30000 and 100000. (Sort by total_revenue DESC) [Intermediate]


 select city,sum(price*quantity) as total_revenue from orders 
 group by city  having total_revenue between 30000 and 100000 order by total_revenue desc;
 
 
-- Q17. For each combination of city and category, find the total revenue. Show only
-- combinations where total revenue > 20000. (Sort by total_revenue DESC) [Hard]

select  city,category,sum(price*quantity) as total_revenue  from orders
group by city,category having total_revenue >20000  order by total_revenue desc;


-- --------------------------------------------------------------------------------------------------
select * from employees;

-- if(condition,true statment,false statment)

select  first_name,department,salary ,if(department='IT',salary*1.1,salary*1.05) from employees;

select  first_name,department,salary ,if(department='IT',salary*1.1,if(department='HR',salary*1.05,salary)) from employees;


-- select col1,col2
-- case
-- when condition then statment
-- end
-- from table_name

select first_name,department,salary,
case
when department='IT'  or department='HR' then 'A Category'
else'B category'
end
from employees;
-- ----------------------------------------------------------
select first_name,department,salary,
case
when department='IT'then salary*1.1
when department='HR' then salary*1.05
else salary
end as 'newsalary'
from employees;

select* from employees;


select first_name,hire_date ,job_title ,year(hire_date),
case
when year(hire_date)<2020 then concat('cinier',job_title) 
else  job_title
end 
from employees;

-- if the hiring date of in employuees before year 2020 =job title print  krna hai senior citizen me 
-- or 2021 hai to associavity print krna hai other wise wesa ka wesa aayega 
 
 
 -- if the salary is > 70000 crete a category  the name as avg(salary) if the salary is 85000 jyda hai to highg
 -- 100000 strem high salary other wise print category nam as low salary 

select first_name,category,salary,
case
when salary>75000  then 'avg salary'
when salary>85000 then 'high salary'
when salary >10000 then 'stream salary' 
else category
end
from employees; 
select * from employees;

-- select the job title and print the column value base on the col condition 
-- jobtitle=1 se jyada hue  to hr manager more the 2 persons ye print hoga 
select job_title,count(job_title),
case
when count(job_title)=1 then concat(job_title,'position have',count(job_title),'person')
when count(job_title)>1 then concat(job_title,'position have',count(job_title),'person')
end 
from employees group by job_title;

-- job title me ek log hai to single manna hai 


-- SQL normalization:-- ONE TABLE ME NA HOKE DATA MULTIPLE TABLE ME STORE KRTE HAI
-- JOINS KA KAM HAI MULTIPLE TABLES ME SE RESULT NIKALNA 

create database regexjoin;

use regexjoin;

-- Create first table: customers
create database regexjoin;

use regexjoin;

-- Create first table: customers
CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);
-- Insert records into customers
INSERT INTO customers VALUES
(1, 'Amit', 'Delhi'),
(2, 'Priya', 'Mumbai'),
(3, 'Rahul', 'Pune'),
(4, 'Sneha', 'Jaipur'),
(5, 'Karan', 'Chennai');
-- Create second table: orders
use sakila;
CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    product_name VARCHAR(50)
);

-- Insert records into orders
-- Duplicate customer_id is present because some customers ordered multiple products
INSERT INTO orders VALUES
(101, 1, 'Laptop'),
(102, 2, 'Mobile'),
(103, 1, 'Keyboard'),
(104, 3, 'Mouse'),
(105, 2, 'Headphones');
 drop table customers;
select * from customers;
select* from orders;

select customers.customer_id,customers.customer_name,orders.product_name from customers 
join orders where customers.customer_id=orders.customer_id;


create database regexjoin;

use regexjoin;

CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);
INSERT INTO customers VALUES
(1, 'Amit', 'Delhi'),
(2, 'Priya', 'Mumbai'),
(3, 'Rahul', 'Pune'),
(4, 'Sneha', 'Jaipur'),
(5, 'Karan', 'Chennai');

-- --------------------------------- Create second table: orders
CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    product_name VARCHAR(50)
);

-- Insert records into orders
-- Duplicate customer_id is present because some customers ordered multiple products
INSERT INTO orders VALUES
(101, 1, 'Laptop'),
(102, 2, 'Mobile'),
(103, 1, 'Keyboard'),
(104, 3, 'Mouse'),
(105, 2, 'Headphones');

select * from customers;
select * from orders;
INSERT INTO orders VALUES
(106, 11, 'ice cream');

select customers.customer_id,customers.customer_name ,orders.customer_id,product_name  from customers
join orders where customers.customer_id=orders.customer_id;


-- ON KA USE 


select customers.customer_id,customer_name,orders.customer_id,product_name from customers
left join orders on customers.customer_id=orders.customer_id;

select customers.customer_id,customer_name,orders.customer_id,product_name from customers
left join orders on customers.customer_id=orders.customer_id;

select customers.customer_id,customer_name,orders.customer_id,product_name from customers
left join orders on customers.customer_id=orders.customer_id where product_name is null;

select customers.customer_id,customer_name,orders.customer_id,product_name from customers
left join orders on customers.customer_id=orders.customer_id where product_name is not null ;


 select customers.customer_id,customer_name,orders.customer_id,product_name from customers
natural join orders;

-- Self join


  
create database joindb;

use joindb;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    manager_id INT,
    salary INT
);
INSERT INTO employees (emp_id, emp_name, department, manager_id, salary) VALUES
(1, 'Amit', 'Management', NULL, 120000),
(2, 'Neha', 'HR', 1, 75000),
(3, 'Raj', 'IT', 1, 90000),
(4, 'Simran', 'Finance', 1, 85000),
(5, 'Karan', 'IT', 3, 70000),
(6, 'Priya', 'IT', 3, 72000),
(7, 'Rohit', 'HR', 2, 50000),
(8, 'Anjali', 'HR', 2, 52000),
(9, 'Vikas', 'Finance', 4, 65000),
(10, 'Sneha', 'Finance', 4, 62000),
(11, 'Arjun', 'IT', 5, 55000),
(12, 'Pooja', 'IT', 5, 53000),
(13, 'Meera', 'HR', 7, 45000),
(14, 'Dev', 'Finance', 9, 48000),
(15, 'Nitin', 'IT', 6, 51000);

select * from employees;
select  empl.emp_id,empl.emp_name,empl.manager_id from employees as empl;

select  empl.emp_id,empl.emp_name,empl.manager_id,mngr.emp_id,mngr.emp_name from employees as empl
join employees as mngr
where empl.manager_id=mngr.emp_id;

select e.emp_id,e.emp_name,e.department from employees as e;

select m.emp_id,m.emp_name,m.department from employees as m;

-- select e.emp_id,e.emp_name,e.manager_id,e.department,m.emp_id,m.emp_name,m.department
-- from employees as e join employees as m
-- where e.manager_id=m.emp_id and e.department=m.depatment;

-- self join:-- 

select e.emp_id,e.emp_name,e.manager_id,e.department,m.emp_id,m.emp_name,m.department
from employees as e join employees as m
where e.manager_id=m.emp_id and e.salary>m.salary;

-- you need to find the employess name with all the manager name.

select e.emp_id,e.emp_name,e.manager_id,e.department,m.emp_id,m.emp_name,m.department
from employees as e join employees as m;








 












