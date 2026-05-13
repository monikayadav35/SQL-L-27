create database joinpractice;

use joinpractice;


CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);



INSERT INTO departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Sales');



INSERT INTO employees VALUES
(101, 'Alice', 70000, 1, NULL),
(102, 'Bob', 60000, 2, 101),
(103, 'Charlie', 55000, 2, 102),
(104, 'David', 50000, 3, 101),
(105, 'Eva', 45000, 4, 104),
(106, 'Frank', 75000, 1, 101),
(107, 'Grace', 80000, 2, 102),
(108, 'Helen', 62000, 3, 104),
(109, 'Ian', 47000, 4, 105),
(110, 'Jack', 53000, 2, 102),
(111, 'Kevin', 49000, 3, 104),
(112, 'Laura', 72000, 1, 101),
(113, 'Mike', 58000, 4, 105),
(114, 'Nina', 61000, 2, 107),
(115, 'Oscar', 52000, NULL, 101);

select * from departments;
select * from employees;
/*
Display employee names along with their department names.
| emp_name | dept_name |
| -------- | --------- |
| Alice    | HR        |
| Bob      | IT        |
| Charlie  | IT        |
| David    | Finance   |
| Eva      | Sales     |
| Frank    | HR        |
| Grace    | IT        |
| Helen    | Finance   |
| Ian      | Sales     |
| Jack     | IT        |
| Kevin    | Finance   |
| Laura    | HR        |
| Mike     | Sales     |
| Nina     | IT        |

*/

select customers.customer_id,customers.customer_name ,orders.customer_id,product_name  from customers
join orders where customers.customer_id=orders.customer_id;

/*
Display all employees and their department names, including employees without departments.
| emp_name | dept_name |
| -------- | --------- |
| Alice    | HR        |
| Bob      | IT        |
| Charlie  | IT        |
| David    | Finance   |
| Eva      | Sales     |
| Frank    | HR        |
| Grace    | IT        |
| Helen    | Finance   |
| Ian      | Sales     |
| Jack     | IT        |
| Kevin    | Finance   |
| Laura    | HR        |
| Mike     | Sales     |
| Nina     | IT        |
| Oscar    | NULL      |
*/

select employees.emp_name ,departments.dept_name from employees
  join  departments  where  departments.dept_id=employees.dept_id order by employees.emp_name;



/*
Find the number of employees in each department.
| dept_name | total_employees |
| --------- | --------------- |
| HR        | 3               |
| IT        | 5               |
| Finance   | 3               |
| Sales     | 3               |

*/
select e.emp_name ,d.dept_name from employees as e  left join  departments  as d on e.dept_id=d.dept_id;

/*
Display all departments and the total salary paid in each department.
| dept_name | total_salary |
| --------- | ------------ |
| HR        | 217000       |
| IT        | 309000       |
| Finance   | 161000       |
| Sales     | 150000       

*/
select d.dept_name,count(e.emp_id) from employees as e  inner  join  departments  as d on e.dept_id=d.dept_id group by d.dept_name;


select* from employees;

/*
Find how many employees report to each manager.
| manager | team_size |
| ------- | --------- |
| Alice   | 5         |
| Bob     | 4         |
| David   | 4         |
| Eva     | 2         |
| Grace   | 1         


*/
select d.dept_name,sum(e.salary) from employees as e  inner  join  departments  as d on e.dept_id=d.dept_id group by d.dept_name;

/*

Display average salary department-wise where average salary is greater than 60000.
| dept_name | avg_salary |
| --------- | ---------- |
| HR        | 72333.33   |
| IT        | 61800      |

*/

select m.emp_name,count(*) from employees as e  join  employees  as m on e.manager_id=m.emp_id group by m.emp_name;



-- Display average salary department-wise where average salary is greater than 60000.
-- | dept_name | avg_salary |
-- | --------- | ---------- |
-- | HR        | 72333.33   |
-- | IT        | 61800      |

select d.dept_name,avg(e.salary) from employees as e   join  departments  as d on e.dept_id=d.dept_id group by d.dept_name having avg(salary)>60000;



use sakila;
select* from actor;
select * from film_actor;
select * from film;
-- select actor_id,full_name,also the film id (inner_join)
select act.actor_id, concat(act.first_name,'  ',act.last_name)as full_name ,fiac.film_id from actor as act
 inner join film_actor as fiac  on act.actor_id=fiac.actor_id ;
 
 
 -- get the film_id, the film title ,and the actor_id
 
 select f.film_id,f.title,fiac.actor_id from film as f join film_actor as fiac on f.film_id=fiac.film_id ;
 
 
 -- find the actor_id,actor_name and the movies he has work .
 
 select act.actor_id,concat(act.first_name,' ',last_name) as actor_name,f
 .title as movie_name  from actor as act
 join film_actor as fiac  on act.actor_id=fiac.actor_id join  film as f  on f.film_id=fiac.actor_id ;  
 

 
 --  -- find the actor_id,actor_name and the movies he has work the movies whoes length >120 .
 
  select act.actor_id,concat(act.first_name,' ',last_name) as actor_name,f.title as movie_name  from actor as act
 join film_actor as fiac  on act.actor_id=fiac.actor_id join  film as f  on f.film_id=fiac.actor_id where length(f.title)>120 ;  
 
 drop database shadidb;
 
 create database shadidb;
 use shadidb;
 create table biodata(id int, name varchar(20),age int);
 insert into biodata values(1,'Rahul',28),(2,'Anjali',28),(3,'Aishwarya',40),(4,'Naina',30);
 
 select * from biodata;
 
 select age from biodata where name='rahul';

select * from biodata where age=29;
select * from biodata where age=( select age from biodata where name='rahul');

select max(age) from biodata;

select * from biodata where age=40;

select * from biodata where age=(select max(age) from biodata);

select * from biodata where age=(select min(age) from biodata);

select char_length(name) from biodata where name='rahul';

select name  from biodata where char_length(name)=5;

select name from biodata where char_length(name)=(select char_length(name) from biodata where name='rahul');
-- single row subquery 
-- is type ki query ko single  row  of subquery : in which query return only on group . 


use sakila ;
select * from film;

select  rental_rate from film where title='african egg';

select title,rental_rate from film where  rental_rate=2.99;

select title,rental_rate from film where  rental_rate=(select  rental_rate from film where title='african egg');

select film_id,rental_rate from film where  rental_rate=(select  min(rental_rate) from film);

select film_id,title,rental_duration  from film where  rental_duration>(select  avg(rental_duration) from film);

select release_year from film;

-- select * from film where release_year=(select release_year from film  where title='along trip') and rating= 
-- (select rating from film where title = 'apollo teen');


use shadidb;
select* from biodata;

select * from biodata where name='rahul' 
and age;
select * from biodata where name ='aishwarya' or name='anjali';

select * from biodata where name='rahul' 
and age in (select age from biodata where name ='aishwarya' or name='anjali');

select * from biodata where  age in (select age from biodata where name ='aishwarya' or name='anjali');

select * from biodata where  age not in  (select age from biodata where name ='anjali' or name='aishwarya');



-- Create Table
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


select  * from employees;

select avg(salary) from employees;

select * from employees where salary >(select avg(salary) from employees);

select max(salary) from employees;

-- select * from employees where salary=(select max(salary) from employees);

select salary from employees where name='Alice';

select salary from employees where emp_id=101;

select * from employees where salary>(select salary from employees where emp_id=101);
select min(salary) from  employees; 

select  department from employees where salary=(select min(salary) from  employees );
select  * from employees where salary=(select min(salary) from  employees );


select * from employees where department='hr' or  department='it';

select * from employees where name='alice' or name='bob';

select * from employees where salary= 50000 or salary=80000;

select department from employees where department='hr' or  department='it';

select * from  employees where department in(select department from employees where name='alice' or name='bob');

select emp_id, salary from employees where emp_id=103 or emp_id=107;

select * from employees where salary not in (select salary from employees where emp_id=103 or emp_id=107);

select * from employees where salary >any (select salary from employees where emp_id=103 or emp_id=107);

select * from employees where salary <any (select salary from employees where emp_id=103 or emp_id=107);

select * from employees where department='hr';

select * from employees where salary >any(select salary from employees where department='hr');

select * from employees where salary >all (select salary from employees where department='hr');

select * from employees where department='it';

select * from employees where salary>all (select salary from employees where department='it');

select * from employees where salary>any (select salary from employees where department='it');

select * from employees;

-- find the emp_detail whos work in it department and have salary >101 

select salary from employees where emp_id=101;

select * from employees where department='it' and salary >any(select salary from employees where emp_id=101);

-- find the name of the person whoes salary > all the salary of hr or it department;

select salary from employees where department='it' or department='hr';

select * from employees where salary >all(select salary from employees where department='it' or department='hr');

-- find the emp_id emp_name of the user whoes salary >salary of eny employee working under 101;

select emp_id ,name from employees where manager_id=101;
select  *  from employees  where salary>any(select salary from employees where manager_id=101);

select max(salary) from employees;

select max(salary) from employees where salary < (select max(salary) from employees);
















 
 

 
 












