drop database hrms;
create database hrms;
use hrms;
create table productmaster(
	p_id varchar(6),
    p_name text(20),
    cost int(6)
);
drop table productmaster;
insert into productmaster
values("PRD001","VISHAL",20000),
	  ("PRD002","KRISH",30000),
      ("PRD003","PRINCE",30000),
      ("PRD004","prince",10000),
      ("PRD005","MOHIT",50000);
      
select * from productmaster
where p_name regexp "^P";

select * from productmaster
where p_name regexp "^[pP]";

select * from productmaster
where p_name regexp binary "^P";

select * from productmaster
where p_name regexp binary "^[pP]";

create table employeemaster(
	e_id varchar(6),
    e_name char(20),
    designation char(20),
    m_id varchar(6)
);
drop table employeemaster;
insert into employeemaster
values("EMP001","VISHAL","Salesman","EMP005"),
	  ("EMP002","KRISH","Manager","EMP001"),
      ("EMP003","PRINCE","Salesman","EMP005"),
      ("EMP004","prince","Assistant","EMP001"),
      ("EMP005","MOHIT","Sales Executive","EMP002");
      
select * from employeemaster
where e_name regexp binary "^P";

select * from employeemaster
where e_name regexp binary "^[pP]";

/*

OUTPUT :

------------------------------------------------------------------------------

p_id	p_name	cost

PRD003	PRINCE	30000
PRD004	prince	10000

p_id	p_name	cost

PRD003	PRINCE	30000
PRD004	prince	10000

p_id	p_name	cost

PRD003	PRINCE	30000

p_id	p_name	cost

PRD003	PRINCE	30000
PRD004	prince	10000

**************************************

e_id	e_name	designation	m_id

EMP003	PRINCE	Salesman	EMP005

e_id	e_name	designation	m_id

EMP003	PRINCE	Salesman	EMP005
EMP004	prince	Assistant	EMP001

------------------------------------------------------------------------------*/