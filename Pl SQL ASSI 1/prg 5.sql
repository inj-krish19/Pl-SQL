/*create database db;*/

use db;

create table sailors(
sid int primary key,
sname varchar(20),
rating int,
age int);

insert into Sailors values(18,"jones",3,30);
insert into Sailors values(41,"jonah",6,56);
insert into Sailors values(22,"ahab",7,44);
insert into Sailors values(63,"moby",15);
/*	1	*/

select avg(rating) from sailors; 

select sum(rating) FROM sailors;

select count(rating) FROM sailors; 

select sum(rating)/count(rating) FROM sailors;

/*	2	*/

select sname from sailors
where age < 21;

select s.sname 
from sailors S
where NOT EXISTS ( 
	select *
	FROM sailors S2
        where s2.age < 21
        AND S.rating <= S2.rating );
                  
/*	3	*/
  
select *
from sailors S
where S.rating > ANY (
	select S2.rating
	FROM sailors S2
        where S2.age < 21 ); 
                    

/*	4	*/

select * 
from sailors S1 left outer join sailors S2   
on S1.sid=S2.sid;

select * 
from sailors S1 right outer join sailors S2   
on S1.sid=S2.sid;

select * 
from sailors S1 full outer join sailors S2   
on S1.sid=S2.sid;

select * 
from sailors S1 left outer join sailors S2   
on S1.sid=S2.sid;

