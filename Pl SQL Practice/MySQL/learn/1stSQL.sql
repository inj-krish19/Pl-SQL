create database db6;
use db6;
create table student2(
std_id varchar(50) 
NOT NULL,
std_no int 
check ( std_no > 0 ),
std_fname varchar(50) 
NOT NULL,
std_mname varchar(50) 
DEFAULT "KRISH",
std_sname varchar(50)
DEFAULT "SHAH" 
);
describe student2