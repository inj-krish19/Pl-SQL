drop database if exists db;
create database db;
use db;

show tables;

create table Student(
	sid varchar(6)
    primary key,
    sname text(50)
    not null,
    std int 
    not null check(std > 0),
    age int 
    not null check(age > 5)   
);

create table Employee(
	eid varchar(6)
    primary key,
    ename text(50)
    not null,
    join_date date 
    not null,
    salary float(8,2) 
    not null check(salary > 0)   
);

drop table Enrolled;

create table Enrolled(
	sid varchar(6),
    eid varchar(6),
    fees float(8,2),
    foreign key (sid) references Student(sid),
    foreign key (eid) references Employee(eid)
);

desc Student;
desc Employee;
desc Enrolled;

insert into Student values
('STD001','DHRUTI',10,16),
('STD002','KRISH',12,18),
('STD003','KHUSHI',3,7),
('STD004','HARSH',10,16),
('STD005','JAYDEEP',11,17),
('STD006','AESHA',2,6),
('STD007','DRASHTI',4,9),
('STD008','JAY',5,10);

insert into Employee values
('EMP001','RAHUL','1999-02-16',60000),
('EMP002','ALEX','2000-03-23',80000),
('EMP003','KISHOR','2003-11-02',57000),
('EMP004','MEET','2010-12-28',40000),
('EMP005','DEEP','2001-08-19',55000),
('EMP006','VIRENDRA','2000-05-06',36000),
('EMP007','CLAZY','2004-09-09',90000),
('EMP008','VIJAY','2005-05-15',100000);

insert into Enrolled values
('STD003','EMP002',2300), 
('STD005','EMP008',8000),
('STD004','EMP001',15000),
('STD001','EMP006',19000),
('STD002','EMP003',3000),
('STD008','EMP005',50000),
('STD006','EMP004',5000),
('STD007','EMP007',43000);

-- truncate table Enrolled;

select * from Student;
select * from Employee;
select * from Enrolled;

alter table Student add city text(20) default "AHMEDABAD";
alter table Student modify city text(30);
alter table Student drop city;
alter table Student change std standard int;

-- not used commands
alter table Student rename abc; -- or
rename table Student to abc; 

create table tablename as 
select sid as stuid from Student;
-- not working with and also 	select eid as empid from Employee;

insert into tablename select sid from student;
select * from tablename limit 8;

truncate table tablename;

select * from Student limit 2;
select * from Employee limit 2,3;
select * from Enrolled limit 5,3;

delete from tablename where stuid = "STD001";

select * from Employee where salary > 5000 and salary < 50000;
select * from Employee where salary between 5000 and 50000;

select ename from Employee where ename like "A%";
select ename from Employee where ename like "%A%";
select ename from Employee where ename like "_A%";

select sname from Student where sname in ("DHRUTI","KRISH");
select sname from Student where not sname in ("DHRUTI","KRISH");

-- both are case sensitive
select sname from Student where sname regexp "^A";
select sname from Student where sname regexp binary "^A";

select sname from Student where sname regexp "^..A"; -- can write as
select sname from Student where sname regexp "^.{2}A";

select @Amir := count(salary) as "Rich" , max(salary) as "Max Salary" from Employee where salary > 75000; 

select sid,count(*) as "Count" from Student group by sid having count(*) >= 1;
select sid,count(*) as "Count" from Student order by sid;

-- difference of group by

select length(sname) as "Name Count" , count(sname) as "Occurence" from Student;
select length(sname) as "Name Count" , count(sname) as "Occurence" from Student group by length(sname);
select length(sname) as "Name Count" , count(sname) as "Occurence" from Student order by length(sname);

-- give null records also

select length(sname) as "Name Count" , count(sname) as "Occurence" from Student group by length(sname) with rollup;

-- ansi style

select N.sid,E.eid,E.ename,N.fees from Employee E
inner join Enrolled N on E.eid = N.eid 
order by E.eid;

-- thetea style

select S.sid,E.eid,S.sname,E.ename,N.fees 
from Employee E,Enrolled N,Student S 
where E.eid = N.eid and S.sid = N.sid 
order by E.eid,S.sname,E.ename;

-- inner join 

select N.sid,E.eid,E.ename,N.fees from Employee E
inner join Enrolled N on E.eid = N.eid 
order by E.eid;

-- outer join

-- used for retriving all records if there is no match then also
	
    -- left join 
    
select N.sid,E.eid,E.ename,E.salary,E.join_date,N.fees from Employee E
left join Enrolled N on E.eid = N.eid 
order by E.eid;

    -- right join 
    
select N.sid,N.eid,E.ename,N.fees from Employee E
right join Enrolled N on E.eid = N.eid 
order by E.eid;

-- cross join

select N.sid,E.eid,E.ename,N.fees,
(case when N.fees between 15000 and 50000 
 then "Income Tax Raid Soon"
 else "You Get Bonus or Promotion " end) as "Result"
from Employee E cross join Enrolled N 
on E.eid = N.eid order by E.eid;

-- self join

select E.eid,M.eid as "Manager" ,E.ename,E.salary 
from Employee E inner join Employee M 
on E.eid = concat("EMP00",floor(rand() * 8)) order by E.eid;

create view V1 as select E.eid,S.sid from Employee E,Student S;
select v1.sid,v1.eid from v1 ;

-- natural join 
-- remove duplication

select N.sid,E.eid,N.fees from v1 E
natural join Enrolled N where E.eid = N.eid 
and E.sid = N.sid order by E.eid;

-- aggregate functions

 select avg(salary) from Employee;
 select min(age),max(age) from Student;
 select count(*) from Employee;
 select count(distinct age) from Student;
 select sum(fees) from Enrolled;
 
 select abs(-65),abs(65);
 select pow(3,2);
 select round(19.9),round(19.1),round(19.5);
 select sqrt(361);
 select exp(9),exp(3);
 
 select extract(year from now()),extract(month from now()),extract(day from now());
 select extract(hour from now()),extract(minute from now()),extract(second from now());
 select extract(month from '2000-10-29');
 select greatest(10,15,90),greatest('ALEX','krish','KRISH');
 select least(10,15,90),least('ALEX','krish','KRISH');
 
 select mod(5,2),mod(5.5,2),mod(6,2);
 select truncate(25.415,4),truncate(25.415,-1);
 select floor(15.90),floor(15.1),floor(15.5);
 select ceil(15.90),ceil(15.1),ceil(15.5);
 select rand(),rand()*8,floor(rand() * 8);
 
 select pi();
 select radians(90),radians(180),radians(360);
-- 1.5707963267948966	3.141592653589793	6.283185307179586
  select degrees(1.5707963267948966),degrees(3.141592653589793),degrees(pi()),degrees(6.283185307179586);
-- 90	180	180	360  hence radians and degree are in relation

select lower('KRISH'),upper(lower('KRISH'));
select substring('KRISH GAMER',7,5);
select ascii('A'),ascii('a');
select instr('KRISH GAMER',substring('KRISH GAMER',7,5));
select left('Kaise Ho',5),right('Sab Chal Raha h',11),mid('To Moj Kar',4,3);

select ltrim('       OP        '),rtrim('     OP      '),trim('     OP     ');
select trim(leading '123' from '12345678123'),trim(both '123' from '12345678123');
select lpad('Giyan',10,'*'),rpad('Giyan',10,'*');
select replace('Dhruti Is Good','Good','Bad');
select locate('Bad','Dhruti Is Bad'),locate('Bad','Dhruti Is Bad',15);

select bit_length('Kaise Ho'),char_length('Kaise Ho');
select concat('Kaise ','Ho');
select insert('Maje Me H',0,9,'OP');
select reverse('Dhruti');
select repeat('Nimuda  ',3);

select now(),curdate(),sysdate(),system_user();
select date_add(now(),interval 2 month);
select date_sub(now(),interval 2 month);
select adddate(now(),interval 2 month),subdate(now(),interval 2 month);
select last_day(now());

select period_diff('2020-12-12','2005-02-19');
select date_format(now(),'%D %W %M %Y'),time_format(now(),'%H %k %h %I %l');
select time_to_sec(2000),sec_to_time(2000);
select to_days(now()),from_days(now());
select user(),database();

-- leap year program

 select @yr := extract(year from now()) as "Year",
 if((@yr % 4 = 0) and (@yr % 100 = 1) or (@yr % 400 = 0),"Leap","Not Leap");
 
alter table Student add choice enum("Pass","Fail","Say Later");-- default "Say Letter";
select * from Student;

create table temp(
	city enum("ABD","MBM","DLH")
    default "DLH" 
);
desc temp;
-- alter table temp add n int auto_increment ;