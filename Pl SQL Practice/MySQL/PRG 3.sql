/*
 NAME - SHAH KRISH J.
 ROLL NO. - 47
 SUBJECT - DBMS
 COURSE - COMPUTER SCIENCE
 TOPIC - PROGRAM OF FILES
 
QUE - 3.)	HANDS ON EXERSICE 1

*/


create database hrms;
use hrms;

drop database hrms;
drop table experience;
drop table candidate;

create table experience(

    can_id varchar(6)
    primary key,

    remark varchar(15)
    not null,

    min_exp int(10)
    not null,

    max_exp int(10)
    not null
);

create table candidate(
    can_id varchar(6)
    primary key,

    c_fname varchar(25)
    not null,

    mgr_id varchar(6)
    not null
);

insert into 
	experience(can_id,remark,min_exp,max_exp)
values
	("CAN010","Average",1,1),
	("CAN007","Good",1,2),
 	("CAN004","Best",2,4),
	("CAN001","Excellent",5,10);

insert into 
	candidate(can_id,c_fname,mgr_id)
values
	("CAN001","Sharnam","CAN002"),
 	("CAN003","Flora","CAN010"),
	("CAN004","Neha","CAN010"),
	("CAN005","Ankit","CAN001"),
	("CAN002","Robert","CAN006"),
	("CAN006","Ajay","CAN002"),
	("CAN010","Atharva","CAN003");
    
select * from experience;
select * from candidate;

select emp.can_id "Employee" , mngr.can_id "Not Reports To"
from candidate emp, candidate mngr 
where emp.can_id != mngr.can_id;

select A.can_id,A.remark,A.min_exp,A.max_exp,B.can_id
from experience A inner join candidate B
on A.can_id = B.can_id where min_exp < 10;

select A.can_id,A.remark,A.min_exp,A.max_exp,B.can_id
from experience A cross join candidate B
on A.can_id = B.can_id where max_exp > 0;
/*

OUTPUT :

---------------------------------------------------------

EXPERIENCE :

remark		min_exp	max_exp

Average		1		1
Good		1		2
Best		2		4
Excellent	5		10

MANAGER : 

can_id	c_fname	mgr_id

CAN001	Sharnam	CAN002
CAN003	Flora	CAN010
CAN004	Neha	CAN010
CAN005	Ankit	CAN001
CAN002	Robert	CAN006
CAN006	Ajay	CAN002
CAN010	Atharva	CAN003

SELF JOIN (RANDOM CONDITION OF NOT EQUAL TO):

Employee	Not Reports To

CAN010		CAN001
CAN006		CAN001
CAN005		CAN001
CAN004		CAN001
CAN003		CAN001
CAN002		CAN001
CAN010		CAN002
CAN006		CAN002
CAN005		CAN002
CAN004		CAN002
CAN003		CAN002
CAN001		CAN002
CAN010		CAN003
CAN006		CAN003
CAN005		CAN003
CAN004		CAN003
CAN002		CAN003
CAN001		CAN003
CAN010		CAN004
CAN006		CAN004
CAN005		CAN004
CAN003		CAN004
CAN002		CAN004
CAN001		CAN004
CAN010		CAN005
CAN006		CAN005
CAN004		CAN005
CAN003		CAN005
CAN002		CAN005
CAN001		CAN005
CAN010		CAN006
CAN005		CAN006
CAN004		CAN006
CAN003		CAN006
CAN002		CAN006
CAN001		CAN006
CAN006		CAN010
CAN005		CAN010
CAN004		CAN010
CAN003		CAN010
CAN002		CAN010
CAN001		CAN010

INNER JOIN (RANDOM CONDITION OF ALL RECORD):

can_id	remark		min_exp		max_exp		can_id

CAN001	Excellent	5		10		CAN001
CAN004	Best		2		4		CAN004
CAN010	Average		1		1		CAN010

CROSS JOIN (RANDOM CONDITION OF ALL RECORDS):

can_id	remark		min_exp		max_exp		can_id

CAN001	Excellent	5		10		CAN001
CAN004	Best		2		4		CAN004
CAN010	Average		1		1		CAN010

------------------------------------------------------------*/
