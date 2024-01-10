create database assign13;
use assign13;
create table flights(
flno int primary key,
fromm varchar(50),
too varchar(50),
distance int,
departs datetime,
arrives datetime,
price int);
-- drop table flights;

create table aircraft
( aid int primary key,
aname varchar(30),
cru int);

create table employees
(eid  int primary key,
ename varchar(30),
salary int);

create table certified(
eid int ,
aid int,
foreign key (eid) references employees(eid),
foreign key (aid) references aircraft(aid));


insert into flights values
(99,'Los Angeles','Washington D.C.',2308,'2005-04-12 09:30','2005-04-12 21:40',235.98),
(13,'Los Angeles','Chicago',1749,'2005-04-12 08:45','2005-04-12 20:45',220.98),
(346,'Los Angeles','Dallas',1251,'2005-04-12 11:50','2005-04-12 19:05',225.43),
(387,'Los Angeles','Boston',2606,'2005-04-12 07:03','2005-04-12 17:03',261.56),
(7,'Los Angeles','Sydney',7487,'2005-04-12 22:30','2005-04-14 6:10',1278.56),
(2,'Los Angeles','Tokyo',5478,'2005-04-12 12:30','2005-04-13 15:55',780.99),
(33,'Los Angeles','Honolulu',2551,'2005-04-12 09:15','2005-04-12 11:15',375.23),
(34,'Los Angeles','Honolulu',2551,'2005-04-12 12:45','2005-04-12 15:18',425.98),
(76,'Chicago','Los Angeles',1749,'2005-04-12 08:32','2005-04-12 10:03',220.98),
(68,'Chicago','New York',802,'2005-04-12 09:00','2005-04-12 12:02',202.45),
(7789,'Madison','Detroit',319,'2005-04-12 06:15','2005-04-12 08:19',120.33),
(701,'Detroit','New York',470,'2005-04-12 08:55','2005-04-12 10:26',180.56),
(702,'Madison','New York',789,'2005-04-12 07:05','2005-04-12 10:12',202.34),
(4884,'Madison','Chicago',84,'2005-04-12 22:12','2005-04-12 23:02',112.45),
(2223,'Madison','Pittsburgh',517,'2005-04-12 08:02','2005-04-12 10:01',189.98),
(5694,'Madison','Minneapolis',247,'2005-04-12 08:32','2005-04-12 09:33',120.11),
(304,'Minneapolis','New York',991,'2005-04-12 10:00','2005-04-12 1:39',101.56),
(149,'Pittsburgh','New York',303,'2005-04-12 09:42','2005-04-12 12:09',116.50);


insert into aircraft values
(1,'Boeing 747-400',8430),
(2,'Boeing 737-800',3383),
(3,'Airbus A340-300',7120),
(4,'British Aerospace Jetstream 41',1502),
(5,'Embraer ERJ-145',1530),
(6,'SAAB 340',2128),
(7,'Piper Archer III',520),
(8,'Tupolev 154',4103),
(16,'Schwitzer 2-33',30),
(9,'Lockheed L1011',6900),
(10,'Boeing 757-300',4010),
(11,'Boeing 777-300',6441),
(12,'Boeing 767-400ER',6475),
(13,'Airbus A320',2605),
(14,'Airbus A319',1805),
(15,'Boeing 727',1504);

insert into employees values
(242518965,'James Smith',120433),
(141582651,'Mary Johnson',178345),
(011564812,'John Williams',153972),
(567354612,'Lisa Walker',256481),
(552455318,'Larry West',101745),
(550156548,'Karen Scott',205187),
(390487451,'Lawrence Sperry',212156),
(274878974,'Michael Miller',99890),
(254099823,'Patricia Jones',24450),
(356187925,'Robert Brown',44740),
(355548984,'Angela Martinez',212156), 
(310454876,'Joseph Thompson',212156),
(489456522,'Linda Davis',127984),
(489221823,'Richard Jackson',23980),
(548977562,'William Ward',84476),
(310454877,'Chad Stewart',33546),
(142519864,'Betty Adams',227489),
(269734834,'George Wright',289950),
(287321212,'Michael Miller',48090),
(552455348,'Dorthy Lewis',92013),
(248965255,'Barbara Wilson',43723),
(159542516,'William Moore',48250),
(348121549,'Haywood Kelly',32899),
(090873519,'Elizabeth Taylor',32021),
(486512566,'David Anderson',743001),
(619023588,'Jennifer Thomas',54921),
(015645489,'Donald King',18050),
(556784565,'Mark Young',205187),
(573284895,'Eric Cooper',114323),
(574489456,'William Jones',105743),
(574489457,'Milo Brooks',20);

insert into certified values
(567354612,1),
(567354612,2),
(567354612,10),
(567354612,11),
(567354612,12),
(567354612,15),
(567354612,7),
(567354612,9),
(567354612,3),
(567354612,4),
(567354612,5),
(552455318,2),
(552455318,14),
(550156548,1),
(550156548,12),
(390487451,3),
(390487451,13),
(390487451,14),
(274878974,10),
(274878974,12),
(355548984,8),
(355548984,9),
(310454876,8),
(310454876,9),
(548977562,7),
(142519864,1),
(142519864,11),
(142519864,12),
(142519864,10),
(142519864,3),
(142519864,2),
(142519864,13),
(142519864,7),
(269734834,1),
(269734834,2),
(269734834,3),
(269734834,4),
(269734834,5),
(269734834,6),
(269734834,7),
(269734834,8),
(269734834,9),
(269734834,10),
(269734834,11),
(269734834,12),
(269734834,13),
(269734834,14),
(269734834,15),
(552455318,7),
(556784565,5),
(556784565,2),
(556784565,3),
(573284895,3),
(573284895,4),
(573284895,5),
(574489456,8),
(574489456,6),
(574489457,7),
(242518965,2),
(242518965,10),
(141582651,2),
(141582651,10),
(141582651,12),
(011564812,2),
(011564812,10),
(356187925,6),
(159542516,5),
(159542516,7),
(090873519,6);

-- 1(update)

SELECT DISTINCT a.aname
FROM aircraft a
JOIN certified c ON a.aid = c.aid
JOIN employees e ON c.eid = e.eid
LEFT JOIN employees e2 ON e.salary < 80000 AND e2.eid = e.eid
WHERE e2.eid IS NULL;


-- 2
select c.eid,MAX(cru)
		from certified c,aircraft a
			where c.aid=a.aid
				group by c.eid
					having COUNT(*)>3;
                

-- 3
select distinct e.ename, f.fromm,f.too
		from employees e,flights f
			where e.salary<
				(select MIN(f.price)
					from flights f
						where f.fromm='Los Angeles'
							and f.too='Honolulu');

-- 4
select a.aid,a.aname,avg(e.salary)
		from aircraft a,certified c,employees e
			where a.aid=c.aid
				and c.eid=e.eid
					and a.cru>1000
						group by a.aid,a.aname;

-- 5 not
select distinct e.ename,a.aname
		from employees e,aircraft a,certified c
			where e.eid=c.eid
				and c.aid=a.aid
					and a.aname regexp "^[boeing]";

-- 5

select distinct E.ename,a.aname from Employees E,certified c,Aircraft A
Where E.eid=c.eid And c.aid=A.aid And A.aname LIKE 'boeing%';

-- 6
SELECT aid from Aircraft a , Flights f
		where a.aid = f.flno
			and fromm = 'Los Angeles' and too =  'Chicago';
            
-- 7
select f.fromm,f.too from Flights f,Aircraft a
		inner join Certified c on c.aid = a.aid
			inner join Employees e on e.eid = c.eid
				where f.flno = a.aid and e.salary >= 100000;

-- 8
select e.ename,a.aname,a.cru from Employees e
		inner join Certified c on c.eid = e.eid
				inner join Aircraft a on a.aid = c.aid
					where a.cru >= 300 
						and a.aname 
							in (select a.aname from Aircraft where a.aname not REGEXP '^[Boeing]') ;

-- 9
select f.departs,count(a.aname) from Flights f,Aircraft a
		where f.fromm = 'Madison' and too = 'New York' and f.distance < '6 : 00'
			and f.flno = a.aid
			group by a.aname having count(*) >= 2;

select * from Flights f;

-- 10

select ((select avg(e.salary) from employees e,certified c where e.eid=c.eid)-avg(salary)) as diff_between from employees; 

-- 11
select ename from employees e, certified c where e.eid!=c.eid and 
salary>(select avg(e.salary) from employees e,certified c where e.eid=c.eid);


-- 12
select e.ename from Employees e
		inner join Certified c on c.eid = e.eid
				inner join Aircraft a on a.aid = c.aid
					where a.cru > 1000;
                    
-- 13
select e.ename,count(aname) from Employees e
		inner join Certified c on c.eid = e.eid
				inner join Aircraft a on a.aid = c.aid
					where a.cru > 1000 
						group by a.aname having count(*) > 2;
                    
-- 14
select e.ename,a.aname from Employees e
		inner join Certified c on c.eid = e.eid
				inner join Aircraft a on a.aid = c.aid
					where a.cru > 1000 and a.aname like 'Boeing%';
                    
/*
-- 8
select distinct E.name FROM  Employees E WHERE  E.eid IN  
((SELECT C.eid FROM Certified C WHERE EXISTS (SELECT A.aid FROM Aircraft A WHERE A.aid = C.aid  AND A.cruisingrange > 3000 )
AND NOT EXISTS ( SELECT A1.aid FROM Aircraft A1 WHERE A1.aid = C.aid AND A1.aname LIKE 'Boeing%'));


-- 11
SELECT  E.ename, E.salary FROM  Employees E WHERE  E.eid NOT IN ( SELECT    DISTINCT  C.eid FROM  Certified C ) AND E.salary > 
( SELECT AVG (E1.salary) FROM  Employees E1 WHERE  E1.eid IN ( SELECT  DISTINCT  C1.eid FROM  Certified C1));
prince3.txt
Displaying prince3.txt.*/