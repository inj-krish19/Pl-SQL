create database db1;
use db1;
create table companymaster6(
c_id int(6)
primary key auto_increment ,
c_name varchar(25)
not null,
c_roll_no int,
c_address varchar(75)
not null,
c_person varchar(25)
not null,
p_terms varchar(25)
not null,
check (c_roll_no<3)
);
insert into 
	companymaster6(c_name,c_roll_no,c_address,c_person,p_terms)
values
("Godrej",1,"Pirojshah Nagar","Sharanam Shah","Cash or Cheque"),
("Samsung",2,"B1 , Near Onida House , Phase III , Mahakali Caves Road , Andheri(E)","Neha Deshmukh","Cash or Cheque"),
("Sony",3,"S1 , Near Opera House , SandHurst Bridge , Charni Road","Rahul Raj","100% Advance Payment"),
("Philips",4,"A3 , Sitara Chambers , Near MIG Club , Bandara(E)","John Candy","Only Cheque");
desc companymaster;
select * from companymaster4;
update companymaster set c_name = "Sony" where c_id="CMP001";
select avg(c_id) from companymaster1;
select * from companymaster6 order by c_name ;
/*
update
max
min
avg
sum
desc(descending)
check
auto_increment
order by