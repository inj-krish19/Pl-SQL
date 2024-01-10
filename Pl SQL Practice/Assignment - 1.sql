create database thirty;
use thirty;
select * from  Department;

create table Department(
	dnum int,
	dname varchar(30), 
	budget double ,
	managerid int
);

truncate table Department;

insert into Department values
(1,'Hardware',1048572.12,141582651),
(2,'Operations',12099101,287321212),
(3,'Legal',222988.13,248965255),
(4,'Marketing',538099.54,548977562),
(5,'Software',400011.12,141582651),
(6,'Production',12099101,578875478),
(7,'Shipping',5,489456522);

-- Question 1

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

-- Question 2

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
	set location = "Pune"
	where dnum = 6;		*/

-- Question 3

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

/*
		BEFORE :

	dnum	dname		budget		managerid	location
	1		Hardware	1048572.12	141582651	Ahmedabad
	2		Operations	12099101	287321212	Mumbai
	3		Legal		222988.13	248965255	Jaipur
	4		Marketing	538099.54	548977562	Delhi
	5		Software	400011.12	141582651	Gandhinagar
	6		Production	12099101	578875478	Pune
	17		Shipping	5			489456522	Indoere


			AFTER :

	dnum	dname		budget		managerid	location
	1		Hardware	1048572.12	141582651	Ahmedabad
	2		Operations	12099101	287321212	Mumbai
	3		Legal		222988.13	248965255	Jaipur
	4		Marketing	538099.54	548977562	Delhi
	5		Software	400011.12	141582651	Gandhinagar
	6		Production	12099101	578875478	Patan
	17		Shipping	5			489456522	Indoere
*/

drop procedure Question4;

-- Question 4

delimiter //
create procedure Question4()
begin

	declare sql_plus int;
    declare cnt int;

    select max(dnum) into sql_plus from Department;

    select count(dnum) into cnt from Department
    where dnum = sql_plus;

	delete from Department where dnum = sql_plus;

	select concat(cnt," Rows Affected") as "Result";

end
//
delimiter ;
call Question4();

/*

	Result
	1 Rows Affected			*/

drop table Employee;

create table Employee(
	eid int,
	ename varchar(30), 
	bsalary int,
   	hr int,
	da int,
    pf int,
	netsalary double ,
	bonus int,
    sgrade int,
    job text(20),
    dnum int
);

insert into Employee(
	eid,	ename, 
	bsalary,job,dnum 
)	values 
(1,'Rahul',5000,'App Developer',3),
(2,'Mohit',2500,'Data Analysis',2),
(3,'Krish',7000,'Web Developer',1),
(4,'Dev',10000,'Manager',5),
(5,'Vishal',7500,'HR',4);

select * from Employee;
    
    
-- Question 5

delimiter //
create procedure Question5()
begin 

	declare lmt int;
	declare cnt int default 0;
	declare temp int default 0;
    
	update Employee
	set hr = bsalary * 0.31;
    
    update Employee
	set da = bsalary * 0.15;
	
    select count(*) into lmt from Employee;
    
    -- select lmt;
    
    loop_label : loop 

	select bsalary into temp from Employee where eid = cnt;

		if temp < 3000 then 
			
            update Employee 
			set pf = bsalary * 0.05
			where bsalary <= 3000;
		
        elseif temp > 3000 and temp <= 5000 then
		
			update Employee 
			set pf = bsalary * 0.07
			where bsalary > 3000 and bsalary <= 5000;
            
		elseif temp > 5000 and temp <= 8000 then
        
			update Employee 
			set pf = bsalary * 0.08
			where bsalary > 5000 and bsalary <= 8000;
		
        else 
		
			update Employee 
			set pf = bsalary * 0.1
			where bsalary > 8000;
        
        end if;

		if cnt = lmt then 
			leave loop_label;
        end if;
    
		set cnt = cnt + 1;
    
    end loop loop_label;

	update Employee
    set netsalary = bsalary + hr + da - pf ;

end
//
delimiter ;

call Question5();

select * from Employee;

-- Question 6

delimiter //
create procedure Question6()
begin 

	declare lmt int;
	declare cnt int default 0;
	declare temp int default 0;
    declare grade int default 0;
    declare result text(250) default '';
	
    select count(*) into lmt from Employee;
    
    -- select lmt;
    
    loop_label_for_sgrade : loop 

	select bsalary into temp from Employee where eid = cnt;

		if temp < 3000 then 
			update Employee 
			set sgrade = 1
			where bsalary <= 3000;
		
        elseif temp > 3000 and temp <= 5000 then
		
			update Employee 
			set sgrade = 2
			where bsalary > 3000 and bsalary <= 5000;
            
		elseif temp > 5000 and temp <= 7000 then
        
			update Employee 
			set sgrade = 3
			where bsalary > 5000 and bsalary <= 7000;
		
        elseif temp > 7000 and temp <= 9000 then 
		
			update Employee 
			set sgrade = 4
			where bsalary > 7000 and bsalary <= 9000;
        
        else
		
			update Employee 
			set sgrade = 5
			where bsalary > 9000;
        
        end if;

		if cnt = lmt then 
			leave loop_label_for_sgrade;
        end if;
    
		set cnt = cnt + 1;
    
    end loop loop_label_for_sgrade;
    
    set cnt = 0;
    
    loop_label_for_display : loop 

		select sgrade into grade from Employee where eid = cnt;

		case grade 
			when 1 then 
				select concat(result,'Employee ',cnt,' Is Junior Student\n') into result;
			when 2 then 
				select concat(result,'Employee ',cnt,' Is Engineer\n') into result;
			when 3 then 
				select concat(result,'Employee ',cnt,' Is Lead Engineer\n') into result;
			when 4 then 
				select concat(result,'Employee ',cnt,' Is Manager\n') into result;
			when 5 then 
				select concat(result,'Employee ',cnt,' Is Project Manager\n') into result;
			else 
				select concat(result,'') into result;
        end case;
	

		if cnt = lmt then 
			leave loop_label_for_display;
        end if;
    
		set cnt = cnt + 1;
    
    end loop loop_label_for_display;
    
    select result;
    
end
//
delimiter ; 

call Question6();

select * from Employee;

delimiter //
create procedure Question7()
begin

	declare lmt int default 0;
	declare temp int default 1;
    declare bns int default 0;
    declare result text(250) default '';
        
    select count(*) into lmt from Employee;
    
    update Employee
    set bonus = 0;
    
    update Employee
    set bonus = bsalary * 0.15
    where ( netsalary - bsalary ) > 2000;
    
    loop_label : loop 

		select bonus into bns from Employee where eid = temp;

		if bns = 0 then
			select concat(result,'Employee ',temp,' Does Not Earn Commision\n') into result;
        end if;
        
        if temp = lmt then
			leave loop_label;
        end if;
        
        set temp = temp + 1;
        
	end loop loop_label;
    
    select result;

end
//
delimiter ;
call Question7();

select * from Employee;

delimiter //
create procedure Question8()
begin

	declare dept_count int default 0;
    declare avg_salary int default 0;
    declare str text(50) default '';
    
    select count(*) into dept_count from Department;
    select avg(bsalary) into avg_salary from Employee;
    
    select dept_count as 'Department Count',avg_salary as 'Average Salary';-- ,'No Employees Are Working In Department' as 'Result';

end
//
delimiter ;

call Question8(1);

select * from  Department;

select * from  Employee;

delimiter //
create procedure Question9()
begin

	declare average int default 0;

	select avg(bsalary) into average from Employee where eid = en;

	select concat('Average Of Employee Whose Department Numnber ',en,' Is ',average) as 'Result' from Employee where en = dnum;

	select 'Employee Have Same Salary As Average Salary' as 'Result';

end
//
delimiter ;
call Question9(2);