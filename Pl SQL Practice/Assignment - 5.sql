-- ------------------------	Pl / SQL  ----------------------------------------------------------------------------------------

create database plsql;
use plsql;

create table Student(
	sid varchar(6)
    primary key,
    sname text(50)
    not null,
    std int 
    not null check(std > 0),
    age int 
    not null check(age > 5)   
);

create table Employee(
	eid varchar(6)
    primary key,
    ename text(50)
    not null,
    join_date date 
    not null,
    salary float(8,2) 
    not null check(salary > 0)   
);

drop table Enrolled;

create table Enrolled(
	sid varchar(6),
    eid varchar(6),
    fees float(8,2),
    foreign key (sid) references Student(sid),
    foreign key (eid) references Employee(eid)
);

desc Student;
desc Employee;
desc Enrolled;

insert into Student values
('STD001','DHRUTI',10,16),
('STD002','KRISH',12,18),
('STD003','KHUSHI',3,7),
('STD004','HARSH',10,16),
('STD005','JAYDEEP',11,17),
('STD006','AESHA',2,6),
('STD007','DRASHTI',4,9),
('STD008','JAY',5,10);

insert into Employee values
('EMP001','RAHUL','1999-02-16',60000),
('EMP002','ALEX','2000-03-23',80000),
('EMP003','KISHOR','2003-11-02',57000),
('EMP004','MEET','2010-12-28',40000),
('EMP005','DEEP','2001-08-19',55000),
('EMP006','VIRENDRA','2000-05-06',36000),
('EMP007','CLAZY','2004-09-09',90000),
('EMP008','VIJAY','2005-05-15',100000);

insert into Enrolled values
('STD003','EMP002',2300), 
('STD005','EMP008',8000),
('STD004','EMP001',15000),
('STD001','EMP006',19000),
('STD002','EMP003',3000),
('STD008','EMP005',50000),
('STD006','EMP004',5000),
('STD007','EMP007',43000);

select * from Student;
select * from Employee;
select * from Enrolled;

-- just declaration error watched and 
-- syntax learned

delimiter ..
create procedure bad_cursor()
begin

-- declare c cursor for select * from Student;
-- declare i int;	

-- Error Code: 1337. Variable or condition declaration after cursor or handler declaration	

	declare cursor1 cursor for select sid from Student;

end ..
delimiter ;

call bad_cursor();


-- this for cursor you learned but not used to implement task
-- no data fetching happened

delimiter ..
create procedure cursor_demo(in temp varchar(6))
begin

	declare id varchar(6);
    declare c1 cursor for
    select sid from Student
    where sid = temp;

end ..
delimiter ;

call cursor_demo('STD005');

delimiter ..
create procedure temp(in tmp varchar(6))
begin 

	declare id varchar(6);
    declare tname text(50);
	declare c1 cursor for
		select sid,sname from Student
		where sid = tmp;

	declare lrow int default 1;

	set lrow = 0;
    open c1;
		
        loop1 : loop
			
            fetch c1 into id,tname;
            if sid = id then
				leave loop1;
			end if;
        
		end loop loop1;	        
	close c1;
	set lrow = 0;
    
end..
delimiter ;

delimiter ..
create procedure DataFetching1(in tmp varchar(6))
begin

	declare c1 cursor for
    select sid from Student;

	open c1;
		if Student.sid = tmp then
			select S.sid-- ,S.Sname,E.eid,E.salary,N.fees
			from Student S,Employee E,Enrolled N;
		end if;
    close c1;  
end..
delimiter ;

call DataFetching1('STD005');

delimiter ..
create procedure p1(in a int)
begin 
-- set a =  5;
    select a;
end..
delimiter ;

call p1(2);

delimiter ..
create procedure p2(out b int)
begin 
 set b =  5;
--   select b;
end..
delimiter ;

call p2(@b);
select @b;

delimiter  ..
create procedure p3(inout c int)
begin
	select c;
	set c = 19;
    select c;
end..
delimiter ;

set @c = 2;
call p3(@c);

delimiter ..
create procedure p4(in i int)
begin 
	if(mod(i,2) = 0) then 
		select "Its Even";
	else
		select "Its Odd";
	end if;
end ..
delimiter ;

call p4(8);

delimiter ..
create procedure p5(in i int)
begin 
	
    declare c1 cursor for 
	select i;
    
    open c1;
		loop_label : loop
			if(mod(i,2) = 0) then 
				select "Its Even";
			end if;
		end loop loop_label;
	close c1;
end ..
delimiter ;

call p5(4);

delimiter ..
create function Func (val int) returns text(20)
begin 
	
    declare str text(20) default 'I am String';
    
	return str;

end ..
delimiter ;
select Func(200);

DELIMITER //

CREATE FUNCTION CalcIncome ( starting_value INT )
RETURNS INT

BEGIN

   DECLARE income INT;

   SET income = 0;

   label1: WHILE income <= 3000 DO
     SET income = income + starting_value;
   END WHILE label1;

   RETURN income;

END; //

DELIMITER ;
SELECT CalcIncome (1000);

drop procedure ForIf;
delimiter ..
create procedure ForIf (in i int)
begin 

	if i = 0 then 
  		select 'Zero Is Not Even Or Odd';
	elseif mod(i,2) = 0 then 
		select 'Number Is Even';
	else 
		select 'Number Is Odd';
	end if;
    
end..
delimiter ;
call ForIf(7);

