create database gu;
use gu;
create table companymaster(
c_id varchar(6)
primary key ,
c_name varchar(25)
not null,
c_address varchar(75)
not null,
c_person varchar(25)
not null,
p_terms varchar(25)
not null
);
insert into 
	companymaster(c_id,c_name,c_address,c_person,p_terms)
values
("CMP001","Godrej","Pirojshah Nagar","Sharanam Shah","Cash or Cheque"),
("CMP002","Samsung","B1 , Near Onida House , Phase III , Mahakali Caves Road , Andheri(E)","Neha Deshmukh","Cash or Cheque"),
("CMP003","Sony","S1 , Near Opera House , SandHurst Bridge , Charni Road","Rahul Raj","100% Advance Payment"),
("CMP004","Philips","A3 , Sitara Chambers , Near MIG Club , Bandara(E)","John Candy","Only Cheque");
desc companymaster;
select * from companymaster;
create table categorymaster(
cat_id varchar(6)
primary key ,
cat_name varchar(25)
not null
);
insert into 
	categorymaster(cat_id,cat_name)
values
("CAT001","Refrigerator"),
("CAT002","Washing Machine"),
("CAT003","Air Conditioners"),
("CAT004","Digital Cameras"),
("CAT005","Telivision");
desc categorymaster;
select * from categorymaster;
create table schememaster(
sch_id varchar(6)
primary key ,
sch_name varchar(25)
not null
);
insert into 
	schememaster(sch_id,sch_name)
values
("SCH001","Buy One Take One Free"),
("SCH002","50% Discount"),
("SCH003","20% Discount"),
("SCH004","One Bawl Free"),
("SCH005","Two Glasses Free");
desc schememaster;
select * from schememaster;
create table customermaster(
cu_id varchar(6)
primary key ,
cu_name varchar(25)
not null,
c_name varchar(25)
not null,
cu_address varchar(100)
not null,
cu_telephone integer(20)
not null
);
insert into 
	customermaster(cu_id,cu_name,c_name,cu_address,cu_telephone)
value
("CUS001","Smita Vane","NULL","B6 , Rane Nagar , Near Nalasopara , Police Station , Nalasopara(E)","28888888"),
("CUS002","NULL","Silicon Chip Tech","A5 , Jay Chambers , Nanda Patkar Road , VileParle(E)","26124533"),
("CUS003","Chayya Bhankar","NULL","A55 , BaseRoad , Thane","28675590"),
("CUS004","Anil Sahu","NULL","C3 , Pooja Building , Near Nanda Patkar Road , VileParle(E)","28001188"),
("CUS005","Sanjyot Kurmure","NULL","A4 , Sector17 , Vashi","28907669"),
("CUS006","Vaishali Shah","NULL","7 , Makanji Mansion , Balgovinddas Road , Shivaji Park","28907269"),
("CUS007","NULL","Puru Hsg. Soc","34 , Shahnaz Building , Near Station , Kurla(W)","28904523"),
("CUS008","NULL","Uttam Stores","Near Shreyas Cinema , Ghatkopar(W)","23900059"),
("CUS009","NULL","Sun Pvt Ltd.","235, Parel Village , Lower Parel","26490675"),
("CUS010","Manisha Palashkar","NULL","C/O SST Hostel , Subhash Nagar , Bandra(E)","25677177"),
("CUS011","NULL","Ghar Karobar","55 , Bharat Nagar , Bandra(E)","28906785"),
("CUS012","Ivan Bayross","NULL","A5 , Jay Chambers , Nanda Patkar Road , VileParle(E)","26124533");
desc customermaster;
select * from customermaster;

/*											COMPANY MASTER
c_id	c_name		c_address																c_person		p_terms
CMP001	Godrej		Pirojshah Nagar															Sharanam Shah	Cash or Cheque
CMP002	Samsung		B1 , Near Onida House , Phase III , Mahakali Caves Road , Andheri(E)	Neha Deshmukh	Cash or Cheque
CMP003	Sony		S1 , Near Opera House , SandHurst Bridge , Charni Road					Rahul Raj		100% Advance Payment
CMP004	Philips		A3 , Sitara Chambers , Near MIG Club , Bandara(E)						John Candy		Only Cheque


CATEGORY MASTER
cat_id	cat_name
CAT001	Refrigerator
CAT002	Washing Machine
CAT003	Air Conditioners
CAT004	Digital Cameras
CAT005	Telivision


SCHEME MASTER
sch_id	sch_name
SCH001	Buy One Take One Free
SCH002	50% Discount
SCH003	20% Discount
SCH004	One Bawl Free
SCH005	Two Glasses Free
	


*/