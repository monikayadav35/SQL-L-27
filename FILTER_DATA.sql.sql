select current_user();

show databases;

use sakila;

show tables;

select * from customer;

select customer_id from customer;

select customer_id,first_name from customer;
-- kitne bhi column access kr sakte hai and 
-- multi column bhi access kr sakte hai ek baar me

use sakila;

select*from customer;

select first_name,upper(first_name) from customer;

select first_name,lower(first_name) from customer;

select first_name,length(first_name) from customer;

select first_name,char_length(first_name) from customer;

select first_name,concat('mrs',' ',first_name ,' ','sharma') from customer;

select first_name,concat_ws('  ','mrs',first_name ,'sharma') from customer;

select first_name,email,substr(email,3) from customer;

select first_name,email,substr(email,-3) from customer;

select first_name,substr(first_name,4) from customer;

select first_name,substr(first_name,3,5) from customer;

select first_name,instr(first_name,'v') from customer;

select email ,instr(email,'@') from customer;

select email,substr(email,1,instr(email,'@')-1) from customer;

select first_name,replace(first_name,'A','Z') from customer;

select char_length(' raj');

select char_length(trim( 'raj   '));

select  first_name , lpad (first_name,6,'$') from customer;


select*from payment;

select payment_id, amount from payment;

select customer_id,first_name from customer;

select customer_id,first_name,customer_id+10 from customer;

select * from customer where customer_id=2;

select customer_id,store_id from customer where customer_id=2;

select customer_id,first_name,last_name from customer where first_name='MARION';

SELECT * from customer where customer_id>5; 

-- between operator ---> range of values filter===>between

select * from customer where customer_id between 2 and 5;

-- IN operator -----> specific values ka data deta hai
-- filter===> in()

select * from customer where customer_id in (2, 5);

select * from customer where first_name in ('LISA','PATRICIA');

-- OR:-------------logical operator(and ,or,not)

SELECT *  from customer where customer_id=2 or customer_id>8;

SELECT *  from customer where customer_id=2;

SELECT *  from customer where  first_name= 'MARION' or customer_id=2;

SELECT *  from customer where  first_name= 'MARION' and store_id=2;

SELECT *  from customer where  first_name= 'MARION' or store_id=2 and store_id=5;

SELECT *  from customer where  customer_id>=3 or customer_id<=6 and first_name='PATRICIA';


-- AND + OR( SABSE PEHLE AND SOLF HOGA FIR OR CHECK HOGA)

select * from customer where (customer_id=3 or customer_id=7)and first_name='MARIA'; 

-- NOT IN AND NOT BETWEEN;---

select * from customer where customer_id not between 2 and 5;

select * from customer where customer_id not in (2,5);











