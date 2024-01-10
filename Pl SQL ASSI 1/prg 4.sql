-- 5.4
create table sailors(
sid int primary key,
    sname varchar(50),
    rating int,
    age int
);

create table emp (
     eid integer primary key,
     ename varchar(50),
     age integer,
     salary real
);
create table works (
     eid integer,
     did integer,
     pcl_time integer,
     foreign key(eid) references emp(eid),
     foreign key(did) references dept(did)
 );
 
 create table dept (
     did integer primary key,
     budget real,
     manager_id integer,
     age integer,
     foreign key(manager_id) references emp(eid)
 );
 
SHOW DATABASES;
create database prg7;
use prg7;
drop database prg7;

insert into employee
values
(142519864,"Susan Martin",39,56990),
(242518965,"James Smith",68,27099),
(141582651,"Mary Johnson",44,94011),
(011564812,"John Williams",35,74098),
(254099823,"Patricia Jones",28,42783),
(356187925,"Robert Brown",28,35431),
(489456522,"Linda Davis",26,25971),
(287321212,"Michael Miller",62,131072),
(248965255,"Barbara Wilson",48,95021),
(159542516,"Matt Nelson",33,48990),
(090873519,"Elizabeth Taylor",27,33055),
(486512566,"David Anderson",20,25199),
(619023588,"Jennifer Thomas",24,34654),
(112348546,"Joseph Thompson",26,24998),
(115987938,"Christopher Garcia",60,24998),
(132977562,"Angela Martinez",31,24998),
(269734834,"Rick Carter",38,24998),
(280158572,"Margaret Clark",40,24998),
(301221823,"Juan Rodriguez",30,32175),
(318548912,"Ann Mitchell",23,32175),
(320874981,"Daniel Lee",23,32175),
(322654189,"Lisa Walker",38,32175),
(348121549,"Trey Phillips",69,32175),
(351565322,"Nancy Allen",30,39910),
(451519864,"Mark Young",34,39910),
(455798411,"Luis Hernandez",44,39910),
(550156548,"George Wright",42,41008),
(552455318,"Ana Lopez",35,41008),
(556784565,"Kenneth Hill",81,41008),
(567354612,"Karen Scott",70,39910),
(573284895,"Steven Green",29,39910),
(574489456,"Betty Adams",39,39910),
(015645489,"Daniel Evans",25,40312),
(015487874,"Gene Edwards",51,41008),
(054879887,"Dorthy Lewis",33,41008),
(098784544,"Eric Collins",23,41008),
(074454898,"Scott Bell",23,70100),
(156489494,"Gil Richardson",32,70100),
(179887498,"Dorthy Howard",28,40312),
(156465461,"Eric Cooper",26,24998),
(128778823,"William Ward",33,24998),
(178949844,"Chad Stewart",29,24998),
(298489484,"Lisa Gray",31,24998),
(274878974,"Harry Watson",30,24998),
(267894232,"Paul Hall",25,24998),
(254898318,"Gim Rogers",25,32175),
(489221823,"Richard Jackson",33,32996),
(548977562,"Donald King",43,92048),
(289562686,"Thomas Robinson",34,32175),
(291795563,"Haywood Kelly",36,32175),
(578875478,"Edward Baker",50,101071),
(051135593,"Maria White",22,24998),
(060839453,"Charles Harris",24,24998),
(334568786,"William Moore",32,32175),
(355548984,"Tom Murphy",41,32175),
(310454876,"Milo Brooks",22,39910),
(390487451,"Mark Coleman",42,39910),
(454565232,"Louis Jenkins",20,39910),
(141582657,"Stanley Browne",23,14093);






INSERT INTO DEPARTMENT
values
(142519864,2,100),
(242518965,1,100),
(141582651,1,50),
(141582651,5,50),
(141582657,1,25),
(141582657,5,75),
(011564812,3,100),
(254099823,3,100),
(356187925,2,100),
(489456522,7,100),
(287321212,2,100),
(248965255,3,100),
(159542516,4,100),
(090873519,2,100),
(486512566,4,100),
(619023588,1,100),
(489221823,2,100),
(548977562,4,100),
(578875478,6,100),
(051135593,2,100),
(060839453,2,100),
(112348546,2,100),
(115987938,2,100),
(132977562,2,100),
(269734834,2,100),
(280158572,2,100),
(301221823,2,100),
(318548912,2,100),
(320874981,2,100),
(322654189,2,100),
(348121549,2,100),
(351565322,2,100),
(451519864,2,100),
(455798411,2,100),
(550156548,2,50),
(552455318,2,25),
(556784565,2,25),
(567354612,2,75),
(573284895,2,50),
(574489456,2,50),
(015645489,6,100),
(015487874,6,100),
(054879887,6,100),
(098784544,6,100),
(074454898,6,100),
(156489494,6,100),
(179887498,6,100),
(156465461,6,100),
(128778823,6,100),
(178949844,6,100),
(298489484,6,100),
(274878974,6,100),
(267894232,6,100),
(254898318,6,100),
(289562686,6,100),
(291795563,6,100),
(334568786,6,100),
(355548984,6,100),
(310454876,6,100),
(390487451,6,100),
(454565232,6,50);



insert into department
values
(1,"Hardware",1048572.12,141582651),
(2,"Operations",12099101.00,287321212),
(3,"Legal",222988.13,248965255),
(4,"Marketing",538099.54,548977562),
(5,"Software",400011.12,141582651),
(6,"Production",12099101.00,578875478),
(7,"Shipping",5.00,489456522);


/*	1	*/

SELECT E.ename
FROM Employees E, Certified C, Aircraft A
WHERE C.aid = A.aid AND E.eid = C.eid
GROUP BY E.eid, E.ename
HAVING EVERY (A.cruisingrange > 1000)


/*	2	*/
 SELECT E.ename
FROM Employees E, Certified C, Aircraft A
WHERE C.aid = A.aid AND E.eid = C.eid
GROUP BY E.eid, E.ename
HAVING EVERY (A.cruisingrange > 1000) AND COUNT (*) > 1


/*	3	*/


SELECT E.ename
FROM Employees E, Certified C, Aircraft A
WHERE C.aid = A.aid AND E.eid = C.eid
GROUP BY E.eid, E.ename
HAVING EVERY (A.cruisingrange > 1000) AND ANY (A.aname = ’Boeing’)
