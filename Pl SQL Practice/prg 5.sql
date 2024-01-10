create database temp;
use temp;

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
create procedure forCursor()
begin

	declare i,num int default 0;
    declare naame text(30) default '';
    declare result text(300) default '';
	
    declare dept_cur cursor for
    select dnum,dname from department;
    
    declare continue handler for not found set i = 1;
    
	open dept_cur;
		loop_label : loop
    
			fetch dept_cur into num,naame;
    
    
			if i = 1 then
				leave loop_label;
            end if;
			select concat(result,num,'    ',naame,'\n') into result;
            
		end loop loop_label;

	close dept_cur;

	select result1;

end..
delimiter ;

call forCursor();

set @var = 'Value Is 1';

select @var;

delete from department where dnum = 4;

/*

CREATE DEFINER=`root`@`localhost` TRIGGER `temp`.`department_BEFORE_INSERT` BEFORE INSERT ON `department` FOR EACH ROW
BEGIN

	set @var = 'Value Added';

END

CREATE DEFINER=`root`@`localhost` TRIGGER `temp`.`department_AFTER_INSERT` AFTER INSERT ON `department` FOR EACH ROW
BEGIN

	set @var = 'Value Added Now';

END

CREATE DEFINER=`root`@`localhost` TRIGGER `temp`.`department_BEFORE_UPDATE` BEFORE UPDATE ON `department` FOR EACH ROW
BEGIN

	set @var = 'Value Is 10';

END

CREATE DEFINER=`root`@`localhost` TRIGGER `temp`.`department_AFTER_UPDATE` AFTER UPDATE ON `department` FOR EACH ROW
BEGIN

	 set @var = 'Value Is 19';

END

CREATE DEFINER=`root`@`localhost` TRIGGER `temp`.`department_BEFORE_DELETE` BEFORE DELETE ON `department` FOR EACH ROW
BEGIN

	set @var = 'value Deleted Now';

END

CREATE DEFINER=`root`@`localhost` TRIGGER `temp`.`department_AFTER_DELETE` AFTER DELETE ON `department` FOR EACH ROW
BEGIN

	 set @var = 'Value Deleted';

END	*/