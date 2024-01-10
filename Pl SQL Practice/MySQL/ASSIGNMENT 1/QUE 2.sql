create database Mcskrish147;
use Mcskrish147;

	/*CUSTOMER MASTER*/

create table customermaster(
c_id varchar(6)
primary key ,
c_name varchar(25)
not null,
co_name varchar(25)
not null,
c_address varchar(100)
default "AHMEDABAD",
c_telephone varchar(20)
not null 
);
desc customermaster;
select * from customermaster;

	/*COMPANY MASTER*/

create table companymaster(
co_id varchar(6)
primary key ,
co_name varchar(25)
unique key,
co_address varchar(75)
not null,
co_person varchar(25)
not null,
p_terms varchar(25)
not null
);
desc companymaster;
select * from companymaster;

	/*CATEGORY MASTER*/

create table categorymaster(
cat_id varchar(6)
primary key ,
cat_name varchar(25)
not null
);
desc categorymaster;
select * from categorymaster;

	/*SCHEME MASTER*/

create table schememaster(
sch_id varchar(6)
primary key ,
sch_descri varchar(25)
not null
);
desc schememaster;
select * from schememaster;

	/*EMPLOYEE MASTER*/

create table employeemaster(
e_id varchar(6)
primary key ,
e_name varchar(25)
not null,
e_designation varchar(25)
not null,
m_id varchar(25)
not null
);
desc employeemaster;
select * from employeemaster;

	/*PRODUCT MASTER*/

create table productmaster(
p_id varchar(6)
primary key ,
p_name varchar(30)
not null,
co_name varchar(75),
cat_id varchar(75),
sch_id varchar(75),
cost dec(7,2)
not null,
qty int(3)
not null,
foreign key (co_name) references companymaster(co_name),
foreign key (cat_id) references categorymaster(cat_id),
foreign key (sch_id) references schememaster(sch_id)
);
desc productmaster;
select * from productmaster;

	/*TRANSACTION MASTER*/

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
not null,
foreign key (c_id) references companymaster(c_id),
foreign key (e_id) references employeemaster(e_id)
);
desc transactionmaster;
select * from transactionmaster;

	/*TRANSACTION DETAILS*/

create table transactiondetails(
t_id varchar(6),
p_id varchar(6)
not null,
p_cost dec(7,2)
not null,
foreign key (t_id) references transactionaster (t_id),
foreign key (p_id) references TransactionMaster (p_id)
);
desc transactiondetails;
select * from transactiondetails;

/*constrains name as not null , primary key ,
foreign key , unique key , default was used .
Checkk can't use because these are static and
we are putting data by our self*/

/*				INSERTING DATA IN ALL TABLES			*/

	/* INSERT DATA IN COMPANY MASTER TABLE */

insert into 
	companymaster(co_id,co_name,co_address,co_person,p_terms)
values
	("CMP001","Godrej","Pirojshah Nagar","Sharanam Shah","Cash or Cheque"),
	("CMP002","Samsung","B1 , Near Onida House , Phase III , Mahakali Caves Road , Andheri(E)","Neha Deshmukh","Cash or Cheque"),
	("CMP003","Sony","S1 , Near Opera House , SandHurst Bridge , Charni Road","Rahul Raj","100% Advance Payment"),
	("CMP004","Philips","A3 , Sitara Chambers , Near MIG Club , Bandara(E)","John Candy","Only Cheque");


	/* INSERT DATA IN CATEGORY MASTER TABLE */
										
insert into 
	categorymaster(cat_id,cat_name)
values
	("CAT001","Refrigerator"),
	("CAT002","Washing Machine"),
	("CAT003","Air Conditionors"),
	("CAT004","Digital Cameras"),
	("CAT005","Television");
            
            
	/* INSERT DATA IN SCHEME MASTER TABLE */
            
insert into 
	schememaster(sch_id,sch_descri)
values
	("SCH001","Buy One Take One Free"),
	("SCH002","50% Discount"),
	("SCh003","20% Discount"),
	("SCH004","One Bowl Free"),
	("SCH005","Two Glasses Free");


	/* INSERT DATA IN CUSTOMER MASTER TABLE */

insert into 
	customermaster(c_id,c_name,co_name,c_address,c_telephone)
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
    
	/* INSERT DATA IN  EMPLOYEE  MASTER TABLE */

insert into 
	employeemaster(e_id,e_name,e_designation,m_id)
values
	("EMP001","Jack Rickson","Salesman","EMP005"),
	("EMP002","Priya Tendulkar","Receptionsist","EMP005"),
	("EMP003","Mark Backson","Assist Executive","EMP004"),
	("EMP004","Asama Rahman","Sales Exexcutive","EMP005"),
    ("EMP005","John Martin","Manager","EMP008"),
    ("EMP006","Ramesh Pillai","Accountant","EMP005"),
	("EMP007","Shashank Bhinde","Salesman","EMP004"),
    ("EMP008","Jimmic Colenco","Managing Director","NULL");

	/* INSERT DATA IN PRODUCT MASTER TABLE */

insert into 
	productmaster(p_id,p_name,co_name,cat_id,sch_id,cost,qty)
values
	("PR0001","Pentacool","CMP001","CAT001","SCH003","15000","22"),
	("PR0002","Cold Gold Infiniti","CMP001","CAT002","SCH003","12000","22"),
	("PR0003","Gold Cold Delux","CMP001","CAT001","SCH003","10000","22"),
	("PR0004","Superstar","CMP003","CAT001","SCH003","12000","18"),
	("PR0005","Champion","CMP004","CAT001","SCH002","14000","22"),
    ("PR0006","Smooth White","CMP005","CAT001","SCH003","12000","12"),
	("PR0007","Bottom Mount Black","CMP002","CAT001","SCH002","15000","16"),
	("PR0008","Fully Automatic GDF 1301","CMP002","CAT002","SCH003","16000","32"),
	("PR0009","Fully Automatic GDF 901","CMP001","CAT002","SCH002","10000","22"),
	("PR0010","Semi Automatic GDS 707ELE","CMP001","CAT002","SCH003","11000","22"),
    ("PR0011","Semi Automatic GDS 550","CMP001","CAT002","SCH002","14000","22"),
	("PR0012","Quadra Plus GDS 650 NT","CMP001","CAT002","SCH003","17000","34"),
	("PR0013","Quadra Plus 1201 NT","CMP001","CAT002","SCH001","13000","22"),
	("PR0014","DRUM Front Loading","CMP002","CAT002","SCH001","16000","22"),
	("PR0015","Fully Automatic Top Loading","CMP002","CAT005","SCH004","12000","22"),
    ("PR0016","Semi Automatic","CMP002","CAT001","SCH005","13000","08"),
	("PR0017","Split AC 2T With Remote","CMP001","CAT003","SCH001","15000","22"),
	("PR0018","Split AC 1T With Remote","CMP003","CAT003","SCH002","13000","01"),
	("PR0019","Windows AC Electro Mechanic","CMP001","CAT003","SCH003","10000","22"),
	("PR0020","Windows AC With Remote","CMP001","CAT003","SCH003","13000.90","02"),
    ("PR0021","ICS","CMP002","CAT007","SCH003","15000.50","05"),
	("PR0022","InstaChill","CMP002","CAT003","SCH001","20000","22"),
	("PR0023","Turbo Power","CMP002","CAT003","SCH003","22000","22"),
	("PR0024","CyberShot Enthusiast","CMP003","CAT003","SCH001","5000","22"),
	("PR0025","CyberShot Point&Shot","CMP003","CAT003","SCH002","5000","22"),
    ("PR0026","Visual Voice Records","CMP003","CAT003","SCH001","4500","00"),
	("PR0027","Mavica","CMP004","CAT003","SCH002","1299","07"),
	("PR0028","XBR","CMP003","CAT004","SCH001","3500","100"),
	("PR0029","Tube TVS","CMP003","CAT005","SCH001","7540","12"),
	("PR0030","Projection TVS","CMP003","CAT005","SCH001","5699","72"),
    ("PR0031","Flat Panel TVs","CMP003","CAT005","SCH001","12000","24"),
	("PR0032","HDTV TVs","CMP002","CAT005","SCH001","8900.80","22"),
	("PR0033","Location Free TVs","CMP001","CAT005","SCH001","10000","23");

	/* INSERT DATA IN PRODUCT TRANSACTION  MASTER TABLE */
             
insert into 
	transactionmaster(t_id,c_id,e_id,t_date,d_date,amount)
values
	("TRA001","CUS003","EMP006","2003/10/06","2003/10/10","38000"),
	("TRA002","CUS002","EMP004","2004/05/21","2005/06/01","47000"),
	("TRA003","CUS003","EMP004","2004/12/31","2005/01/02","17000"),
	("TRA004","CUS003","EMP005","2005/02/10","2005/02/13","34000"),
	("TRA005","CUS005","EMP006","2005/02/10","2005/02/11","15000"),
	("TRA006","CUS006","EMP005","2005/03/02","2005/03/10","16699");

	/* INSERT DATA IN PRODUCT TRANSACTION DETAIL TABLE */
                            
insert into 
	transactiondetails(t_id,p_id,p_cost)
values
	("TRA001","PRD001","12670"),
	("TRA001","PRD009","6000"),
	("TRA001","PRD013","30000"),
	("TRA002","PRD004","9200"),
	("TRA002","PRD012","14500"),
    ("TRA002","PRD025","3000"),
	("TRA002","PRD018","8000"),
	("TRA003","PRD012","14500"),
	("TRA004","PRD005","10000"),
	("TRA004","PRD022","13000"),
    ("TRA005","PRD001","12670"),
	("TRA006","PRD010","10000"),
	("TRA006","PRD030","7899");

/* 			DESCRIBE & SHOWIND TABLE 	*/

	/*CUSTOMER MASTER*/

desc customermaster;
select * from customermaster;

	/*COMPANY MASTER*/

desc companymaster;
select * from companymaster;

	/*CATEGORY MASTER*/

desc categorymaster;
select * from categorymaster;

	/*SCHEME MASTER*/

desc schememaster;
select * from schememaster;

	/*EMPLOYEE MASTER*/

desc employeemaster;
select * from employeemaster;

	/*PRODUCT MASTER*/

desc productmaster;
select * from productmaster;

	/*TRANSACTION MASTER*/

desc transactionmaster;
select * from transactionmaster;

	/*TRANSACTION DETAILS*/

desc transactiondetails;
select * from transactiondetails;	




/*
---------------------------------------------------------------------------------------------
OUTPUT :
					
							CUSTOMER MASTER
                            
c_id	c_name				co_name				c_address															c_telephone

CUS001	Smita Vane			NULL				B6 , Rane Nagar , Near Nalasopara , Police Station , Nalasopara(E)	28888888
CUS002	NULL				Silicon Chip Tech	A5 , Jay Chambers , Nanda Patkar Road , VileParle(E)				26124533
CUS003	Chayya Bhankar		NULL				A55 , BaseRoad , Thane												28675590
CUS004	Anil Sahu			NULL				C3 , Pooja Building , Near Nanda Patkar Road , VileParle(E)			28001188
CUS005	Sanjyot Kurmure		NULL				A4 , Sector17 , Vashi												28907669
CUS006	Vaishali Shah		NULL				7 , Makanji Mansion , Balgovinddas Road , Shivaji Park				28907269
CUS007	NULL				Puru Hsg. Soc		34 , Shahnaz Building , Near Station , Kurla(W)						28904523
CUS008	NULL				Uttam Stores		Near Shreyas Cinema , Ghatkopar(W)									23900059
CUS009	NULL				Sun Pvt Ltd.		235, Parel Village , Lower Parel									26490675
CUS010	Manisha Palashkar	NULL				C/O SST Hostel , Subhash Nagar , Bandra(E)							25677177
CUS011	NULL				Ghar Karobar		55 , Bharat Nagar , Bandra(E)										28906785
CUS012	Ivan Bayross		NULL				A5 , Jay Chambers , Nanda Patkar Road , VileParle(E)				26124533
				
							COMPANY MASTER
    
co_id	co_name		co_address																co_person			p_terms

CMP001	Godrej		Pirojshah Nagar															Sharanam Shah		Cash or Cheque
CMP002	Samsung		B1 , Near Onida House , Phase III , Mahakali Caves Road , Andheri(E)	Neha Deshmukh		Cash or Cheque
CMP003	Sony		S1 , Near Opera House , SandHurst Bridge , Charni Road					Rahul Raj			100% Advance Payment
CMP004	Philips		A3 , Sitara Chambers , Near MIG Club , Bandara(E)						John Candy			Only Cheque
				
	CATEGORY MASTER
                            
cat_id	cat_name    

CAT001	Refrigerator
CAT002	Washing Machine
CAT003	Air Conditionors
CAT004	Digital Cameras
CAT005	Television
	
	SCHEME MASTER

sch_id	sch_descri
    
SCH001	Buy One Take One Free
SCH002	50% Discount
SCh003	20% Discount
SCH004	One Bowl Free
SCH005	Two Glasses Free
	
    
							EMPLOYEE MASTER
    
e_id	e_name			e_designation		m_id
    
EMP001	Jack Rickson	Salesman			EMP005
EMP002	Priya Tendulkar	Receptionsist		EMP005
EMP003	Mark Backson	Assist Executive	EMP004
EMP004	Asama Rahman	Sales Exexcutive	EMP005
EMP005	John Martin		Manager				EMP008
EMP006	Ramesh Pillai	Accountant			EMP005
EMP007	Shashank Bhinde	Salesman			EMP004
EMP008	Jimmic Colenco	Managing Director	NULL
			
    
							PRODUCT MASTER

p_id	p_name								co_name	cat_id	sch_id	cost		qty
    
PR0001	Pentacool							CMP001	CAT001	SCH003	15000.00	22
PR0002	Cold Gold Infiniti					CMP001	CAT002	SCH003	12000.00	22
PR0003	Gold Cold Delux						CMP001	CAT001	SCH003	10000.00	22
PR0004	Superstar							CMP003	CAT001	SCH003	12000.00	18
PR0005	Champion							CMP004	CAT001	SCH002	14000.00	22
PR0006	Smooth White						CMP005	CAT001	SCH003	12000.00	12
PR0007	Bottom Mount Black					CMP002	CAT001	SCH002	15000.00	16
PR0008	Fully Automatic GDF 1301			CMP002	CAT002	SCH003	16000.00	32
PR0009	Fully Automatic GDF 901				CMP001	CAT002	SCH002	10000.00	22
PR0010	Semi Automatic GDS 707ELE			CMP001	CAT002	SCH003	11000.00	22
PR0011	Semi Automatic GDS 550				CMP001	CAT002	SCH002	14000.00	22
PR0012	Quadra Plus GDS 650 NT				CMP001	CAT002	SCH003	17000.00	34
PR0013	Quadra Plus 1201 NT					CMP001	CAT002	SCH001	13000.00	22
PR0014	DRUM Front Loading					CMP002	CAT002	SCH001	16000.00	22
PR0015	Fully Automatic Top Loading			CMP002	CAT005	SCH004	12000.00	22
PR0016	Semi Automatic						CMP002	CAT001	SCH005	13000.00	8
PR0017	Split AC 2T With Remote				CMP001	CAT003	SCH001	15000.00	22
PR0018	Split AC 1T With Remote				CMP003	CAT003	SCH002	13000.00	1
PR0019	Windows AC Electro Mechanic			CMP001	CAT003	SCH003	10000.00	22
PR0020	Windows AC With Remote				CMP001	CAT003	SCH003	13000.90	2
PR0021	ICS									CMP002	CAT007	SCH003	15000.50	5
PR0022	InstaChill							CMP002	CAT003	SCH001	20000.00	22
PR0023	Turbo Power							CMP002	CAT003	SCH003	22000.00	22
PR0024	CyberShot Enthusiast				CMP003	CAT003	SCH001	5000.00		22
PR0025	CyberShot Point&Shot				CMP003	CAT003	SCH002	5000.00		22
PR0026	Visual Voice Records				CMP003	CAT003	SCH001	4500.00		0
PR0027	Mavica								CMP004	CAT003	SCH002	1299.00		7
PR0028	XBR									CMP003	CAT004	SCH001	3500.00		100
PR0029	Tube TVS							CMP003	CAT005	SCH001	7540.00		12
PR0030	Projection TVS						CMP003	CAT005	SCH001	5699.00		72
PR0031	Flat Panel TVs						CMP003	CAT005	SCH001	12000.00	24
PR0032	HDTV TVs							CMP002	CAT005	SCH001	8900.80		22
PR0033	Location Free TVs					CMP001	CAT005	SCH001	10000.00	23
						
							TRANSACTION MASTER
    
t_id	c_id	e_id	t_date		d_date		amount

TRA001	CUS003	EMP006	2003-10-06	2003-10-10	38000.00
TRA002	CUS002	EMP004	2004-05-21	2005-06-01	47000.00
TRA003	CUS003	EMP004	2004-12-31	2005-01-02	17000.00
TRA004	CUS003	EMP005	2005-02-10	2005-02-13	34000.00
TRA005	CUS005	EMP006	2005-02-10	2005-02-11	15000.00
TRA006	CUS006	EMP005	2005-03-02	2005-03-10	16699.00
    
	TRANSACTION DETAILS

t_id	p_id	p_cost

TRA001	PRD001	12670.00
TRA001	PRD009	6000.00
TRA001	PRD013	30000.00
TRA002	PRD004	9200.00
TRA002	PRD012	14500.00
TRA002	PRD025	3000.00
TRA002	PRD018	8000.00
TRA003	PRD012	14500.00
TRA004	PRD005	10000.00
TRA004	PRD022	13000.00
TRA005	PRD001	12670.00
TRA006	PRD010	10000.00
TRA006	PRD030	7899.00

---------------------------------------------------------------------------------------------*/