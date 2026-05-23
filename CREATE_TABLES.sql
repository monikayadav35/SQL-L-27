
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










