create database internet ;
use internet ;
drop database internet ;

create table customer (
customer_id int ,
first_name varchar(27),
last_name varchar(29),
birth_date varchar(27),
join_date date ,
city varchar(45) ,
state varchar(27),
street varchar(27),
main_phone_num varchar(29),
secondary_phone_num varchar(27),
fax varchar (27),
monthly_discount decimal(4,2),
pack_id int
 );
show databases;

 

insert  customer values (14, 'mjbharland','robinson','1974-04-17','2012-05-12','columbus','chilochip','santmongree street','520.519,1795','520.639,1795','920.639,1787', 7.2,1);
Insert customer values (15, 'hkarland','robinson','1974-04-17','2012-05-12','columbus','chilochip','santmongree street','520.519,1795','520.639,1795','920.639,1787', 1.1,1);
insert customer values (16, 'lharland','robinson','1974-04-17','2012-05-12','columbus','chilochip','santmongree street','520.519,1795','520.639,1795','920.639,1787', 7.2,1);
insert customer values (17, 'harlanld','robinson','1974-04-17','2012-05-12','columbus','chilochip','santmongree street','520.519,1795','520.639,1795','920.639,1787', 3.2,1);
insert customer values (18, 'harlajnd','robinson','1974-04-17','2012-05-12','columbus','chilochip','santmongree street','520.519,1795','520.639,1795','920.639,1787', 3.2,1);
insert customer values (19, 'harfland','robinson','1974-04-17','2012-05-12','columbus','chilochip','santmongree street','520.519,1795','520.639,1795','920.639,1787', 3.1,1);
insert customer values (43, 'hayrland','robinson','1974-04-17','2012-05-12','columbus','chilochip','santmongree street','520.519,1795','520.639,1795','920.639,1787', 5.1,1);
insert customer values (189, 'pharland','robinson','1974-04-17','2012-05-12','columbus','chilochip','santmongree street','520.519,1795','520.639,1795','920.639,1787',37.1,1);

 create table packages(
 pack_id int,
 speed varchar(19),
strt_date date ,
monthly_payment int ,
sector_id int ); 
 
insert packages values (1,'750mbps','2012-05-12',79,1);
insert packages values (2,'750mbps','2012-05-12',79,3);
insert packages values (3,'750mbps','2012-05-12',79,7);
insert packages values (4,'750mbps','2012-05-12',79,9);
insert packages values (5,'750mbps','2012-05-12',79,1);
insert packages values (6,'750mbps','2012-05-12',79,5);
insert packages values (7,'750mbps','2012-05-12',79,6);
insert packages values (8,'750mbps','2012-05-12',79,4);
insert packages values (9,'750mbps','2012-05-12',79,7);
insert packages values (10,'750mbps','2012-05-12',79,2);
insert packages values (11,'750mbps','2012-05-12',79,7);
insert packages values (12,'750mbps','2012-05-12',79,9);
insert packages values (13,'750mbps','2012-05-12',79,1); 
 
create table sectors(
sector_id int(20) ,
sector_name varchar(10));

insert sectors values (1,'private');
insert sectors values (2,'business');

create table pack_grades(
grade_id int ,
grade_name varchar(25),
min_price int,
max_price int); 

insert pack_grades values (1,'very low' , 0,10);




insert pack_grades values (2,'low',11,20);

SELECT * from packages ;
SELECT * from customer ;

SELECT * from sectors ;
SELECT * from pack_grades ;

show tables ;

SELECT * from packages ;
select customer_id , first_name , last_name , main_phone_num , secondary_phone_num ,pack_id from customer ;

SELECT 
    first_name,
    last_name,
    join_date,
    monthly_discount,
    monthly_discount * 0.2 as discount,
    monthly_discount - 0.2 as reduction
    from customer ;
    
select concat(last_name , '' , first_name) as full_name , concat(main_phone_num, '', secondary_phone_num) as contact_details from customer ;    

select count(city),city from customer ;
select distinct(state) from customer ;
select concat (last_name , '', state ) as customer_and_state from customer ;
select concat (first_name, '', last_name,'',monthly_discount,'',city,'',street) as 'fn ,ln , dc and full_address' from customer ;
select distinct(monthly_discount) from customer ;
select first_name , last_name , pack_id from customer where last_name = "king" ;
select * from packages where speed = "5mbps";
select * from packages ;
select * from packages  where speed = "750mbps" ;
select first_name , last_name , pack_id , monthly_discount 
from customer 
order by 
(case 
when monthly_discount<30 then "monthly discount is less then 30"
else " more than 30"
end) ;

select first_name , last_name , pack_id , monthly_discount from customer
 where monthly_discount <30;

select * from customer where join_date = "1974-04-17";

select customer_id, first_name, last_name , state , city , pack_id from customer where pack_id not in(1,28,14);
select last_name ,main_phone_num , monthly_discount , pack_id from customer where customer_id not in (703,314,560);
select first_name , monthly_discount from customer where first_name like "%e" ;
select last_name , pack_id from customer where last_name like '_%d';

select * from customer where last_name like  (' %l' or '%j'or '%k') order by monthly_discount desc;
select first_name , join_date , monthly_discount , pack_id from customer where last_name not like '%a' ;

select distinct(monthly_discount) from customer;

select concat(first_name , '' , last_name, '',monthly_discount) from customer where monthly_discount not between 20 and 30
order by first_name asc;

select concat(first_name,'',last_name )full_name , concat(main_phone_num , ' ' , street )contacts , monthly_discount as dc from customer where monthly_discount between 11 and 27; 
select * from customer order by 
( case 
when city = "newyork" then " the city is new york"
else " not in new york "
end );


select * from customer 
where city = "newyork" and monthly_discount between 30 and 40 ;

select pack_id , speed , sector_id from packages where speed = "750mbps";

select customer_id , lower(first_name) , upper(last_name) from customer 
where customer_id between 80 and 150;
select last_name ,first_name , concat(substr(upper (first_name) , 1 ,1 ), substr (upper(last_name), 1,3 ) ,'@gmail.com')  from customer ;

select substr(lower(first_name),1,3) from customer ;

select substr(upper(first_name),1,3) from customer;
select concat(substr(lower(first_name),1,3) , substr(upper(first_name),1,3) , '@gmail.com') from customer ;
select last_name , first_name , concat(substr(upper(first_name),1,1), substr(lower(last_name),-3,3), "my@gmail.com" ) from customer ;

select last_name ,length(last_name) from customer 
where length(last_name)>7;

select first_name , last_name , main_phone_num , replace(main_phone_num,'51','$$') as " new phone number" from customer ;
select first_name , main_phone_num , replace (main_phone_num , '17', '**') as "new phone number " from customer ;

select last_name , first_name , replace(main_phone_num , '95', '##') as "new phone number" from customer;
select first_name , birth_date,
round((datediff(current_date(),birth_date)) / 365 , 0) as age 
from customer;

select * from customer 
where month(birth_date) = month(current_date())
and 
day(birth_date) = day (current_date());


Select concat(c.first_name, ' ' ,c.last_name)as customer_name, p.pack_id,p.speed,p.monthly_payment,s.sector_name
from customer c join packages p
on c.pack_id = p.pack_id
join sectors s 
on p.sector_id = s.sector_id;

select c.last_name,c.first_name,c.join_date,p.pack_id,p.speed,s.sector_name
from customer c join packages p 
on c.pack_id = p.pack_id
join sectors s
on s.sector_id = p.sector_id;

select c.first_name ,c.last_name ,p.speed ,p.monthly_payment
from  customer c left join packages p
on c.pack_id = p.pack_id; 

select c1.last_name, c1.first_name , c1.pack_id
from customer c1 join customer c2 
on c1.pack_id = c2.pack_id 
where lower(concat(c2.first_name , ' ' , c2.last_name)) = 'amado taylor'
and lower (concat(c1.first_name , ' ', c1.last_name )) <> 'amado taylor'
;
select * from customer ;

select c1.last_name , c1.first_name , c1.pack_id 
from customer c1 join customer c2
on c1.pack_id = c2.pack_id 
where lower(concat(c2.first_name , ' ' , last_name)) = 'hkarland'
and  lower(concat(c2.first_name , ' ' ,last_name )) <> 'harkarland';