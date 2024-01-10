create database hrms;
use hrms;

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

e_id	e_name	designation	m_id

EMP003	PRINCE	Salesman	EMP005

e_id	e_name	designation	m_id

EMP003	PRINCE	Salesman	EMP005
EMP004	prince	Assistant	EMP001

------------------------------------------------------------------------------*/