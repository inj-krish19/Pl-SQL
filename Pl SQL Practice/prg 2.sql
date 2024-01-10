drop database db;
create database db;
use db;

create table employee(
	eid varchar(6),
    ename varchar(20)
);

insert into employee
values("STD001","KRISH");

delimiter // 
create procedure example(eid varchar(6),ename varchar(20))

begin  
	
    insert into employee values(eid,ename);
    
end
//
delimiter

call example("STD002","VISHAL");
select * from employee;



delete student;
drop table student;
create table student(
	name varchar(10),
    maths int,
    science int,
    english int
);

select * from student;

delimiter // 

create procedure print(name varchar(10),
    maths int,
    science int,
    english int)

begin 
	insert into student values(name,maths,science,english);
    
end;
//
delimiter
call print("MOHIT",50,50,50);
call print("krish",60,70,100);
SELECT *,(maths + science + english) as "Total" from student;

delimiter //

alter table student add sname varchar(10) after fname;
desc student;

delimiter //
create procedure __MFName(fname varchar(10),sname varchar(10))

begin 
	insert into student(fname,sname) values(fname,sname);
end;             
//
delimiter ;
	call _MFName("SHAILESH","JARIWALA");
    call _MFName("VISHAL","BAGHEL");
    call _MFName("JAGDISH","SHAH");
select *,concat(name," ",fname," ",sname) from student;
    
    