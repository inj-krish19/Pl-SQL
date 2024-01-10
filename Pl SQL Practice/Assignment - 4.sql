create database nineteen;
use nineteen;

-- Pl / SQL BLOCKS

/*
create table Employee(
empno int, 
empname text(20), 
salary double(8,2), 
deptno int
);			*/

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

delimiter ..
create procedure GPBQuestion1(in number1 double(6,2) ,in number2 double(6,2))
begin

	select concat
    (
		'Addition Of ',				 number1 ,' And ', number2 ,' Is ', number1 + number2 ,
        '\nSubtraction Of ',		 number1 ,' And ', number2 ,' Is ', number1 - number2 ,
        '\nMultiplication Of ',		 number1 ,' And ', number2 ,' Is ', number1 * number2 ,
        '\nDivison Of ',			 number1 ,' And ', number2 ,' Is ', number1 / number2 
    ) as 'Result';
	

end ..
delimiter ;

call GPBQuestion1(9,2);

delimiter ..
create procedure GPBQuestion2(in rno int,in sub1 int,in sub2 int,in sub3 int)
begin

	declare total int default 0;
    declare percentage float default 0;
    declare grade char default '';
    
    set total = sub1 + sub2 + sub3;
    set percentage = total/3;

	if total >= 250 then
		set grade = 'A';
	elseif total < 125 then
		set grade = 'D';
	elseif total < 175 then
		set grade = 'C';
	elseif total < 250 then
		set grade = 'B';
	else 
		set grade = 'D';
    end if;

	select concat(	'Roll Number ',rno,'\n',
					'Total Is ',total,'\n',
					'Percentage Is ',percentage,'\n',
                    'Result Is ',total,'/300\n',
                    'Grade Is ',grade) as 'Result';

end ..
delimiter ;

call GPBQuestion2(47,40,20,40);


drop procedure GPBQuestion3;
delimiter ..
create procedure GPBQuestion3()
begin

	declare i,lmt int default 1;
    declare result text(200) default '';

	loop_label : loop
		
        if lmt > 10 then 
			leave loop_label;
		end if;
        
        select concat(result,i,'  ') into result;
        
        set i = i + 2;
        set lmt = lmt + 1;
        
    end loop loop_label;

	select result;

end ..
delimiter ;

call GPBQuestion3();

delimiter ..
create procedure GPBQuestion4()
begin

	declare i int default 0;
	declare result text(200) default '';

        while i < 10 do 
			
            if i = 2 or i = 3 or i = 5 or i = 7 then
				select concat(result,i,' ') into result;
            end if;
            
            set i = i + 1;
            
        end while;
        
        select concat(result,'Are Prime Number') into result;

	select result;

end ..
delimiter ;

call GPBQuestion4();

delimiter ..
create procedure GPBQuestion5(in n1 int,in n2 int,in n3 int)
begin

	declare minimum,maximum int default 0;
	declare result text(200) default '';
	
    if n1 > n2 then 
    
		if n1 > n3 then 
            set maximum = n1;
		else
            set maximum = n3;
        end if;
    
    else
    
		if n2 > n3 then 
            set maximum = n2;
		else
            set maximum = n3;
        end if;
    
    end if;
    
	
    
    if n1 < n2 then 
    
		if n1 < n3 then 
            set minimum = n1;
		else
            set minimum = n3;
        end if;
    
    else
    
		if n2 < n3 then 
            set minimum = n2;
		else
            set minimum = n3;
        end if;
    
    end if;


	select concat('Maximum Is ',maximum,
				'\nMinimum Is ',minimum) into result;
    
    select result;

end ..
delimiter ;

call GPBQuestion5(5,10,8);

create table Employee(
	eid int,
	ename text(30), 
	bsalary int,
    job text(20),
    dnum int
);

insert into Employee values 
(1,'Rahul',5000,'App Developer',3),
(2,'Mohit',2500,'Data Analysis',2),
(3,'Krish',7000,'Web Developer',1),
(4,'Dev',10000,'Manager',5),
(5,'Vishal',7500,'HR',4);

drop procedure GPBQuestion6;
delimiter ..
create procedure GPBQuestion6(in id int)
begin

	declare i,counter int default 0;
	declare naame text(30) default '';
	declare job text(20) default '';    
	declare result text(200) default '';

	declare emp_csr cursor for
    select ename,job from Employee
    where eid = id;

	declare continue handler for not found set i = 1;

	select count(*) from Employee where eid = id into counter;
    
    if counter = 0 then 
		select concat('No Employees With ID ',id) into result;
	else 
		select concat('EID ',id,' RECORDS : \n') into result;
        
        open emp_csr;
        
			loop_label : loop
        
				fetch emp_csr into naame,job;
                
                if i = 1 then 
					leave loop_label;
                end if;
                
				select concat(result,naame,'  ',job) into result;
            
            end loop loop_label;
            
        close emp_csr;
        
    end if;

	select result;

end ..
delimiter ;

call GPBQuestion6(6);

create table Customer(
	cid varchar(6),
    cname text(20),
    adress text(50),
    city text(15)
);

delimiter ..
create procedure GPBQuestion7(id text(6),naame text(20),adr text(50),ct text(15))
begin

	insert into Customer
    values(id,naame,adr,ct);

	select * from Customer;

end..
delimiter ;

call GPBQuestion7('CUS001','VISHAL','A/91,AHMEDABAD COLONY,BAPUNAGAR','AHMEDABAD');

select * from Customer;


-- CURSORS

delimiter ..
create procedure CRSQuestion1()
begin

	declare i,lmt,id,dn,salary int default 0;
	declare naame text(30) default ''; 
    declare result text(1000) default '';
    
    declare emp_csr cursor for
    select eid,ename,bsalary,dnum from Employee;
    
    select count(*) into lmt from Employee;
    
    open emp_csr;
    
		loop_label :loop 
        
			fetch emp_csr into id,naame,salary,dn;
            
            select concat(result,naame,' Employee Working In Department ',dn,' Earns Rs. ',salary,'\n') into result;
        
        end loop loop_label;
    
    close emp_csr;

	select result;

end..