/*
 NAME - SHAH KRISH J.
 ROLL NO. - 47
 SUBJECT - DBMS
 COURSE - COMPUTER SCIENCE
 TOPIC - PROGRAM OF FILES
 
QUE - 2.)	IMPLEMNTING SELF JOIN AND CASE

*/

create database krish;
use krish;

drop table productmaster;
drop table costingslab;

create table productmaster(
	p_id varchar(6)
	primary key,
	
	p_name varchar(25)
	not null,

	p_cost int(6)
);

create table costingslab(
	_type varchar(15)
	primary key,

	min_cost int(10)
	not null,

	max_cost int(10)
	not null
);

create table employeemaster(
	e_id varchar(6)
    primary key,
    
	e_name varchar(25)
    not null,
    
	designation varchar(25)
    not null,
    
	m_id varchar(6)
    not null
);
insert into 
	productmaster(p_id,p_name,p_cost)
values
	("PRD001","Pentacol",15000),
	("PRD002","Cold Gold Delux",12000),
	("PRD003","Super Star",10000),
	("PRD004","Champion",12000),
   	("PRD005","Smooth White",14000);
insert into 
	costingslab(_type,min_cost,max_cost)
values
	("Economical",3000,7000),
	("Regular",7000,10000),
   	("Expensive",11000,15000),
    ("High Priced",16000,25000);
	
insert into 
	employeemaster(e_id,e_name,designation,m_id)
values
	("EMP001","Jack Rickson","Salesman","EMP004"),
 	("EMP002","Priya Tendulkar","Receptionist","EMP005"),
	("EMP003","Mack Backson","Assistant Executieve","EMP004"),
	("EMP004","Asama Rahman","Sales Executive","EMP005"),
	("EMP005","John Martin","Manager","EMP008"),
	("EMP006","Ramesh Pillai","Accountant","EMP005"),
	("EMP007","Shashank Bhide","Salesman","EMP004"),
	("EMP008","Jimmy Colaco","Managing Director","NULL");
	
select * from productmaster;
select * from costingslab;

select A.p_id,A.p_name,A.p_cost,B.min_cost,B.max_cost,
(case when A.p_cost between B.min_cost and B.max_cost then B._type
else "Excess Priced" end)"Result" 
from productmaster A cross join costingslab B;

select A.p_id,A.p_name,A.p_cost,B.min_cost,B.max_cost,
(case when A.p_cost between B.min_cost and B.max_cost then B._type
else "Excess Priced" end)"Result" 
from productmaster A,costingslab B;

select emp.e_name "Employee" , mngr.e_name "Reports To"
from employeemaster emp, employeemaster mngr 
where emp.m_id = mngr.e_id;

/*
OUTPUT :
---------------------------------------------------------------------------------

PRODUCTMASTER :

p_id	p_name			p_cost

PRD001	Pentacol		15000
PRD002	Cold Gold Delux	12000
PRD003	Super Star		10000
PRD004	Champion		12000
PRD005	Smooth White	14000
		
COSTINGSLAB:

_type		min_cost	max_cost

Economical	3000		7000
Expensive	11000		15000
High Priced	16000		25000
Regular		7000		10000
		

CROSS JOIN :

p_id	p_name				p_cost	min_cost	max_cost	Result
		
PRD001	Pentacol			15000	7000		10000		Excess Priced
PRD001	Pentacol			15000	16000		25000		Excess Priced
PRD001	Pentacol			15000	11000		15000		Expensive
PRD001	Pentacol			15000	3000		7000		Excess Priced
PRD002	Cold Gold Delux			12000	7000		10000		Excess Priced
PRD002	Cold Gold Delux			12000	16000		25000		Excess Priced
PRD002	Cold Gold Delux			12000	11000		15000		Expensive
PRD002	Cold Gold Delux			12000	3000		7000		Excess Priced
PRD003	Super Star			10000	7000		10000		Regular
PRD003	Super Star			10000	16000		25000		Excess Priced
PRD003	Super Star			10000	11000		15000		Excess Priced
PRD003	Super Star			10000	3000		7000		Excess Priced
PRD004	Champion			12000	7000		10000		Excess Priced
PRD004	Champion			12000	16000		25000		Excess Priced
PRD004	Champion			12000	11000		15000		Expensive
PRD004	Champion			12000	3000		7000		Excess Priced
PRD005	Smooth White			14000	7000		10000		Excess Priced
PRD005	Smooth White			14000	16000		25000		Excess Priced
PRD005	Smooth White			14000	11000		15000		Expensive
PRD005	Smooth White			14000	3000		7000		Excess Priced

***********************************************************************************

p_id	p_name				p_cost	min_cost	max_cost	Result

PRD001	Pentacol			15000	7000		10000		Excess Priced
PRD001	Pentacol			15000	16000		25000		Excess Priced
PRD001	Pentacol			15000	11000		15000		Expensive
PRD001	Pentacol			15000	3000		7000		Excess Priced
PRD002	Cold Gold Delux			12000	7000		10000		Excess Priced
PRD002	Cold Gold Delux			12000	16000		25000		Excess Priced
PRD002	Cold Gold Delux			12000	11000		15000		Expensive
PRD002	Cold Gold Delux			12000	3000		7000		Excess Priced
PRD003	Super Star			10000	7000		10000		Regular
PRD003	Super Star			10000	16000		25000		Excess Priced
PRD003	Super Star			10000	11000		15000		Excess Priced
PRD003	Super Star			10000	3000		7000		Excess Priced
PRD004	Champion			12000	7000		10000		Excess Priced
PRD004	Champion			12000	16000		25000		Excess Priced
PRD004	Champion			12000	11000		15000		Expensive
PRD004	Champion			12000	3000		7000		Excess Priced
PRD005	Smooth White			14000	7000		10000		Excess Priced
PRD005	Smooth White			14000	16000		25000		Excess Priced
PRD005	Smooth White			14000	11000		15000		Expensive
PRD005	Smooth White			14000	3000		7000		Excess Priced


SELF JOIN :

Employee		Reports To

Jack Rickson		Asama Rahman
Priya Tendulkar		John Martin
Mack Backson		Asama Rahman
Asama Rahman		John Martin
John Martin		Jimmy Colaco
Ramesh Pillai		John Martin
Shashank Bhide		Asama Rahman

--------------------------------------------------------------------------------*/
