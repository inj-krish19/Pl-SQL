create database krish19;
use krish19;
create table categorymaster(
cat_id varchar(6)
primary key ,
cat_name varchar(25)
);
desc categorymaster;
insert into 
	categorymaster(cat_id,cat_name)
values
	("CAT001","Refrigerator");
select * from categorymaster;
create table productmaster(
p_id varchar(6),
p_name varchar(30),
co_id varchar(6),
cat_id varchar(6),
sch_id varchar(6),
cost dec(7,2),
qty int(3),
primary key(p_id,co_id)
);
insert into 
	productmaster(p_id,p_name,co_id,cat_id,sch_id,cost,qty)
values
	("PR0001","Pentacool","CMP001","CAT001","SCH003","15000","22");
insert into 
	productmaster(p_id,p_name,co_id,cat_id,sch_id,cost,qty)
values
    ("PR0002","Cold Gold Infiniti","CMP001","CAT001","SCH001","12000","22");
/*
	ERROR :
0	18	13:07:04	
insert into productmaster(p_id,p_name,co_id,cat_id,sch_id,cost,qty)
 values("PR0002","Cold Gold Infiniti","CMP001","CAT001","SCH001","12000","22")	
 Error Code: 1062. 
 Duplicate entry 'PR0002-CMP001' 
 for key 'PRIMARY'	0.000 sec*/
select * from productmaster;
create table categorymaster(
cat_id int(2)
auto_increment,
cat_name varchar(25)
not null,
primary key(cat_id)
);
insert into 
	categorymaster(cat_name)
values
	("Refrigerator");
insert into 
	categorymaster(cat_name)
values
	("Washing Machine");
insert into 
	categorymaster(cat_name)
values
	("Air Conditionors");
insert into 
	categorymaster(cat_name)				
values																																																																																																																																																																																																																																																											
	("Digital Cameras");
insert into 
	categorymaster(cat_name)
values
    ("Television");
select * from categorymaster;
create table employeemaster(
e_id varchar(6),
e_name varchar(25),
e_designation varchar(25),
m_id varchar(6),
primary key(e_id)
);
desc employeemaster;
select * from employeemaster;
create table transactionmaster(
t_id varchar(6),
c_id varchar(6),
e_id varchar(6) references employeemaster,
t_date date,
d_date date,
amount dec(7,2),
primary key(t_id)
);
/*	drop table transactionmaster	*/
create table transactionmaster(
t_id varchar(6),
c_id varchar(6),
e_id varchar(6),
t_date date,
d_date date,
amount dec(7,2),
primary key(t_id),
foreign key(e_id) references employeemaster(e_id)
);
desc transactionmaster;
/*	drop table employeemaster	*/
create table employeemaster(
e_id varchar(6),
e_name varchar(25),
e_designation varchar(25),
m_id varchar(6),
primary key(e_id)
);
/*	drop table transactionmaster	*/
create table transactionmaster(
t_id varchar(6),
c_id varchar(6),
e_id varchar(6),
t_date date,
d_date date,
amount dec(7,2),
primary key(t_id),
foreign key(e_id) references employeemaster(e_id) on delete cascade
);
desc transactionmaster;
insert into 
	employeemaster(e_id,e_name,e_designation,m_id)
values
	("EMP001","Jack Rickson","Salesman","EMP005");
insert into 
	employeemaster(e_id,e_name,e_designation,m_id)
values
	("EMP002","Priya Tendulkar","Receptionsist","EMP005");
insert into 
	employeemaster(e_id,e_name,e_designation,m_id)
values
	("EMP003","Mark Backson","Assist Executive","EMP004");
insert into 
	transactionmaster(t_id,c_id,e_id,t_date,d_date,amount)
values
	("TRA001","CUS003","EMP001","2003/10/06","2003/10/10","38000");
insert into 
	transactionmaster(t_id,c_id,e_id,t_date,d_date,amount)
values
    ("TRA002","CUS002","EMP002","2004/05/21","2005/06/01","47000");
insert into 
	transactionmaster(t_id,c_id,e_id,t_date,d_date,amount)
values
	("TRA003","CUS003","EMP003","2004/12/31","2005/01/02","17000");
insert into 
	transactionmaster(t_id,c_id,e_id,t_date,d_date,amount)
values
	("TRA004","CUS003","EMP002","2005/02/10","2005/02/13","34000");
delete from employeemaster where e_id ="EMP002";
select * from transactionmaster;
/*	drop table employeemaster	*/
/*	drop table transactionmaster	*/
create table employeemaster(
e_id varchar(6),
e_name varchar(25),
e_designation varchar(25),
m_id varchar(6),
primary key(e_id)
);
create table transactionmaster(
t_id varchar(6),
c_id varchar(6),
e_id varchar(6),
t_date date,
d_date date,
amount dec(7,2),
primary key(t_id),
foreign key(e_id) references employeemaster(e_id) on delete set null
);
desc transactionmaster;
insert into 
	employeemaster(e_id,e_name,e_designation,m_id)
values
	("EMP001","Jack Rickson","Salesman","EMP005");
insert into 
	employeemaster(e_id,e_name,e_designation,m_id)
values
	("EMP002","Priya Tendulkar","Receptionsist","EMP005");
insert into 
	employeemaster(e_id,e_name,e_designation,m_id)
values
	("EMP003","Mark Backson","Assist Executive","EMP004");
insert into 
	transactionmaster(t_id,c_id,e_id,t_date,d_date,amount)
values
	("TRA001","CUS003","EMP001","2003/10/06","2003/10/10","38000");
insert into 
	transactionmaster(t_id,c_id,e_id,t_date,d_date,amount)
values
    ("TRA002","CUS002","EMP002","2004/05/21","2005/06/01","47000");
insert into 
	transactionmaster(t_id,c_id,e_id,t_date,d_date,amount)
values
	("TRA003","CUS003","EMP003","2004/12/31","2005/01/02","17000");
insert into 
	transactionmaster(t_id,c_id,e_id,t_date,d_date,amount)
values
	("TRA004","CUS003","EMP002","2005/02/10","2005/02/13","34000");
    insert into 
	employeemaster(e_id,e_name,e_designation,m_id)
values
	("EMP001","Jack Rickson","Salesman","EMP005");
insert into 
	employeemaster(e_id,e_name,e_designation,m_id)
values
	("EMP002","Priya Tendulkar","Receptionsist","EMP005");
insert into 
	employeemaster(e_id,e_name,e_designation,m_id)
values
	("EMP003","Mark Backson","Assist Executive","EMP004");
insert into 
	transactionmaster(t_id,c_id,e_id,t_date,d_date,amount)
values
	("TRA001","CUS003","EMP001","2003/10/06","2003/10/10","38000");
insert into 
	transactionmaster(t_id,c_id,e_id,t_date,d_date,amount)
values
    ("TRA002","CUS002","EMP002","2004/05/21","2005/06/01","47000");
insert into 
	transactionmaster(t_id,c_id,e_id,t_date,d_date,amount)
values
	("TRA003","CUS003","EMP003","2004/12/31","2005/01/02","17000");
insert into 
	transactionmaster(t_id,c_id,e_id,t_date,d_date,amount)
values
	("TRA004","CUS003","EMP002","2005/02/10","2005/02/13","34000");
delete from employeemaster where e_id ="EMP002";
select * from transactionmaster;
/*	drop table categorymaster	*/
create table categorymaster(
cat_id varchar(6),
cat_name varchar(25)
unique
);
insert into 
	categorymaster(cat_id,cat_name)
values
	("CAT001","Refrigerator");
insert into 
	categorymaster(cat_id,cat_name)
values
	("CAT002","Washing Machine");
insert into 
	categorymaster(cat_id,cat_name)
values
	("CAT003","Air Conditionors");
select * from categorymaster;
/*	drop table employeemaster	*/
create table employeemaster(
e_id varchar(6),
e_name varchar(25),
e_designation varchar(25),
m_id varchar(6),
unique(e_name)
);
insert into 
	employeemaster(e_id,e_name,e_designation,m_id)
values
	("EMP001","Jack Rickson","Salesman","EMP005");
insert into 
	employeemaster(e_id,e_name,e_designation,m_id)
values
	("EMP002","Priya Tendulkar","Receptionsist","EMP005");
insert into 
	employeemaster(e_id,e_name,e_designation,m_id)
values
	("EMP003","Mark Backson","Assist Executive","EMP004");
select * from employeemaster;
create table companymaster(
co_id varchar(6)
not null,
co_name varchar(25)
not null,
co_address varchar(75)
not null,
co_person varchar(25)
not null,
p_terms varchar(25)
not null
);
insert into 
	companymaster(co_id,co_name,co_address,co_person,p_terms)
values
	("CMP001","Godrej","NULL","Sharanam Shah","Cash or Cheque");
    insert into 
	companymaster(co_id,co_name,co_person,p_terms)
values
	("CMP001","Godrej","Sharanam Shah","Cash or Cheque");
select * from companymaster;
delete from productmaster;
/*	delete product master	*/
create table transactionmaster(
t_id varchar(6)
primary key ,
c_id varchar(6),
e_id varchar(6),
t_date date
not null,
d_date date
not null,
amount dec(7,2)
not null
);
insert into 
	productmaster(p_id,p_name,co_name,cat_id,sch_id,cost,qty)
values
	("PR0001","Pentacool","CMP001","CAT001","SCH003","15000","22");
insert into 
	productmaster(p_id,p_name,co_name,cat_id,sch_id,cost,qty)
values
    ("PR0002","Cold Gold Infiniti","CMP001","CAT002","SCH003","12000","22");
insert into 
	productmaster(p_id,p_name,co_name,cat_id,sch_id,cost,qty)
values
	("PR0003","Gold Cold Delux","CMP001","CAT001","SCH003","10000","22");
insert into 
	productmaster(p_id,p_name,co_name,cat_id,sch_id,cost,qty)
values
	("PR0004","Superstar","CMP003","CAT001","SCH003","12000","18");
insert into 
	productmaster(p_id,p_name,co_name,cat_id,sch_id,cost,qty)
values
	("PR0005","Champion","CMP004","CAT001","SCH002","14000","22");
insert into 
	productmaster(p_id,p_name,co_name,cat_id,sch_id,cost,qty)
values
    ("PR0006","Smooth White","CMP005","CAT001","SCH003","12000","12");
insert into 
	productmaster(p_id,p_name,co_name,cat_id,sch_id,cost,qty)
values
	("PR0007","Bottom Mount Black","CMP002","CAT001","SCH002","15000","16");
insert into 
	productmaster(p_id,p_name,co_name,cat_id,sch_id,cost,qty)
values
	("PR0008","Fully Automatic GDF 1301","CMP002","CAT002","SCH003","16000","32");
insert into 
	productmaster(p_id,p_name,co_name,cat_id,sch_id,cost,qty)
values
	("PR0009","Fully Automatic GDF 901","CMP001","CAT002","SCH002","10000","22");
insert into 
	productmaster(p_id,p_name,co_name,cat_id,sch_id,cost,qty)
values
	("PR0010","Semi Automatic GDS 707ELE","CMP001","CAT002","SCH003","11000","22");
select p_id,p_name,cost,qty from productmaster where qty is null;
select p_id,p_name,cost,qty from productmaster where qty < 22;
select p_id,p_name,cost,qty from productmaster where qty >= 22;
select p_id,p_name,cost,qty from productmaster where qty >= 22 or qty is null;
select p_id,p_name,cost, if(qty is null ,"Unknown",qty) as qty from productmaster;
/*	delete company master	*/
create table companymaster(
co_id varchar(6),
co_name varchar(25),
co_address varchar(75),
co_person varchar(25),
p_terms varchar(25)
default "100% Advanced Payment"
);
insert into 
	companymaster(co_id,co_name,co_address,co_person,p_terms)
values
	("CMP001","Godrej","Pirojshah Nagar","Sharanam Shah","Cash or Cheque");
insert into 
	companymaster(co_id,co_name,co_address,co_person,p_terms)
values
	("CMP002","Samsung","B1 , Near Onida House , Phase III , Mahakali Caves Road , Andheri(E)","Neha Deshmukh","Cash or Cheque");
select c_id,c_name,p_terms from companymaster;
create table schememaster(
sch_id varchar(6),
sch_descri varchar(25)
not null,
constraint c_id primary key (sch_id)
);
desc schememaster;
/*	delete transaction master	*/
create table transactionmaster(
t_id varchar(6),
c_id varchar(6),
e_id varchar(6),
t_date date,
d_date date,
amount dec(7,2),
constraint e_id foreign key (employeemaster) references employeemaster(e_id)
);
desc transactionmaster;
/*	drop table productmaster	*/
create table productmaster(
p_id varchar(6),
p_name varchar(30)
not null,
co_name varchar(75),
cat_id varchar(75),
sch_id varchar(75),
cost dec(7,2)
not null,
qty int(3)
not null,
constraint pk_id primary key(p_id) ,
constraint pk_p_id foreign key (co_name) references companymaster(co_id)
);
desc productmaster;
alter table companymaster add primary key(c_id);
alter table productmaster add constraint fkc_id foreign key(c_id) references companymaster(c_id) modify qty int(5);
desc productmaster;