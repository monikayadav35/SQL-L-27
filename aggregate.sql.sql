use sakila;
show tables;
select* from payment;

select customer_id,count(customer_id)as total_transaction from payment group by customer_id;

select count(customer_id) as total_transaction,sum(amount) as total_amount from payment where customer_id>3;

select amount,count(amount)as occurance from payment group by amount;

select sum(amount)as total_amount from payment;

select staff_id,avg(amount) as avrage_amount from payment group by staff_id;
use sakila;

CREATE TABLE sales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    region VARCHAR(50),
    product VARCHAR(50),
    sales_person VARCHAR(50),
    amount DECIMAL(10,2),
    sale_date DATE
);

INSERT INTO sales (region, product, sales_person, amount, sale_date) VALUES
('North', 'Laptop', 'Amit', 55000, '2025-01-05'),
('North', 'Mobile', 'Amit', 20000, '2025-01-06'),
('South', 'Laptop', 'Ravi', 60000, '2025-01-07'),
('East', 'Tablet', 'Suman', 15000, '2025-01-08'),
('West', 'Laptop', 'Neha', 58000, '2025-01-09'),

('North', 'Tablet', 'Amit', 12000, '2025-01-10'),
('South', 'Mobile', 'Ravi', 22000, '2025-01-11'),
('East', 'Laptop', 'Suman', 50000, '2025-01-12'),
('West', 'Tablet', 'Neha', 14000, '2025-01-13'),
('North', 'Laptop', 'Amit', 57000, '2025-01-14'),

('South', 'Tablet', 'Ravi', 13000, '2025-01-15'),
('East', 'Mobile', 'Suman', 21000, '2025-01-16'),
('West', 'Laptop', 'Neha', 61000, '2025-01-17'),
('North', 'Mobile', 'Amit', 19000, '2025-01-18'),
('South', 'Laptop', 'Ravi', 62000, '2025-01-19'),

('East', 'Tablet', 'Suman', 16000, '2025-01-20'),
('West', 'Mobile', 'Neha', 23000, '2025-01-21'),
('North', 'Tablet', 'Amit', 11000, '2025-01-22'),
('South', 'Mobile', 'Ravi', 25000, '2025-01-23'),
('East', 'Laptop', 'Suman', 52000, '2025-01-24'),

('West', 'Tablet', 'Neha', 13500, '2025-01-25'),
('North', 'Laptop', 'Amit', 59000, '2025-01-26'),
('South', 'Tablet', 'Ravi', 12500, '2025-01-27'),
('East', 'Mobile', 'Suman', 20500, '2025-01-28'),
('West', 'Laptop', 'Neha', 60000, '2025-01-29'),

('North', 'Mobile', 'Amit', 21000, '2025-01-30'),
('South', 'Laptop', 'Ravi', 63000, '2025-01-31'),
('East', 'Tablet', 'Suman', 17000, '2025-02-01'),
('West', 'Mobile', 'Neha', 24000, '2025-02-02'),
('North', 'Tablet', 'Amit', 12500, '2025-02-03'),

('South', 'Mobile', 'Ravi', 26000, '2025-02-04'),
('East', 'Laptop', 'Suman', 54000, '2025-02-05'),
('West', 'Tablet', 'Neha', 15000, '2025-02-06'),
('North', 'Laptop', 'Amit', 61000, '2025-02-07'),
('South', 'Tablet', 'Ravi', 14000, '2025-02-08');

select* from sales;



-- total sales

select sum(amount) as total_sales from sales; 

-- mobile sales

select sum(amount) as mobile_total_sales from sales where product='mobile';

select  sum(amount),avg(amount) from sales where region='north' and (product='laptop' or product='mobile');

select max(amount),min(amount) from sales where month(sale_date)=2;

select sum(amount),region as total_sales  from sales  group by region;

select avg(amount) as avrage_sales,sales_person from sales group by sales_person;

select sum(amount) as total_amount,product from sales  where sales_person != 'amit' group by product;

select count(sales_person) as number_of_sales,sales_person from sales where amount >1000 group by sales_person;

select count(product) as total_transaction from sales  where month(sale_date)=1;

-- where cluse filter the data 
-- clculate filter par having clouse ka use karte hai

select product, sum(amount)  from sales group by product having sum(amount)>250000;

select* from sales;

--  I NEED TO FIND HOW MANY SALES ARE DONE BY EACH PERSON .

select sales_person,count(sales_person) from sales group by sales_person;


select sales_person,count(sales_person) from sales group by sales_person  having count(sales_person)>8;


select region ,sum(amount) from sales group by region having count(*)>9;

-- find the total transaction done by each person in the decrising order.

select  sales_person,sum(amount) from sales group by sales_person order by sum(amount) desc;

select sales_person,product,count(amount) from sales group by sales_person,product;

select * from payment;

select year (payment_date), sum(amount) from payment  group by year(payment_date);

select year (payment_date), sum(amount),month(payment_date) from payment  group by year(payment_date),month(payment_date);




