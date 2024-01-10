drop database if exists db;
create database db;
use db;

create table student(
	sid varchar(6),
    name varchar(20),
	fname varchar(20),
	sname varchar(20)
);

delimiter //

create procedure Concatination(
	sid varchar(6),
    name varchar(20),
	fname varchar(20),
	sname varchar(20)	)

begin 
	insert into student values(sid,name,fname,sname);
end;

//
delimiter 

call Concatination("STD001","KRISH ","JAGDISH BHAI ","SHAH");
call Concatination("STD002","VISHAL ","RAMMOHAN BHAI ","BAGHEL");
call Concatination("STD003","MOHIT ","SHAILESH BHAI ","JARIWALA");
call Concatination("STD004","YASH ","ASHOK BHAI ","DATANIYA");
call Concatination("STD005","SHIVAM ","VIRENDRA BHAI ","BHAVSAR");

select *,concat(name,fname,sname) as "FULL NAME" from student group by name;