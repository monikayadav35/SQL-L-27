-- 22nd may - Windows
drop database rjdb;
create database rjdb;

use rjdb;

CREATE TABLE sales (
    id INT,
    sale_date DATE,
    amount INT
);


INSERT INTO sales VALUES
(1, '2026-01-01', 100),
(2, '2026-01-02', 200),
(3, '2026-01-03', 300),
(4, '2026-01-04', 200),
(5, '2026-01-05', 500);

select * from sales;
-- lag():-- previoues date print krne ke liye 
select * ,lag(sale_date,1) over() from sales;

select *, lag(sale_date,1) over(order by amount desc) from sales;

-- LEAD:-- lead


-- unbounded preceding :--first row  ------> (row number ke liye unbounded ki jagah row number aayega)
-- unbounded following :-- last row   

select *,lead(sale_date,1) over(order by amount desc) from sales;

select * ,sum(amount) over(rows between unbounded preceding  and current row) from sales;

select * ,sum(amount) over(rows between 1  preceding and current row) from sales;

select *, sum(amount) over(rows between unbounded preceding and 1 following) from sales;

select * , sum(amount) over( rows between current row and  1 following) from sales;

CREATE TABLE employees_sales (
sale_id INT,
employee_name VARCHAR(50),
department VARCHAR(50),
sale_date DATE,
sales_amount INT
);

INSERT INTO employees_sales VALUES
(1, 'Amit', 'Electronics', '2026-01-01', 500),
(2, 'Amit', 'Electronics', '2026-01-03', 700),
(3, 'Amit', 'Electronics', '2026-01-05', 600),
(4, 'Neha', 'Electronics', '2026-01-02', 800),
(5, 'Neha', 'Electronics', '2026-01-04', 900),
(6, 'Neha', 'Electronics', '2026-01-06', 750),
(7, 'Raj', 'Furniture', '2026-01-01', 300),
(8, 'Raj', 'Furniture', '2026-01-03', 450),
(9, 'Raj', 'Furniture', '2026-01-05', 500),
(10, 'Simran', 'Furniture', '2026-01-02', 400),
(11, 'Simran', 'Furniture', '2026-01-04', 550),
(12, 'Simran', 'Furniture', '2026-01-06', 650),
(13, 'Vikas', 'Clothing', '2026-01-01', 200),
(14, 'Vikas', 'Clothing', '2026-01-03', 250),
(15, 'Vikas', 'Clothing', '2026-01-05', 300),
(16, 'Priya', 'Clothing', '2026-01-02', 350),
(17, 'Priya', 'Clothing', '2026-01-04', 400),
(18, 'Priya', 'Clothing', '2026-01-06', 450),
(19, 'Karan', 'Electronics', '2026-01-07', 1000),
(20, 'Karan', 'Electronics', '2026-01-08', 1200);

CREATE TABLE employee_attendance (
attendance_id INT,
employee_name VARCHAR(50),
department VARCHAR(50),
attendance_date DATE,
hours_worked INT
);


INSERT INTO employee_attendance VALUES
(1, 'Amit', 'Electronics', '2026-01-01', 8),
(2, 'Amit', 'Electronics', '2026-01-02', 9),
(3, 'Amit', 'Electronics', '2026-01-03', 7),
(4, 'Neha', 'Electronics', '2026-01-01', 8),
(5, 'Neha', 'Electronics', '2026-01-02', 10),
(6, 'Neha', 'Electronics', '2026-01-03', 9),
(7, 'Raj', 'Furniture', '2026-01-01', 6),
(8, 'Raj', 'Furniture', '2026-01-02', 7),
(9, 'Raj', 'Furniture', '2026-01-03', 8),
(10, 'Simran', 'Furniture', '2026-01-01', 9),
(11, 'Simran', 'Furniture', '2026-01-02', 8),
(12, 'Simran', 'Furniture', '2026-01-03', 10),
(13, 'Vikas', 'Clothing', '2026-01-01', 5),
(14, 'Vikas', 'Clothing', '2026-01-02', 6),
(15, 'Vikas', 'Clothing', '2026-01-03', 7),
(16, 'Priya', 'Clothing', '2026-01-01', 8),
(17, 'Priya', 'Clothing', '2026-01-02', 8),
(18, 'Priya', 'Clothing', '2026-01-03', 9),
(19, 'Karan', 'Electronics', '2026-01-01', 10),
(20, 'Karan', 'Electronics', '2026-01-02', 11);

select * from  employees_sales;
select * from employee_attendance;

-- Find total sales by each department.
select employee_name, department ,sales_amount,sum(sales_amount) over(partition by department) from employees_sales;


-- Find average sales per employee.
select employee_name, sales_amount,avg(sales_amount) over(partition by employee_name) as avg_sales from employees_sales;

-- Rank employees by sales within each department.
select employee_name ,department,sales_amount,rank()
 over(partition by department order by sales_amount desc) from employees_sales;
 
 select* from employees_sales;
 -- Find previous sale amount for each employee.
 select employee_name,sales_amount ,lag(sales_amount,1) over(partition by employee_name) as privies_sale from employees_sales;
 
 -- Find next sale amount for each employee.
 select employee_name,sale_date,sales_amount ,
 lead(sales_amount,1) over(partition by employee_name order by sales_amount) as next_sales 
 from employees_sales;
 
 -- Calculate running total using ROWS BETWEEN
-- UNBOUNDED PRECEDING AND CURRENT ROW.

select employee_name,sale_date,sales_amount,
sum(sales_amount) over(rows between  unbounded preceding and current row) as running_total from employees_sales;


-- Calculate moving average of current row and previous row.
select employee_name,sale_date,sales_amount,
avg(sales_amount) over(rows between  current row and ) as running_total from employees_sales;



