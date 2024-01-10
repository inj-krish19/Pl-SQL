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

desc Department;

-- Question 1

delimiter ..

create procedure Question1()
begin

	declare sql_plus int;

    set sql_plus = 0;
    select max(dnum) into sql_plus from Department;
    select sql_plus;

end..

delimiter ;

call Question1();

/*	QUESTION 1

| sql_plus	|
|	7		|	*/

-- Question 2

delimiter ..

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

end..

delimiter ;

call Question2();

/*	
	update Department 
    set location = 'Pune'
    where dnum = 37;	*/

select * from Department;

alter table Department add location text(20);
	
	
    
    update Department 
	set location = "Lucknow"
	where dnum = 1;		
    
    update Department 
	set location = "Mumbai"
	where dnum = 2;		
    
    update Department 
	set location = "Ahmedabad"
	where dnum = 3;		
    
    update Department 
	set location = "Surat"
	where dnum = 4;		
    
    update Department 
	set location = "Delhi"
	where dnum = 5;		

	update Department 
	set location = "Pune"
	where dnum = 6;		

	update Department 
	set location = "Kolkata"
	where dnum = 7;		

-- Question 3

delimiter ..

create procedure Question3(in num int,in loca text(20))
begin

	update Department 
    set location = "Patna"
    where dnum = num and location = loca;

end..

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

delimiter ..

create procedure Question4()
begin

	declare sql_plus int;
    declare cnt int;

    select max(dnum) into sql_plus from Department;

    select count(dnum) into cnt from Department
    where dnum = sql_plus;

	delete from Department where dnum = sql_plus;

	select concat(cnt," Rows Affected") as "Result";

end..

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
(1,'Rahil',5000,'App Developer',3),
(2,'Mohit',2500,'Data Analysis',2),
(3,'Krish',7000,'Web Developer',1),
(4,'Dev',10000,'Manager',5),
(5,'Vishal',7500,'HR',4),
(6,'Rahul',1500,'App Developer',30);

select * from Employee;
    
    
-- Question 5

delimiter ..

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

end..

delimiter ;

call Question5();

select * from Employee;

-- Question 6

delimiter ..

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
    
end..

delimiter ; 

call Question6();

select * from Employee;

delimiter ..

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

end..

delimiter ;

call Question7();

select * from Employee;


drop procedure Question8;

delimiter ..

create procedure Question8(in dn int)
begin

	declare dept_count int default 0;
    declare avg_salary int default 0;
    declare str text(50) default '';
    
    select count(*) into dept_count from Department where dnum = dn;
    select avg(bsalary) into avg_salary from Employee;
    
    select dname from department where dnum = dn;
    select dept_count as 'Department Count',avg_salary as 'Average Salary';-- ,'No Employees Are Working In Department' as 'Result';

end..

delimiter ;

call Question8(1);

select * from  Department;

select * from  Employee;

delimiter ..

create procedure Question9(in en int)
begin

	declare average int default 0;

	select avg(bsalary) into average from Employee where eid = en;

	select concat('Average Of Employee Whose Department Numnber ',en,' Is ',average) as 'Result' from Employee where en = dnum;

	select 'Employee Have Same Salary As Average Salary' as 'Result';

end..

delimiter ;

call Question9(2);

delimiter ..

create procedure Question10(in temp text(20))
begin

	select concat('Deleting Row Of Job ',temp) as 'Result';
	delete from Employee where job = temp;

end..

delimiter ;

call Question10('App Developer');

set @cnt = 0;

delimiter ..

create procedure Question11(in temp text(20),out cnt int)
begin

	select concat('Deleting Row Of Job ',temp) as 'Result';
    select count(*) into cnt from Employee where job = temp;
 	delete from Employee where job = temp;

end..

delimiter ;

call Question11('App Developer',@cnt);

select concat(@cnt,' Rows Are Deleted') as 'Answer';

set @cnt = 0;

delimiter ..

create function Question12(temp text(20)) returns int(11)
begin
    
    select count(*) into @cnt from Employee where job = temp;
    delete from Employee where job = temp;
    return @cnt;

end..

delimiter ;

select concat(Question12('App Developer'),' Rows Are Deleted') as 'Answer';


create table Accounts(
	Account_id varchar(6), 
	branch_name text(20),
	amount_balance int
);  

truncate table Accounts;

insert into Accounts
values
('ACN001','SHAHIBAG',50000),
('ACN002','NAVARANGPURA',30000),
('ACN003','NAROL',100000),
('ACN004','THGALTEJ',75000),
('ACN005','GOTA',1020);

select * from Accounts;

delimiter ..

create procedure Question13A(in aid varchar(6),in withdraw int)
begin

 	declare amount int default 0;
    
    select amount_balance into amount from Accounts where Account_id = aid;
    
    if withdraw > amount then
		select concat('Account Balance Of ',aid,'Is Less Than ',amount);
	else
		update Accounts
		set amount_balance = amount_balance - amount
        where Account_id = aid;
		
        select concat('Account Balance Of ',aid,'Is Updated') as 'Answer Of 13A';
    end if;

end..

delimiter ;

call Question13A('ACN001',2000);

delimiter ..

create procedure Question13B(in aid varchar(6),in deposit int)
begin

 	declare amount int default 0;
    
    select amount_balance into amount from Accounts where Account_id = aid;
    
    if deposit > 0 then
		select concat('Account Balance Of ',aid,'Is Less Than 0') as 'Answer Of 13B';
	else
		update Accounts
		set amount_balance = amount_balance + amount
        where Account_id = aid;
		
        update Accounts
		set amount = amount_balance
        where Account_id = aid; 
        
        select concat('Account Balance Of ',aid,'Is Updated To ',amount) as 'Answer Of 13B';
    end if;

end..

delimiter ;

call Question13B('ACN001',2000);

drop procedure Question13c;

delimiter ..

create procedure Question13C(in sender varchar(6),in receiver varchar(6))
begin

 	declare sendersAmmount int default 0;
    declare receiversAmmount int default 0;
    
    select amount_balance into sendersAmmount from Accounts where Account_id = sender;
    select amount_balance into receiversAmmount from Accounts where Account_id = receiver;
    
	update Accounts
	set amount_balance = receiversAmmount
    where Account_id = sender;
		
    update Accounts
	set amount_balance = sendersAmmount
	where Account_id = receiver; 
        
        select concat('Account Balance Of ',sender,'Is Updated To ',sendersAmmount)  as 'Answer Of 13C';

end..

delimiter ;

call Question13C('ACN001','ACN005');


create table Retired_employee(
empno int,
ename varchar(30),  
hiredate date, 
leaveDate date, 
salary int, 
mgr_id varchar(6), 
deptno int
);
drop table Retired_employee;

delimiter ..

create procedure Question14(
	eno int,
	enam varchar(30),  
	hire date, 
	sal int, 
	manager int, 
	dno int				)
begin

	insert into Retired_employee
    values
    (eno,enam,hire,date(curdate()),sal,manager,dno);

end..

delimiter ;

call Question14(1,'RAJU','2015-05-25',70000,34128964,3);

select * from Retired_employee; 

delimiter ..

create procedure Question15()
begin

	declare lmt,grade int;
	declare empcnt,cnt1,cnt2,cnt3,cnt4,cnt5
    int default 0;
    declare result text(250) default '';
	
    select count(*) into lmt from Employee;
    
    -- select lmt;
    
    loop_label_for_display : loop 

		select sgrade into grade from Employee where eid = empcnt;

		case grade 
			when 1 then 
				set cnt1 = cnt1 + 1;
			when 2 then 
				set cnt2 = cnt2 + 1;
			when 3 then 
				set cnt3 = cnt3 + 1;
			when 4 then 
				set cnt4 = cnt4 + 1;
			when 5 then 
				set cnt5 = cnt5 + 1;
			else 
				select concat(result,'') into result;
        end case;

		if empcnt = lmt then 
			leave loop_label_for_display;
        end if;
    
		set empcnt = empcnt + 1;
    
    end loop loop_label_for_display;
    
    select concat('Number Of Employees With Grade 1 Are ',cnt1,'\n',
				  'Number Of Employees With Grade 2 Are ',cnt2,'\n',
                  'Number Of Employees With Grade 3 Are ',cnt3,'\n',
                  'Number Of Employees With Grade 4 Are ',cnt4,'\n',
                  'Number Of Employees With Grade 5 Are ',cnt5,'\n'
				) into result;
	
    
    select result;

end..

delimiter ;

call Question15();

select * from Employee;

delimiter ..

create procedure Question16()
begin

	declare sal,i,empid int default 0;
	declare cemp cursor for
    select eid from employee;
    
	declare continue handler for not found set i=1;

	open cemp;
    
		emp_loop : loop
			
            fetch cemp into empid;
		
			update Employee
            set netsalary = (netsalary) + (netsalary * 0.15) 
			where eid = empid;
        
			if i = 1 then
				leave emp_loop;
			end if;
            
		end loop emp_loop;
    
    close cemp;

end..

delimiter ;

call Question16();

desc employee;

drop procedure Question17;

delimiter ..

create procedure Question17()
begin

	declare i int default 0;
    
    declare salary int default 0;
    declare empid,minimum,maximum int default 0;
    declare ejob text(20) default '';
    declare result text(300) default '';
    
    declare eemp cursor for 
    select eid,job from Employee
    where sgrade = 5;
    
    declare continue handler for not found set i = 1;

	open eemp;
    
		emp_loop : loop
			
       --     fetch eemp into empid,ejob,salary;
            fetch eemp into empid,ejob;
            
            
            if i = 1 then
				leave emp_loop;
			end if;
            
            select concat(result,'\nEmployee Id ',empid , ' Have Job ',ejob) into result;
            
        end loop emp_loop;
    
    close eemp;

	select min(netsalary) into minimum from Employee where sgrade = 5;
    select max(netsalary) into maximum from Employee where sgrade = 5;
    
	-- 	select min(salary) into minimum from eemp;
	-- 	select max(salary) into maximum from eemp;

	select concat(result,'\n\nMinimum Salary Of All Employee Who Have Grade 5 Is ',minimum
						 ,'\nMaximum Salary Of All Employee Who Have Grade 5 Is ',maximum
                    ) into result;

	select result;

end..

delimiter ;

call Question17();


create table old_dept(
	dnum int,
	dname text(30), 
	budget double ,
	managerid int
);

delimiter ..

create procedure Question18()
begin

	declare cnt,i int default 0;
    declare dn,mgrid int default 0;
    declare dna text(30);
    declare amount double;
    
    
    declare odep cursor for
    select dnum,dname,budget,managerid
    from department;
    
    declare continue handler for not found set i = 1;

	open odep;
    
		loop_label : while i = 0 do
        
        fetch odep into dn,dna,amount,mgrid;
        
            if i = 1 then 
				leave loop_label;
			end if;
    
			insert into old_dept(dnum,dname,budget,managerid)
            values (dn,dna,amount,mgrid);
        
			set cnt = cnt + 1;
        
         end while loop_label;
        
	close odep;

	select concat(cnt,' Rows Are Added') as 'Result';

end..

delimiter ;

call Question18();

drop table old_dept;

truncate old_dept;

select * from old_dept;


delimiter ..

create procedure Question19()
begin

	declare i int default 0;
	declare label text(20) default ' ';
    declare result text(200) default 'All The Employees Who Are Working In Department Number 30 Is';

	declare displayData cursor for 
    select ename from Employee where dnum = 30;

	declare continue handler for not found set i = 1;

	open displayData;
    
		loop_label : loop
			
            fetch displayData into label;
            
            if i = 1 then 
				leave loop_label;
			end if;
            
            select concat(result,' ',label) into result;
            
        end loop loop_label;
    
    close displayData;

	select result;

end..

delimiter ;

call Question19();

select * from Department;

delimiter ..

create procedure Question20()
begin

	declare i,dn,mgrid int default 0;
    declare amount int default 0;
    declare dnam,loca text(20) default '';
	declare result text(3000) default 'dnum\t\tdname\t\tbudget\t\tmanagerid\t\tlocation\n';

	declare copyDept cursor for
    select * from Department;
    
    declare continue handler for not found set i = 1;
    
    open copyDept;
    
    
		loop_label : loop
        
			fetch copyDept into dn,dnam,amount,mgrid,loca;
            
              if i = 1 then 
				leave loop_label;
			end if;
            
            select concat(result,'\n',dn,'\t\t',dnam,'\t\t',amount,'\t\t',mgrid,'\t\t',loca) into result;
        
        end loop loop_label;
    
    close copyDept;

	select result;

end..

delimiter ;

call Question20();

delimiter ..

create procedure Question21()
begin

	declare i,salary int default 0;
    declare namme text(20);
    declare result text(200) default 'Data Of 6 Employees \n'; 
    
    declare sixEmpData cursor for
	select ename,netsalary from Employee limit 6;

	declare continue handler for not found set i = 1;

	-- select result;

	open sixEmpData;
    
		loop_label : loop
        
			fetch sixEmpData into namme,salary;
            
            if i = 1 then 
				leave loop_label;
			end if;
        
			-- select concat(namme,salary);
			select concat(result,namme,'   ',salary,'\n') into result;
        
        end loop loop_label;
    
    close sixEmpData;

	select result;

end..

delimiter ;

call Question21();

drop procedure Question21;

alter table Employee add hiredate date; 

select * from Employee;
 
    
    update Employee
	set hiredate = '2002-02-12'
	where eid = 1;		
    
    update Employee
	set hiredate = '2000-09-10'
	where eid = 2;			
    
   update Employee
	set hiredate = '2010-03-08'
	where eid = 3;		
    
    update Employee
	set hiredate = '2007-05-05'
	where eid = 4;		
    
	update Employee
	set hiredate = '2003-11-25'
	where eid = 5;	

	update Employee
	set hiredate = '2007-07-02'
	where eid = 10;		

delimiter ..

create procedure Question22()
begin

	declare i,dn int default 0;
    declare label text(20) default '';
    
    declare csrDept cursor for
    select dnum,dname from Department;
    
    declare continue handler for not found set i = 1;
    
    open csrDept;
    
		loop1 : loop
        
			fetch csrDept into dn,label;
            
            if i = 1 then 
				leave loop1;
			end if;
            
            call subProcedure(dn,label);
        
        end loop loop1;
    
    close csrDept;

end..

delimiter ;

delimiter ..

create procedure subProcedure(in dn int,in dname text(20))
begin

	declare j,salary int default 0;
    declare namme,job text(20) default '';
    declare hdate date default curdate();
    
    declare result text(200) default '';
    
    declare csrEmp cursor for 
    select ename,job,hiredate,bsalary 
    from Employee where dnum = dn;
    
    declare continue handler for not found set j = 1;
    
    select concat(result,'Department Number ',dn,' Data Have Employee\n') into result;
    
    open csrEmp;
    
		loop2 : loop
        
			fetch csrEmp into namme,job,hdate,salary;
            
            if j = 1 then 
				leave loop2;
			end if;
            
            select concat(result,namme,' ',job,' ',hdate,' ',salary,'\n') into result;
        
        end loop loop2;
    
    close csrEmp;

	select result;

end..

delimiter ;

call Question22();

delimiter ..

create procedure Question23(in dno int,in raise int)
begin

	call RaiseSalary(dno,raise);

end..

delimiter ;

delimiter ..

create procedure RaiseSalary(in deptno int,in raise int)
begin

	declare i,id,dn,salary int default 0;
	declare csrEmp cursor for
    select eid,dnum,netsalary from Employee;

	declare continue handler for not found set i = 1;

	open csrEmp;
    
		temp : loop
    
			fetch csrEmp into id,dn,salary;
    
			if i = 1 then 
				leave temp;
			end if;
    
			update Employee
            set netsalary = netsalary + netsalary * (raise/100)
            where dnum = deptno;
    
		end loop temp;
    
    close csrEmp;

	select 'If Record Found Then Updated' as 'Result';

end..

delimiter ;

call Question23(3,10);

update Employee
set netsalary = 10000
where dnum = 3;

select * from Employee;

drop procedure RaiseSalary;