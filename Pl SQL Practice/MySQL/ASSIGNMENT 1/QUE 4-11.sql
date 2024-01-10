create database HRMS;
show databases;
use HRMS;
/* For 4,5,6 we need admin login so can't do without it
after that exersice 7 */
create table Client(
ClntID varchar(6)
unique key,
ClntName varchar(35)
not null,
ClntUrl varchar(50)
default "www.google.com",
ClntDesc varchar(255)
not null
);
insert into 
	Client(ClntID,ClntName,ClntUrl,ClntDesc)
values
	("CLT001","SCT India","","Software Package Firm"),
    ("CLT002","ABCL Corp","","Dealer in Kitchen Utensils"),
    ("CLT003","Dell Corp","","Dealer in Computer Periphels"),
    ("CLT004","Essenpross","","Dealer in Electronics");
	