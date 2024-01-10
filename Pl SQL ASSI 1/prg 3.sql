create database db;
use db;

create table flights (
     flno integer primary key,
     start_from varchar(50),
     reach_to varchar(50),
     distance integer,
     departs time,
     arrives time,
     price integer
 );
 
 create table aircraft (
     aid integer primary key,
     aname varchar(50),
     cruisingrange integer
 );
 
create table employees (
     eid integer primary key,
     ename varchar(50),
     salary integer
 );
 
create table certified (
     eid integer,
     aid integer,
     foreign key (eid) references employees(eid),
     foreign key (aid) references aircraft(aid)
 );
 
insert into flights values  
(101, 'New York', 'Los Angeles', 2500, '08:00:00', '12:00:00', 10050),
(102, 'Los Angeles', 'Chicago', 1800, '10:00:00', '14:00:00', 85000),
(101,New York', 'Los Angeles', 2500, '08:00:00', '12:00:00', 10050),
(102, 'Los Angeles', 'Chicago', 1800, '10:00:00', '14:00:00', 85000),
(101, 'New York', 'Los Angeles', 2500, '08:00:00', '12:00:00', 10050),
(102, 'Los Angeles', 'Chicago', 1800, '10:00:00', '14:00:00', 85000),
(101, 'New York', 'Los Angeles', 2500, '08:00:00', '12:00:00', 10050),
(106 'Los Angeles', 'Chicago', 1800, '10:00:00', '14:00:00', 85000),
(101, 'New York', 'Los Angeles', 2500, '08:00:00', '12:00:00', 10050),
(109 'Los Angeles', 'Chicago', 1800, '10:00:00', '14:00:00', 85000),
(111 'New York', 'Los Angeles', 2500, '08:00:00', '12:00:00', 10050),
(112,'Los Angeles', 'Chicago', 1800, '10:00:00', '14:00:00', 85000),
(113,'Chicago', 'Miami', 2000, '12:00:00', '16:00:00', 32000);

insert into flights values (104, 'Los Angeles', 'Chicago', 2500, '18:00:00', '22:00:00', 22000);

insert into aircraft values
(1, 'Boeing 123', 5000),
(2, 'Airbus A302', 3500),
(3, 'Boeing 777', 6000),
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
(1, 'John Smith', 60000),
(2, 'Will Smith', 55000),
(3, 'Michael Jackson', 65000),
(4, 'Dwayne Johnson', 58000),
(5, 'Bruce Lee', 62000),
(356187925,'Robert Brown',44740),
(355548984,'Angela Martinez',212156),
(310454876,'Joseph Thompson',212156),
(489456522,'Linda Davis',127984),
(489221823,'Richard Jackson',23980),
(548977562,'William Ward',84476),
(310454877,'Chad Stewart',33546),
(142519864,'Betty Adams',227489),
(269734834,'George Wright',289950);

insert into certified values
(567354612,1),
(142519864,2),
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



/*	1	*/

select distinct a.aname from aircraft a where not exists
(select eid from certified c join flights f on c.aid = f.flno where f.price >= 80000 and c.aid = a.aid);

/*	2	*/
 
select distinct e.ename from employees e join certified c on e.eid = c.eid join aircraft a on c.aid = a.aid where a.aname like 'boeing%';

/*	3	*/

select distinct e.ename from employees e where e.eid in
(select c.eid from certified c join aircraft a on c.aid = a.aid where a.aname not like 'boeing%');

/*	4	*/

select e.eid, e.ename, e.salary, avg(e.salary) from employees e where e.salary >
(select avg(salary) from employees where eid in (select eid from certified));

/*	5	*/

SELECT DISTINCT E.ename
FROM Employees E, Certified C, Aircraft A
WHERE E.eid = C.eid AND
C.aid = A.aid AND
A.aname LIKE ‘Boeing%’;

/*	6	*/ 
SELECT A.aid
FROM Aircraft A
WHERE A.cruisingrange > ( SELECT MIN (F.distance)
FROM Flights F
WHERE F.from = ‘Los Angeles’ AND F.to = ‘Chicago’ )


/*	7	*/
 SELECT DISTINCT F.from, F.to
FROM Flights F
WHERE NOT EXISTS ( SELECT *
FROM Employees E
WHERE E.salary > 100000
AND
NOT EXISTS (SELECT *
FROM Aircraft A, Certified C
WHERE A.cruisingrange > F.distance
AND E.eid = C.eid
AND A.aid = C.aid) )


/*	8	*/

 SELECT DISTINCT E.ename
FROM Employees E
WHERE E.eid IN ( ( SELECT C.eid
FROM Certified C
WHERE EXISTS ( SELECT A.aid
FROM Aircraft A
WHERE A.aid = C.aid
AND A.cruisingrange > 3000 )
AND
NOT EXISTS ( SELECT A1.aid
52 Chapter 5
FROM Aircraft A1
WHERE A1.aid = C.aid
AND A1.aname LIKE ‘Boeing%’ ))
