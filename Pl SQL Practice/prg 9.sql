create database thirty;
use thirty;
select * from  Department;

create table Department(
	dnum int,
	dname varchar(30), 
	budget double ,
	managerid int
);

insert into Department values
(1,'Hardware',1048572.12,141582651),
(2,'Operations',12099101,287321212),
(3,'Legal',222988.13,248965255),
(4,'Marketing',538099.54,548977562),
(5,'Software',400011.12,141582651),
(6,'Production',12099101,578875478),
(7,'Shipping',5,489456522);

delimiter //
create procedure Question1()
begin

	declare sql_plus int;

    set sql_plus = 0;
    select max(dnum) into sql_plus from Department;
    select sql_plus;

end;
//
delimiter ;

call Question1();

/*	QUESTION 1

| sql_plus	|
|	7		|	*/

delimiter //
create procedure Question2()
begin

	declare sql_plus int;

    set sql_plus = 0;
    select max(dnum) into sql_plus from Department;

	select sql_plus;
    
    update Department 
    set dnum = sql_plus + 10
    where dnum = sql_plus;

	update Department 
    set dname = NULL
    where dname = sql_plus;

end;
//
delimiter ;

call Question2();

/*	
	update Department 
    set dnum = 7
    where dnum = 37;	*/

select * from Department;

alter table Department add location text(20);

/*	
	update Department 
	set location = "Indore"
	where dnum = 2;		*/

delimiter //
create procedure Question3(in num int,in loca text(20))
begin

	update Department 
    set location = "Patna"
    where dnum = num and location = loca;

end
//
delimiter ;

call Question3(6,"Pune");

select * from Department;

delimiter //
create procedure Question4()
begin

	declare sql_plus int;

    select max(dnum) into sql_plus from Department;

	delete from Department where dnum = sql_plus;

end
//
delimiter ;
call Question4();