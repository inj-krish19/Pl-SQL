use db;
create table practice(
sr_no int(2)
auto_increment
primary key,
id varchar(6),
name text(25),
city varchar(10),
pincode varchar(6)
);
create table ch(
c_id int(6)
primary key auto_increment ,
c_name varchar(25)
not null,
c_roll_no int,
check (c_roll_no<3)
);
insert into practice
	(id,name,city,pincode)
values
	("MCS101","VISHAL","DELHI","256789"),
    ("MCS112","MOHIT","SURAT","638765"),
    ("MCS147","KRISH","AHMEDABAD","382481"),
    ("MCS105","MOHIT","MUMBAI","423784"),
    ("MCS125","DEV","BANGLORE","746823");
desc practice;
select * from practice;
update practice
set city="KARACHI"
where sr_no = 3;
select max(sr_no) from practice; 
select min(sr_no) from practice;
select avg(sr_no) from practice;
select sum(sr_no) from practice;
select * from practice order by id desc;
select * from practice order by id asc;
insert into 
	ch(c_name,c_roll_no)
values
	("kshd",1),
    ("kjshd",1),
	("kjsd",1);
select now();
select system_user();
select sysdate();
select now(),+(47);
select 2023-13-04 - (2005-19-02);
select now(),to_days(left(now(),10))date,from_days((left(now(),10))); 
select adddate(now(),365) as"adddate";
select subdate(now(),46) as "subdate";
select to_days(2000-02-19);
select subdate("2023-04-06",to_days("2005-02-19"));
select p_name,p_id2 from prac1 A,prac2 B where A.p_ID = B .p_id;
alter table prac2 change p_name,p_name2 varchar(10);