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

------------------------------------------------------------------------------*/