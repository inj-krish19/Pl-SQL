create database sessional1;
use sessional1;

create table Department(
	snum int,
    sid varchar(6)
    primary key,
    sname text(50)
    not null
);

insert into Department values
(1,'DPT001','Department Of Computer Science'),
(2,'DPT002','Department Of Animation'),
(3,'DPT003','Department Of Nursery'),
(4,'DPT004','Department Of Sports'),
(5,'DPT005','Department Of Management');

-- Question 1

drop procedure Q;

delimiter ..
create procedure Question1()
begin

	declare sql_plus int;
    select max(snum) into sql_plus from Department;
    select sql_plus;

end ..
delimiter ;

call Question1();

/* 
	
    Output : 
		
	sql_plus
	5						*/
    
delimiter ..
create procedure Question2()
begin

	

end..
delimiter ;
