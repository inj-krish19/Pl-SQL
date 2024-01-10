create table Student
(Roll int primary key,
Subject_hindi real, 
Subject_socialscience real,
Subject_maths real);


insert into Student values
(1,85.6,90.2,99.9);


-- 1) WAP to input two numbers and find out what is the output of all arithmetic operations.
-- (Addition, Subtraction, Multiplication, Division etc.)

create database gen;
use gen;

SET @INPUTE1 = 20;
SET @INPUTE2 = 5;


delimiter //
create procedure g1(inout INPUTE1 int ,inout INPUTE2 int )
begin
	declare  AD int default 0;
    declare MUL int default 0;
    declare SUB real default 0;
    declare DI real default 0;

    set AD =  INPUTE1 + INPUTE2;
    set SUB =  INPUTE1 - INPUTE2;
    set MUL =  INPUTE1 * INPUTE2;
    set DI =  INPUTE1 / INPUTE2;
     
    select " ADDITION :" ,AD, " SUBTRACTION :", SUB," MULTIPLICATION :",MUL,"DIVITION :",DI;
END
//
delimiter ;

call g1(@INPUTE1,@INPUTE2);



-- 2) WAP to input rollno and three subject marks. Find out total, percentage, result and
-- grade for the student from the entered data.

SET @Roll = 1;
SET @Subject_socialscience = 87.7;
SET @Subject_hindi = 58.2;
set @Subject_maths =90.9;


call ggg2(@Roll,@Subject_socialscience,@Subject_hindi,@Subject_maths);



