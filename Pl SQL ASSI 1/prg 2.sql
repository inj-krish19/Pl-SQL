/*create database db;*/
use db;

create table suppliers(
sid int primary key ,
sname varchar(20),
address varchar(20)
);


create table parts(
pid int,
pname varchar(20),
color varchar(20)
);


create table catalog(
sid int,
pid int,
cost real,
foreign key(sid) references suppliers(sid)
);

insert into suppliers values(1,'acme widget','manekbaug soc');
insert into suppliers values(2,'rushab traders','kadiyakoi');
insert into suppliers values(3,'diamond tools','kadiyakoi');
insert into suppliers values(4,'soham machinaries','ellisbridge');
insert into suppliers values(5,'jj enterprise','naroda');
select *from suppliers;

insert into parts values(1,'heer','red');
insert into parts values(2,'devanshi','green');
insert into parts values(3,'juhi','yellow');
insert into parts values(4,'bhoomi','purple');
insert into parts values(5,'diya','red');
select *from parts;

insert into catalog values(1,1,5000);
insert into catalog values(2,2,10000);
insert into catalog values(3,3,20000);
insert into catalog values(4,4,30000);
insert into catalog values(5,5,50000);
select * from catalog;


/*	1	*/

SELECT P.pname
FROM Parts P, Catalog C
WHERE P.pid = C.pid;

/*	2	*/


select s.sname
from suppliers s , parts p
where s.sid=p.pid;

/*	3	*/


select s.sname ,pname
from suppliers s , parts p
where s.sid=p.pid and color='red';

/*	4	*/

SELECT P.pname ,s.sname
FROM Parts P, Catalog C,suppliers s
WHERE P.pid = C.pid
and s.sname='acme widget' ;


/*	5	*/

SELECT C.sid
FROM Catalog as C
WHERE C.cost >
(SELECT AVG (C1.cost)
FROM Catalog C1
WHERE C1.pid = C.pid );

/*	6	*/


SELECT P.pid, S.sname
FROM Parts P, Suppliers S, Catalog C
WHERE C.pid = P.pid
AND C.sid = S.sid
AND C.cost = (SELECT MAX(C1.cost)
FROM Catalog C1
WHERE C1.pid = P.pid);

/*	7	*/

select s.sname ,pname
from suppliers s , parts p
where s.sid=p.pid and color='red';

/*	8	*/

select s.sname ,pname
from suppliers s , parts p
where s.sid=p.pid and color='red'and color='green';

/*	9	*/

select s.sname ,pname
from suppliers s , parts p
where s.sid=p.pid and color='red'or color='green';

/*	10	*/

select s.sname ,pname,color
from suppliers s , parts p
where s.sid=p.pid and color='green';

/*	11	*/

SELECT S.sname, COUNT(*) as PartCount
FROM Suppliers S, Parts P, Catalog C
WHERE P.pid = C.pid AND C.sid = S.sid
GROUP BY S.sname, S.sid
HAVING EVERY (P.color=’Green’);

/*	12	*/

select s.sname ,pname,color
from suppliers s , parts p
where s.sid=p.pid and color='red'and color='green';