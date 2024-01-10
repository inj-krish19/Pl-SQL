drop database krish;
create database mcskrish1947;
use mcskrish1947;
create table candidate(
	cid varchar(6),
	fname varchar(20),
    mname varchar(20),
    sname varchar(20),
    csalary int(10),
    email varchar(25),
    religion varchar(15)
);
create table _candidate_add(
    can_adr varchar(50),
    can_city varchar(15),
    can_code varchar(10)
);
create table _client(
	cl_id varchar(6),
	cl_fname varchar(20),
    cl_mname varchar(20),
    cl_sname varchar(20)
);
create table _client_add(
    cl_adr varchar(50),
    cl_city varchar(15),
    cl_country varchar(30),
    cl_code varchar(10)
);
create table cand_qual(
	can_id varchar(6),
    exam_name int(5),
    marks int(4)
);

insert into candidate 
values("CAN001","KRISH","J","SHAH",20000,"abc@gmail.com","India");

select * from candidate;

truncate table candidate;

/*

-------------------------------------------------------------

OUTPUT :

------------------------------------------------------------

Before All Queries 

******************************************

Candidate :

******************************************

Field		Type

cid			varchar(6)			
fname		varchar(20)			
mname		varchar(20)			
sname		varchar(20)			
csalary		int(10)				
email		varchar(25)			
religion	varchar(15)				

******************************************

Candidate Address :

******************************************

Field		Type

can_adr		varchar(50)
can_city	varchar(15)
can_code	varchar(10)

******************************************

Client : 

******************************************

Field 		Type

cl_sname	varchar(20)
cl_mname	varchar(20)
cl_id		varchar(6)
cl_fname	varchar(20)

******************************************

Client Address : 

******************************************

Field 		Type

cl_adr		varchar(50)
cl_city		varchar(15)
cl_country	varchar(30)
cl_code		varchar(10)

******************************************

Candidate Qualification : 

******************************************

Field 		Type

can_id		varchar(6)
exam_name	int(5)
marks		int(4)


------------------------------------------------------------------------

Solving Queries :

c_id	fname	mname	sname	csalary	email			religion

CAN001	KRISH	J		SHAH	20000	abc@gmail.com	India

after that truncating(empty) data

38	12:52:59	truncate table candidate	0 row(s) affected	0.484 sec

c_id	fname	mname	sname	csalary	email	religion


--------------------------------------------------------------------------------------------------------------------*/