drop database krish;
create database krish;
use krish;
create table employee(
	e_id varchar(6),
    e_name text(20),
    designation varchar(30)
);
create table _transaction(
	e_id varchar(6),
    t_id varchar(6)
);
insert into employee
values
("EMP001","VISHAL","Salesman"),
("EMP002","MOHIT","Assistant"),
("EMP003","JARIWALA","Chief Executive"),
("EMP004","DEV","Manager"),
("EMP005","KRISH","Salesman");
insert into _transaction
values
("EMP001","TRA001"),
("EMP002","TRA002"),
("EMP003","TRA003"),
("EMP004","TRA004"),
("EMP005","TRA005");
select * from employee;
select * from _transaction;

select A.e_id,A.e_name,A.designation,B.t_id
from employee A left join _transaction B
on A.e_id = B.e_id; 
