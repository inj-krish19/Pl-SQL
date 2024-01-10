create database temp;
use temp;

delimiter $$
create procedure example(

)
begin

	declare 
		var int;
	set var = 10;
    
    select var;

end $$

call example(); $$

-- exe 3.3

delimiter ..

create procedure getData(
		in data int 
)
begin

	set @p_in = 5;
    
    select data;
end ..

call getData(@p_in); ..

-- exe 3.4

delimiter ..
create procedure putData(
	out p_out int 
)
begin 

	select p_out,'We can''t see the value of the OUT parameter';
    
    set p_out=2;
	select p_out,'OUT parameter value has been changed';

end ..
call putData(@p_out); ..

 
-- exe 3.5

delimiter ..
create procedure getputData(
	inout p_inout int
)
begin 
 
	select p_inout,'We can see the value of the INOUT parameter in the stored program';
	SET p_inout=2;
	select p_inout,'INOUT parameter value has been changed';

end..

set @p_inout = 1; ..
call getputData(@p_inoput); ..

-- exe 3.6
delimiter ..

create procedure basic(
	x varchar(50),
    y varchar(100),
    z int
)
begin
	select 'Hello World' into @x ;
	select @x;
	set @y='Goodbye Cruel World';
	select @y;
	set@z=1+2+3;
	select @z;
 end..
 
call basic(@x,@y,@z); ..

-- exe 3.7

delimiter ..
CREATE PROCEDURE GreetWorld( )
begin

	SELECT CONCAT(@greeting,' World');

end ..

set @greeting = "Hello"; ..
call GreetWorld(); ..

-- exe 3.8

delimiter ..
CREATE PROCEDURE p1( )
begin

 SET @last_procedure='p1';

end ..

delimiter ..
create procedure p2()
begin
	select concat('Last procedure was ',@last_procedure);
end ..

call p1(); .. 
call p2(); ..

-- exe 3.9

delimiter ..
CREATE PROCEDURE comment_demo(
 IN p_input_parameter INT -- Dummy parameter to illustrate styles
 )
 begin 
 /*
| Program: comment_demo
| Purpose: demonstrate comment styles
| Author: Guy Harrison
| Change History:
| 2005-09-21 - Initial
|
*/
 
 end ..
call comment_demo(19);..

-- exe 3.10

delimiter ..
create procedure operators( )
begin
	declare a int default 2;
	declare b int default 3;
	declare c float;


	set c=a+b; select 'a+b=',c; 
	set c=a/b; select 'a/b=',c;
	set c=a*b; select 'a*b=',c;

	if (a<b) then
		select 'a is less than b';
	end if; 
	if not (a=b) then
		select 'a is not equal to b';
	end if;
end ..

call operators(); ..

-- exe 3.11

delimiter ..
create function f_title(in_gender char(1),
 in_age int, in_marital_status varchar(7))
returns varchar(6)
begin
	
    declare title varchar(6);
		
        if in_gender='F' and in_age<16 then
			SET title='Miss';
		elseif in_gender='F' and in_age>=16 
		and in_marital_status='Married' then
			set title='Mrs';
		elseif in_gender='F' and in_age>=16 
        and in_marital_status='Single' then
			set title='Ms';
		elseif in_gender='M' and in_age<16 then
			set title='Master';
		elseif in_gender='M'and in_age>=16 then
			set title='Mr';
		end if;
return (title);
end ..

call f_title();..

-- exe 3.12
delimiter ..
create procedure t()
begin

	declare Myvariable_name int;
    declare PI float default 3.14159;
    declare MyVar char(1);
	
    set Myvariable_name = 4.20;
    set Myvariable_name = Myvariable_name + 1;
    set MyVar = 'M';
	
    select ABS(Myvariable_name);

	select if(MyVar ='M','Male','Female');
	select (2+4)/12;

end ..

call t();

-- exe 3.13 

delimiter ..
create procedure functions( )
begin 
	declare a int default 2;
	declare b int default 3;
	declare c float;
 
	set c=SUM(a);
    select c;
end..
call functions();

-- exe 3.14 


delimiter $$
create procedure function_example( )
begin
	 declare TwentyYearsAgoToday date;
	 declare mystring varchar(250);
     
	 set TwentyYearsAgoToday=date_sub(curdate( ), interval 20 year);
	 set mystring=concat('It was ',TwentyYearsAgoToday,
						' Sgt Pepper taught the band to play...');
 
select mystring;
	if (cast(substr(version( ),1,3) as decimal(2,1)) <5.0) then
		select 'MySQL versions earlier than 5.0 cannot 
				run stored programs - you
				must be hallucinating';
		else
			select  'Thank goodness you are running 5.0 or higher!';
	end if;
end$$

call function_example( )$$