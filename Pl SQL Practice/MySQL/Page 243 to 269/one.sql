/*
 NAME - SHAH KRISH J.
 ROLL NO. - 47
 SUBJECT - DBMS
 COURSE - COMPUTER SCIENCE
 TOPIC - PROGRAM OF FILES
 
QUE - 1.)	IMPLEMENTING INNER JOIN 

*/


drop database krish;
create database krish;
use krish;

create table schememaster(
	s_id varchar(6)
	primary key,

	s_desc varchar(75)
	not null
);

create table productmaster(
	p_id varchar(6)
	primary key,

	c_id varchar(6)
	not null,

	s_id varchar(6),

foreign key (s_id) references schememaster(s_id)
);

insert into 
	schememaster(s_id,s_desc)
values
	("SCH001","Buy One Take One Free"),
	("SCH002","50% Discount"),
 	("SCH003","20% Discount"),
   	("SCH004","One Bowl Free"),
   	("SCH005","Two Glasses Free");

insert into 
	productmaster(p_id,c_id,s_id)
values
	("PRD001","CAT001","SCH001"),
    ("PRD002","CAT002","SCH002"),
   	("PRD003","CAT003","SCH003"),
    ("PRD004","CAT004","SCH004"),
    ("PRD005","CAT005","SCH005");

select * from schememaster;
select * from productmaster;

select A.p_id ,B.s_id
from productmaster A inner join schememaster B
on A.s_id = B.s_id where c_id="CAT003" order by B.s_id,A.p_id;


select A.p_id ,B.s_id
from productmaster A,schememaster B
where A.s_id = B.s_id and c_id="CAT003" order by B.s_id,A.p_id;

/*

OUTPUT :

----------------------------------------------------------------------

SCHEMEMASTER :

s_id	s_desc

SCH001	Buy One Take One Free
SCH002	50% Discount
SCH003	20% Discount
SCH004	One Bowl Free
SCH005	Two Glasses Free
	
PRODUCTMASTER :

p_id	c_id	s_id

PRD001	CAT001	SCH001
PRD002	CAT002	SCH002
PRD003	CAT003	SCH003
PRD004	CAT004	SCH004
PRD005	CAT005	SCH005
		
		
ANSI STYLE :

p_id	s_id

PRD003	SCH003

THEETA STYLE :

p_id	s_id

PRD003	SCH003
--------------------------------------------------------------------*/
