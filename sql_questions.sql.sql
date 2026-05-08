use sakila;

CREATE TABLE employees (
    emp_id       INT            PRIMARY KEY,
    first_name   VARCHAR(50)    NOT NULL,
    last_name    VARCHAR(50)    NOT NULL,
    email        VARCHAR(100)   NOT NULL,
    department   VARCHAR(50),
    job_title    VARCHAR(60),
    salary       DECIMAL(10,2),
    hire_date    DATE,
    birth_date   DATE,
    phone        VARCHAR(20),
    city         VARCHAR(50),
    country      VARCHAR(50),
    is_active    CHAR(1)
);


INSERT INTO employees VALUES
(1,  'Alice',  'Smith',    'alice.smith@gmail.com', 'IT',        'Software Engineer',    85000.00,'2019-03-15','1990-06-20','555-1001','New York',     'USA','Y'),
(2,  'Bob',    'Johnson',  'bob.j@yahoo.com',       'HR',        'HR Manager',           72000.00,'2020-07-01','1985-11-05','555-1002','Chicago',      'USA','Y'),
(3,  'Carol',  'Williams', 'carol.w@gmail.com',     'Finance',   'Accountant',           65000.00,'2018-01-10','1992-03-14','555-1003','Houston',      'USA','Y'),
(4,  'David',  'Brown',    'david.b@outlook.com',   'IT',        'DevOps Engineer',      90000.00,'2021-05-20','1988-09-25','555-1004','Los Angeles',  'USA','Y'),
(5,  'Emma',   'Jones',    'emma.j@gmail.com',      'Marketing', 'Marketing Lead',       78000.00,'2017-11-30','1991-07-08','555-1005','Phoenix',      'USA','Y'),
(6,  'Frank',  'Garcia',   'frank.g@yahoo.com',     'Sales',     'Sales Representative', 55000.00,'2022-02-14','1994-02-28','555-1006','Philadelphia', 'USA','N'),
(7,  'Grace',  'Martinez', 'grace.m@gmail.com',     'IT',        'QA Engineer',          68000.00,'2020-09-01','1993-12-01','555-1007','San Antonio',  'USA','Y'),
(8,  'Henry',  'Davis',    'henry.d@outlook.com',   'Finance',   'Financial Analyst',    76000.00,'2019-06-15','1989-04-17','555-1008','San Diego',    'USA','Y'),
(9,  'Isla',   'Wilson',   'isla.w@gmail.com',      'HR',        'Recruiter',            60000.00,'2021-10-05','1995-08-22','555-1009','Dallas',       'USA','Y'),
(10, 'Jack',   'Moore',    'jack.m@yahoo.com',      'Marketing', 'SEO Specialist',       58000.00,'2023-01-09','1997-01-15','555-1010','San Jose',     'USA','Y'),
(11, 'Karen',  'Taylor',   'karen.t@gmail.com',     'Sales',     'Sales Manager',        82000.00,'2016-04-20','1984-05-30','555-1011','Austin',       'USA','Y'),
(12, 'Liam',   'Anderson', 'liam.a@outlook.com',    'IT',        'Data Scientist',       95000.00,'2020-11-15','1987-10-10','555-1012','Jacksonville', 'USA','Y'),
(13, 'Mia',    'Thomas',   'mia.t@gmail.com',       'Finance',   'Tax Consultant',       71000.00,'2022-06-01','1993-06-15','555-1013','Columbus',     'USA','Y'),
(14, 'Noah',   'Jackson',  'noah.j@yahoo.com',      'IT',        'System Admin',         80000.00,'2018-08-25','1990-02-14','555-1014','Charlotte',    'USA','N'),
(15, 'Olivia', 'White',    'olivia.w@gmail.com',    'HR',        'HR Assistant',         50000.00,'2023-03-20','1998-09-05','555-1015','Indianapolis', 'USA','Y'),
(16, 'Paul',   'Harris',   'paul.h@outlook.com',    'Marketing', 'Content Writer',       52000.00,'2021-07-10','1996-11-20','555-1016','San Francisco','USA','Y'),
(17, 'Quinn',  'Clark',    'quinn.c@gmail.com',     'Sales',     'Sales Representative', 56000.00,'2022-09-15','1995-04-11','555-1017','Seattle',      'USA','Y'),
(18, 'Rachel', 'Lewis',    'rachel.l@yahoo.com',    'Finance',   'Budget Analyst',       73000.00,'2019-12-01','1991-01-30','555-1018','Denver',       'USA','Y'),
(19, 'Sam',    'Robinson', 'sam.r@gmail.com',       'IT',        'Cloud Architect',     105000.00,'2017-05-22','1986-07-19','555-1019','Nashville',    'USA','Y'),
(20, 'Tina',   'Walker',   'tina.w@outlook.com',    'HR',        'Training Manager',     69000.00,'2020-03-08','1988-12-03','555-1020','Baltimore',    'USA','Y'),
(21, 'Uma',    'Hall',     'uma.h@gmail.com',       'Marketing', 'Brand Manager',        77000.00,'2018-10-17','1990-08-25','555-1021','Louisville',   'USA','N'),
(22, 'Victor', 'Young',    'victor.y@yahoo.com',    'Sales',     'Sales Director',       98000.00,'2015-02-10','1980-03-07','555-1022','Portland',     'USA','Y');


select * from employees;

-- Q1. Find employees with salary between 65,000 and 85,000
-- Concept: BETWEEN Operator

select * from employees where salary between 65000 and 85000;

-- Q2. List employees in the IT or Finance department

select * from employees where  'IT' or department='finance';

-- Q3. Find employees whose last name ends with 'son'

select * from employees where last_name like '%son';

-- Q4. Find active employees (is_active ='Y') in the IT department

select emp_id, first_name,last_name,job_title,salary from employees where is_active='Y' and department='IT'; 

-- Q5. Display first_name in UPPERCASE and last_name in
-- lowercase for Finance employees

select emp_id, upper(first_name) as first_name_upper,lower(last_name) as last_name_lower,salary from employees where  'IT' or department='finance';

-- Q6. Find employees whose first name has more than 4 characters

select emp_id,first_name,length(first_name) as name_length ,department from employees where length(first_name)>4;

-- Q7. Show full name and its character length for Marketing  employees

select  emp_id,concat(first_name,' ',last_name) as full_name,length(first_name) + length(last_name) as full_name_length, department 
from employees where department='marketing';

-- Q8. Display hire year and years-ago for each Finance employee

select emp_id,first_name,last_name,hire_date,year(hire_date) as hire_year,timestampdiff(year,hire_date ,CURDATE()) as years_ago
from employees where department='Finance';

-- Q9. Show each IT employees's salary rounded to nearest 10,000 and its remainder

select emp_id,first_name,last_name,salary, 
round( salary,-4) as rounded_salary,mod(salary,10000) as salary_remainder from employees where department ='IT';

-- Q10. Find employees using an Outlook email address

select emp_id,first_name,last_name,email from employees WHERE email LIKE '%@outlook.com';

-- Q11. Find employees hired more than 2,000 days ago (from April 28, 2026)

select emp_id,first_name,last_name,hire_date  ,datediff( curdate(),hire_date) as days_employees  from employees
where datediff(curdate(),hire_date)>2000;


-- Q12. Extract the email username (part before'@';) for all HR employees

select emp_id,first_name,last_name,email, substring_index( email,'@',1) as username
 from employees where department='HR';


-- Q13. Find non-IT/Finance employees with salary outside the 60,000–80,000 range

select concat(first_name,' ',last_name) as full_name,department,salary from employees 
 where department NOT IN ('IT','Finance') and (salary <60000 or salary>80000) ;
 
 -- Q14. Extract and uppercase the email username; show only those
-- with username length &gt; 6 characters
 
 select emp_id,first_name,last_name,email,upper(substring_index(email,'@',1)) 
 as username_upper,length(substring_index(email,'@',1)) as username_length
from employees where length(substring_index(email,'@',1))>6;

-- Q15. Find active employees aged 30–38 (from birth_date) earning more than 65,000

SELECT emp_id,CONCAT(first_name, ' ', last_name) AS full_name,birth_date,
(YEAR(CURDATE()) - YEAR(birth_date)) AS age,salary,department 
FROM employees
WHERE (YEAR(CURDATE()) - YEAR(birth_date)) BETWEEN 30 AND 38 AND salary > 65000;

-- -----------------------------------------------------------------------------------------------------------
select * from employees;
select first_name,last_name,department,salary from employees where salary between 65000 and 85000 ;







 












