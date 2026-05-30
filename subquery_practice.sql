-- DATABASE CREATE
CREATE DATABASE ShopDB;

-- DATABASE USE
USE ShopDB;

---------------------------------------------------
-- TABLE 1: CUSTOMERS
---------------------------------------------------

CREATE TABLE CUSTOMERS (
    CUSTOMER_ID VARCHAR(5) PRIMARY KEY,
    CUSTOMER_NAME VARCHAR(50),
    CITY VARCHAR(50),
    CREDIT_LIMIT INT
);

-- INSERT DATA INTO CUSTOMERS

INSERT INTO CUSTOMERS 
(CUSTOMER_ID, CUSTOMER_NAME, CITY, CREDIT_LIMIT)
VALUES
('C01', 'Ravi Kumar', 'Delhi', 100000),
('C02', 'Priya Singh', 'Mumbai', 80000),
('C03', 'Amit Sharma', 'Bangalore', 60000),
('C04', 'Neha Joshi', 'Chennai', 50000);

---------------------------------------------------
-- TABLE 2: PRODUCTS
---------------------------------------------------

CREATE TABLE PRODUCTS (
    PRODUCT_ID VARCHAR(5) PRIMARY KEY,
    PRODUCT_NAME VARCHAR(50),
    CATEGORY VARCHAR(50),
    PRICE INT
);

-- INSERT DATA INTO PRODUCTS

INSERT INTO PRODUCTS
(PRODUCT_ID, PRODUCT_NAME, CATEGORY, PRICE)
VALUES
('P01', 'Laptop', 'Electronics', 55000),
('P02', 'Headphones', 'Electronics', 3000),
('P03', 'Desk Chair', 'Furniture', 12000),
('P04', 'Notebook', 'Stationery', 150);

---------------------------------------------------
-- TABLE 3: ORDERS
---------------------------------------------------

CREATE TABLE ORDERS (
    ORDER_ID INT PRIMARY KEY,
    CUSTOMER_ID VARCHAR(5),
    PRODUCT_ID VARCHAR(5),
    QUANTITY INT,
    ORDER_DATE DATE,
    STATUS VARCHAR(20),

    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID),
    FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID)
);

-- INSERT DATA INTO ORDERS

INSERT INTO ORDERS
(ORDER_ID, CUSTOMER_ID, PRODUCT_ID, QUANTITY, ORDER_DATE, STATUS)
VALUES
(1001, 'C01', 'P01', 2, '2024-01-05', 'Delivered'),
(1002, 'C02', 'P02', 1, '2024-01-10', 'Pending'),
(1003, 'C01', 'P03', 5, '2024-01-12', 'Delivered'),
(1004, 'C03', 'P01', 3, '2024-01-15', 'Cancelled'),
(1005, 'C02', 'P04', 2, '2024-02-01', 'Delivered'),
(1006, 'C04', 'P02', 1, '2024-02-05', 'Pending'),
(1007, 'C03', 'P03', 4, '2024-02-10', 'Delivered');


select * from customers;
select * from orders;
select * from products;

-- Question 1: Find the names of customers who have placed at least one order.
select customer_name from customers where customer_id in (select customer_id from orders);  


-- Question 2: Find products that have NEVER been ordered.
select product_name from products where product_id not in (select product_id from orders);



-- Question 3: Find customers whose credit limit is above the average credit limit of all customers.

select avg(credit_limit) from customers;
select customer_name from customers where credit_limit >(select avg(credit_limit) from customers ); 




-- Question 4: Find the most expensive product.
select max(price) from products;
select product_name from products where price in (select max(price) from products);


-- Question 5: Find orders where the product's price is above 10000.

select product_name from products where price>10000;

select order_id from orders where product_id in (select product_id from products where price >10000 );

-- Question 6: Find customers who have placed more than 2 orders.

 select customer_name, count(o.order_id) from customers as c 
 join orders as o on c.customer_id=o.customer_id group by customer_name having count(o.order_id)>2;

select * from customers;
select * from orders;
select * from products;

-- Question 7: Find all 'Delivered' orders where the product belongs to the 'Electronics' category.
select status from orders where status ='delivered';

select order_id from orders  where status ='delivered' and product_id in 
(select product_id from products where category ='Electronics');

-- Question 8: Find the customer who placed the maximum number of orders.
select customer_id from customers where customer_id in (select count(order_id) from orders  group by customer_id having count(order_id));



-- ------------------------------------------------------------------------------------------------
-- Create Table
create database db;
use db;
CREATE TABLE Employees (
EMP_ID INT PRIMARY KEY,
NAME VARCHAR(50),
DEPARTMENT VARCHAR(50),
SALARY INT,
MANAGER_ID INT);

-- Insert Data
INSERT INTO Employees (EMP_ID, NAME, DEPARTMENT, SALARY, MANAGER_ID) VALUES
(101, 'Alice', 'HR', 50000, NULL),
(102, 'Bob', 'IT', 80000, 101),
(103, 'Charlie', 'IT', 75000, 101),
(104, 'Diana', 'Finance', 90000, NULL),
(105, 'Eve', 'HR', 48000, 101),
(106, 'Frank', 'Finance', 95000, 104),
(107, 'Grace', 'IT', 82000, 101);

select * from employees;

select avg(salary) from employees;

select * from employees where salary > (select avg(salary) from employees);

select salary from employees where emp_id=101 ;
select * from employees where salary >(select salary from employees where emp_id=101);

select  department,avg(salary) from employees group by department;

select department from employees where salary=(select min(salary) from employees);

select * from employees;
select name,department from employees where department in
 (select department from employees group by department having avg(salary)>70000); 



















