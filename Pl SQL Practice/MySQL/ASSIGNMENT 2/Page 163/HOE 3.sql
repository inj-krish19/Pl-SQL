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

rename table _client to ClientInfo;

desc candidate;
desc _candidate_add;
desc _client;
desc _client_add;
desc cand_qual;
desc ClientInfo;

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

12	12:26:49	rename table _client to ClientInfo	0 row(s) affected	0.172 sec

42	12:57:20	desc _client	Error Code: 1146. Table 'mcskrish1947._client' doesn't exist	0.016 sec

bcus it is renamed
--------------------------------------------------------------------------------------------------------------------

Tables After Queries : 

******************************************

Candidate :

******************************************

Field			Type

religion		varchar(40)
cid				varchar(6)
fname			varchar(20)
mname			varchar(20)
sname			varchar(20)
csalary			int(10)
email			varchar(50)
cand_cur_age	int(5)				

******************************************

Candidate Address :

******************************************

Field		Type

cand_pager	int(20)
can_adr		varchar(50)
can_city	varchar(15)
can_code	varchar(10)

******************************************

ClientInfo : 

******************************************

Field 		Type

cl_id	varchar(6)
cl_fname	varchar(20)
cl_mname	varchar(20)
cl_sname	varchar(20)
cl_email	varchar(20)

******************************************

Client Address : 

******************************************

Field 		Type

pincode		varchar(10)
cl_adr		varchar(50)
cl_country	varchar(30)
city		varchar(10)

******************************************

Candidate Qualification : 

******************************************

Field 		Type

can_id		varchar(6)
exam_name	int(25)
marks		int(4)


------------------------------------------------------------------------------------------------------------------*/