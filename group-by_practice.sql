CREATE DATABASE company_db;
USE company_db;
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    join_date DATE,
    city VARCHAR(50)
);
INSERT INTO Employees (emp_id, emp_name, department, salary, join_date, city)
VALUES
(101, 'Alice', 'HR', 50000, '2021-01-15', 'New York'),
(102, 'Bob', 'IT', 70000, '2020-03-10', 'London'),
(103, 'Charlie', 'IT', 65000, '2019-07-23', 'London'),
(104, 'Diana', 'HR', 52000, '2021-06-01', 'New York'),
(105, 'Edward', 'Finance', 80000, '2018-11-12', 'Sydney'),
(106, 'Fiona', 'Finance', 75000, '2020-02-20', 'Sydney'),
(107, 'George', 'IT', 72000, '2022-04-18', 'New York');
select * from employees;
-- 1. Find the total salary paid per department.
select department,sum(salary) from employees group by department;


--  2. Find the number of employees in each department.
select department ,count(*) from employees group by department;


-- 3. first 3 characters of each employee name in capital letters
select upper(substr(emp_name,1,3)) from employees;

-- 4. Find the employee who have more than 6 character in their name
select emp_name from employees where length(emp_name)>6;

select * from employees;

-- 5. Find employees who joined after November 2020.
select  emp_name,year(join_date) from employees where year(join_date)=2020 and month(join_date)<11;


-- 6. Display the number of years since joining (assuming current year = 2025).
select timestampdiff(year,join_date,'2025-01-01' ) from employees;
-- 2nd method
select year(join_date),2025-year(join_date) from employees;

-- 7. Display salary rounded to nearest thousand.
select round(salary,-3) from employees;

-- 8. Find cities having more than 2 employees.
select * from employees;
select city,count(*) from employees group by city having count(*)>2;

-- 9. Find cities where the average salary is between 60,000 and 75,000.
select city,avg(salary) from employees group by city having avg(salary) between 60000 and 75000;

-- 10.Find the department and city combination where the average salary is highest.
select department,city ,avg(salary) from employees group by department,city having avg(salary) order by avg(salary) desc limit 1;

-- 11. Display departments where more than one city is present.
select department ,count( distinct city) from employees group by department having count(distinct city)>1 ;



