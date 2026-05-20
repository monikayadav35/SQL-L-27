use shadidb;
select * from employees;
select avg(salary) from employees;
select emp_id,name,salary,avg(salary) over() from employees;
select emp_id,name,salary,max(salary) over(),avg(salary) over() from employees;

select emp_id,name,salary,salary-avg(salary) over() from employees;

select emp_id,name,count(*) over(),min(salary) over(),avg(salary) over(),max(salary) over(),sum(salary) over() from employees;


select emp_id,name, salary,sum(salary) over(),concat(round((salary/sum(salary) over())*100),'%') from employees;

select emp_id,name,salary,sum(salary) over(order by salary) from employees;

select emp_id,name,salary,sum(salary) over(order by emp_id  desc) from employees;

select emp_id,name,salary,department,sum(salary) over(order by department) from employees;

-- ---------------------------------------------------------------------------------------------------------------
 
create database windowsdbms;
use windowsdbms;


-- ============================================
--  Create the employees table
-- ============================================
CREATE TABLE employees (
  emp_id    INT,
  name      VARCHAR(50),
  dept      VARCHAR(30),
  salary    INT,
  hire_year INT
);

--  Insert sample data (12 employees)
-- ============================================
INSERT INTO employees VALUES
  (1,  'Alice',   'IT',      90000, 2019),
  (2,  'Bob',     'IT',      75000, 2020),
  (3,  'Charlie', 'IT',      82000, 2018),
  (4,  'Diana',   'HR',      68000, 2021),
  (5,  'Eve',     'HR',      72000, 2019),
  (6,  'Frank',   'HR',      65000, 2022),
  (7,  'Grace',   'Sales',   55000, 2021),
  (8,  'Henry',   'Sales',   60000, 2021),
  (9,  'Iris',    'Sales',   58000, 2019),
  (10, 'Jack',    'Finance', 95000, 2017),
  (11, 'Karen',   'Finance', 88000, 2018),
  (12, 'Leo',     'Finance', 91000, 2020);



select * from employees;

select *, sum(salary) over(partition by hire_year order by salary) from employees;

select * , sum(salary) over(partition by dept order by hire_year) from employees;

select*, avg(salary) over(partition by dept) ,
case
      when salary>avg(salary) over(partition by dept) then 'above avg salary'
      else 'less than avg salary'
end 
from employees;

-- window function ke function 
-- row_number():-- uniq number  deta hai for all data  based on order wise;

select *, row_number() over(order by emp_id) from employees;
select *,row_number() over(partition  by dept) from employees;

-- rank():-- comperision krna agr duplicate valuer aai to wo ek number dega or jitne number 1 hue utne hi original number skip krke next number deta hai  

select *, rank() over(order by salary desc) from employees;


select *, rank() over( partition by dept order by salary desc) from employees;

select *,row_number() over(order by salary) ,rank() over(order by salary),dense_rank() over(order by salary) from employees;

select *, rank() over(partition by dept order by salary) from employees;

select *, dense_rank() over(partition by dept order by hire_year) from employees;

select * from employees as e
where salary=(select max(salary) from employees where dept=e.dept);

select * from 
(select * ,max(salary) over(partition by dept) as deptsalary from employees) as trh 
where salary =deptsalary;

select * from
(select *, rank() over(partition by dept order by salary desc) as rnk from employees) as tem where rnk=1 ;

select * from  employees where salary=
(select max(salary) from employees where salary <(select max(salary) from employees));

select* from
(select *, dense_rank() over(order by salary desc) as drank from employees) as xyz where drank=4;
select* from employees;


select* from
(select *, dense_rank() over(order by salary) as drank from employees) as xyz where drank=4;
select* from employees;



