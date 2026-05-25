
-- --------------------------------------CREATE TABLES

create database const_db;

use const_db;

select database();


-- --------------------------------------------	DDL:--(data defination language)


create table test1(id int,age int);


-- ----------------------------------------DML:-- (data manipulation language)
insert into test1 values(101 ,32),(102,null);
select* from test1;



--  -----------------------------------------NOT NULL---------

create table  if not exists test2(id int,age int not null);
insert into test2 values(101 ,32),(102,16);

select* from test2;


-- -------------------------------UNIQUE 

create table  if not exists test3(id int unique,age int not null);
insert into test3 values(101 ,32),(102,16);


select* from test3;


-- -------------------------------------DEFAULT

create table  if not exists test4(id int default 100,age int not null);
insert into test4(age) values(20);
select * from test4;



-- -------------------------------------------PRIMARY KEY


create table  if not exists test6(id int primary key ,age int not null);
insert into test6 values(20,22);
select * from test6;


-- PRIMARY KEY(TWO COLUMN COMBINE= PRIMARY KEY)

create table  if not exists test8(id int ,age int ,salary int,primary key (id,age));
insert into test8 values(1,50,50000),(2,40,58664),(1,51,60000),(3,50,100);

select * from test8;
desc test8;


-- check table 

create table  if not exists test9(id int ,age int check (age>18));
insert into test9 values(1,50);
insert into test9 values(1,20);
select * from test9;


-- CHECK (CONDITION ,AND OPERATOR KO PERFORM KAR SAKTE HAI)

create table  if not exists test10(id int ,age int check (age between 18 and 50));
insert into test10 values(1,50);
insert into test10 values(1,25);
select * from test10;


-- ------------------------------------------FOREGEIN KEY 
create table  student(id int ,name varchar(20),cname varchar(20));
insert into student values(1,'naina','10'),(2,'abhi',12);
create table  class(cname varchar(20) primary key);
insert into class values(10),(8),(9);
select * from student;
select* from class;



-- ---------------------------------------------------parent table


create table  s_class(cname varchar(20) primary key);
insert into s_class values(10),(8),(9);

select* from s_class;

-- --------------------------------------------------------------------child class

create table  student(id int ,name varchar(20),cname varchar(20),
            foreign key(cname) references s_class (cname) );
insert into student values(1,'naina','10'),(2,'abhi',12);

select * from student;


-- -----------------------------
create database if not exists datatypedb;

use datatypedb;

-- numberic datatype:----

create table test1(id tinyint);
insert into test1 values (-1) ,(10);
insert into test1 values (-128);
insert into test1 values (-129); -- out of range(1 byte ==> 8 bit ==> 2**8(-128 to 127))
select * from test1;

-- small int --> 2 byte medium int --> 3 byte
-- int -->4
-- big int -->8 byte 

create table test2(age tinyint unsigned);
insert into test2 values (250);
select * from test2;

drop table test3;
create table test3(salary float,salary2 double);
insert into test3 values(1989.9301934,1989.9301934);
select * from test3;


create table test4(price double(6,2)); -- total is 6,2 is decimal value,4 are the value before
insert into test4 values(0.6765695);-- only 2 decimal values 
insert into test4 values(44.7326723);
insert into test4 values(4453.7326723);
insert into test4 values(4453);
insert into test4 values(44536);-- 5 integers
select * from test4;


-- string data type:---
create table test5(countrycode char(3));
insert into test5 values('IND');
insert into test5 values ('INDIA');--   error  <-------------
insert into test5 values('he      ');
select * ,char_length(countrycode) from test5;-- (char_length white spaces ko renove kr deta hai at last me )
select * from test5;


-- varchar---------------
drop  table test6;
create table test6(countrycode varchar(3));
insert into test6 values('IND');
insert into test6 values ('INDIA');--   error  <-------------
insert into test6 values('h     ');

select * , char_length(countrycode) from test6;

select * from test6;













