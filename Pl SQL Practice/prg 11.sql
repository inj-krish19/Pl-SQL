create database fortrigger;
use fortrigger;


drop table cust;

create table cust(
	id int,
    sales_value int
    check (sales_value > 0)
);

-- truncate cust;
insert into cust(id,sales_value)
values
(101,1000),
(102,2000),
(103,3000),
(104,4000),
(105,5000),
(106,7000),
(107,12000),
(108,19000),
(109,42000),
(110,50000);

select * from cust;

-- a

delimiter ..
create trigger questionA before insert on cust for each row
BEGIN

	declare rowcount int;
	select COUNT(*)
	into rowcount
	from cust
	where id = new.id;
	
    if rowcount > 0 then
		update cust
		set sales_value =sales_value + new.sales_value
		where id = new.id;
	else
		insert into cust
		(id,sales_value)
		value(new.id,new.sales_value);
	end if;

end ..
delimiter ;



-- b
delimiter ..
create trigger questionB before update on cust for each row
BEGIN

	update cust 
    set sales_value = sales_value + (new.sales_value - old.sales_value)
    where id = new.id;

end..
delimiter ;

-- c

delimiter ..
create trigger questionC before delete on cust for each row
BEGIN

	update cust 
    set sales_value = sales_value - old.sales_value
    where id = old.id;

end ..
delimiter ;

insert into cust 
value
(105,90000);

select * from cust;

/* output A

before : 

id sales_value
101	1000
102	2000
103	3000
104	4000
105	5000
106	7000
107	12000
108	19000
109	42000
110	50000

after : 

id sales_value
101	1000
102	2000
103	3000
104	4000
105	5000
106	7000
107	12000
108	19000
109	42000
110	50000
105	90000

*/

update cust
set sales_value = 20000
where id = 108;

select * from cust;

/* output B :

before : 

id sales_value
101	1000
102	2000
103	3000
104	4000
105	5000
106	7000
107	12000
108	19000
109	42000
110	50000
105	90000

after : 

id sales_value
101	1000
102	2000
103	3000
104	4000
105	5000
106	7000
107	12000
108	20000
109	42000
110	50000
105	90000

*/


delete from cust 
where id = 110;

select * from cust;

/*

output C :

before : 

id sales_value
101	1000
102	2000
103	3000
104	4000
105	5000
106	7000
107	12000
108	20000
109	42000
110	50000
105	90000

after : 

id sales_value
101	1000
102	2000
103	3000
104	4000
105	5000
106	7000
107	12000
108	20000
109	42000
105	90000


*/