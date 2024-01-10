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

/*alter table candidate type = fsf;*/
show table status like 'candidate';

/*	Describing All Tables	*/
desc candidate;
desc _candidate_add;
desc _client;
desc _client_add;
desc cand_qual;

/*	a)	Add canidate age in candidate table*/
alter table candidate add cand_age int(2);
desc candidate;

/*	b)	Add client phone in client address table*/
alter table _client_add add cl_phno int(8);
desc _client_add;

/*	c)	Add client emial in client table*/
alter table _client add cl_email varchar(20);
desc _client;

/*	d)	Add canidate pager in candidate address table*/
alter table _candidate_add add cand_pager int(20) first;
desc _candidate_add;

/*	e)	Drop client phone number in client address table*/
alter table _client_add drop column cl_phno;
desc _client_add;

/*	f)	Modify the size of Exam Name to 25 from candidate qualification table*/
alter table cand_qual modify exam_name int(25);
desc cand_qual;

/*	g)	Modify the size of Candidate Email to 50 from candidate table after candidate region*/
alter table candidate modify email varchar(50) after religion;
desc candidate;

/*	h)	Modify the size of Candidate Religion to 40 from candidate table make as first column*/
alter table candidate modify religion varchar(40) first;
desc candidate;

/*	i)	Change the column name cand_age to Candidate Current Age from Candidate Table*/
alter table candidate change cand_age cand_cur_age int(5);
desc candidate;

/*	j)	Change the column name client city to city from Client Address Table after client country*/
alter table _client_add change cl_city city varchar(10) after cl_country;
desc _client_add;

/*	k)	Change the column name client zip to pincode from Client Address Table and make first also*/
alter table _client_add change cl_code pincode varchar(10) first;
desc _client_add;

/*	Describing All Tables	*/
desc candidate;
desc _candidate_add;
desc _client;
desc _client_add;
desc cand_qual;


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


	Name		Engine		Version		Row_format	Rows	Avg_row_length	Data_length		Max_data_length	Index_length	Data_free	Auto_increment	
	candidate	InnoDB		10			Dynamic		0		0				16384			0				0				0			NULL			
    
    Create_time				Update_time				Check_time	Collation			Checksum	Create_options	Comment	Max_index_length	Temporary
    2023-04-28 12:51:22		2023-04-28 12:51:26		NULL		latin1_swedish_ci	NULL								0					N

told to not to do type 
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

Client : 

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