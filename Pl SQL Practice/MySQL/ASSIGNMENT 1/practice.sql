create database prac;
use prac;
select now();
select sysdate();
/**/
select now(),+(47);
select now(),-(47);
/*page 301*/

select 2023-04-06 -(2005-19-02);
select now(),to_days(left(now(),10))date,from_days((left(now(),10))); 
select adddate(now(),365) as"adddate";
select subdate(now(),46) as "subdate";
select to_days(2000-02-19);
select subdate("2023-04-06",to_days("2005-02-19"));