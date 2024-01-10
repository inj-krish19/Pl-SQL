drop database db if exists;
create database db;
use db;
create table student(
	snum int(10)
    primary key,
    sname varchar(50)
    not null,
    major varchar(50)
    not null,
    _level varchar(50)
    not null,
    age int(3)
);
create table class(
	cname varchar(50)
    primary key,
    meet varchar(20)
    not null,
    room varchar(50)
    not null,
	fid int(10)
);
create table enrolled(
	snum int(10),
    cname varchar(50),
	foreign key (snum) references student(snum),
    foreign key (cname) references class(cname)
);
create table faculty(
	fid int(10)
    primary key,
    fname varchar(50),
    deptid int(10)
);
insert into student 
values 
(051135593,"Maria White","English","SR",21),
(060839453,"Charles Harris","Architecture","SR",22),
(099354543,"Susan Martin","Law","JR",20),
(112348546,"Joseph Thompson","Computer Science","SO",19),
(115987938,"Christopher Garcia","Computer Science","JR",20),
(132977562,"Angela Martinez","History","SR",20),
(269734834,"Thomas Robinson","Psychology","SO",18),
(280158572,"Margaret Clark","Animal Science","FR",18),
(301221823,"Juan Rodriguez","Psychology","JR",20),
(318548912,"Dorthy Lewis","Finance","FR",18),
(320874981,"Daniel Lee","Electrical Engineering","FR",17),
(322654189,"Lisa Walker","Computer Science","SO",17),
(348121549,"Paul Hall","Computer Science","JR",18),
(351565322,"Nancy Allen","Accounting","JR",19),
(451519864,"Mark Young","Finance","FR",18),
(455798411,"Luis Hernandez","Electrical Engineering","FR",17),
(462156489,"Donald King","Mechanical Engineering","SO",19),
(550156548,"George Wright","Education","SR",21),
(552455318,"Ana Lopez","Computer Engineering","SR",19),
(556784565,"Kenneth Hill","Civil Engineering","SR",21),
(567354612,"Karen Scott","Computer Engineering","FR",18),
(573284895,"Steven Green","Kinesiology","SO",19),
(574489456,"Betty Adams","Economics","JR",20),
(578875478,"Edward Baker","Veterinary Medicine","SR",21);

insert into class 
value
('Data Structures','MWF 10','R128',489456522),
('Database Systems','MWF 12:30-1:45','1320 DCL',142519864),
('Operating System Design','TuTh 12-1:20','20 AVW',489456522),
('Archaeology of the Incas','MWF 3-4:15','R128',248965255),
('Aviation Accident Investigation','TuTh 1-2:50','Q3',011564812),
('Air Quality Engineering','TuTh 10:30-11:45','R15',011564812),
('Introductory Latin','MWF 3-4:15','R12',248965255),
('American Political Parties','TuTh 2-3:15','20 AVW',619023588),
('Social Cognition','Tu 6:30-8:40','R15',159542516),
('Perception','MTuWTh 3','Q3',489221823),
('Multivariate Analysis','TuTh 2-3:15','R15',090873519),
('Patent Law','F 1-2:50','R128',090873519),
('Urban Economics','MWF 11','20 AVW',489221823),
('Organic Chemistry','TuTh 12:30-1:45','R12',489221823),
('Marketing Research','MW 10-11:15','1320 DCL',489221823),
('Seminar in American Art','M 4','R15',489221823),
('Orbital Mechanics','MWF 8','1320 DCL',011564812),
('Dairy Herd Management','TuTh 12:30-1:45','R128',356187925),
('Communication Networks','MW 9:30-10:45','20 AVW',141582651),
('Optical Electronics','TuTh 12:30-1:45','R15',254099823),
('Intoduction to Math','TuTh 8-9:30','R128',489221823);

insert into enrolled
values
(112348546,"Database Systems"),
(115987938,"Database Systems"),
(348121549,"Database Systems"),
(322654189,"Database Systems"),
(552455318,"Database Systems"),
(455798411,"Operating System Design"),
(552455318,"Operating System Design"),
(567354612,"Operating System Design"),
(112348546,"Operating System Design"),
(115987938,"Operating System Design"),
(322654189,"Operating System Design"),
(567354612,"Data Structures"),
(552455318,"Communication Networks"),
(455798411,"Optical Electronics"),
(301221823,"Perception"),
(301221823,"Social Cognition"),
(301221823,"American Political Parties"),
(556784565,"Air Quality Engineering"),
(099354543,"Patent Law"),
(574489456,"Urban Economics");

insert into faculty
values
(142519864,"Ivana Teach",20),
(242518965,"James Smith",68),
(141582651,"Mary Johnson",20),
(011564812,"John Williams",68),
(254099823,"Patricia Jones",68),
(356187925,"Robert Brown",12),
(489456522,"Linda Davis",20),
(287321212,"Michael Miller",12),
(248965255,"Barbara Wilson",12),
(159542516,"William Moore",33),
(090873519,"Elizabeth Taylor",11),
(486512566,"David Anderson",20),
(619023588,"Jennifer Thomas",11),
(489221823,"Richard Jackson",33),
(548977562,"Ulysses Teach",20);

select * from student;
select * from class;
select * from enrolled;
select * from faculty;


/*		ADVANCED QUERIES	*/

/*		1		*/
select distinct S.sname
from student S, class C, enrolled E, faculty F
where  S.snum = E.snum and E.cname = C.cname and C.fid = F.fid and
F.fname = "Ivana Teach" and S._level = "JR" ;

/*		2		*/

select max(S.age) as "Maximum Age" 
from student S
where (S.major = "History")
or S.snum in (select E.snum
from class C, enrolled E, faculty F
where E.cname = C.cname and C.fid = F.fid
and F.fname = "Ivana Teach" );

/*		3		*/

select C.cname
from class C
where c.room = "R128"
or C.cname in (select E.cname
from enrolled E
group by E.cname
having COUNT(*) >= 5);

/*		4		*/

select distinct S.sname
from student S
where S.snum in (select E1.snum
from enrolled E1, enrolled E2, class C1, class C2
where E1.snum = E2.snum and E1.cname = E2.cname
and E1.cname = C1.cname
and E2.cname = C2.cname and C1.meet = C2.meet);

/*		5		*/

select distinct F.fname
from faculty F
where not exists (
( select * from class C )
except(select C1.room
from Class C1
where C1.fid = F.fid ));

/*	6	*/

select e.cname from student as s inner join  enrolled as e on s.snum=e.snum where levet='jr';


/*	7	*/


select s.sname,max(age) from student as s inner join  enrolled as e on s.snum=e.snum group by cname='history';


/*	8	*/

select e.cname from enrolled as e inner join class as c on e.cname = c.name where room='R128';


/*	9	*/

select levet,avg(age) from student group by levet='jr','so' or levet='sr';


/*	10	*/

select levet,avg(age) from student group by levet='so' ,'sr';


/*	11	*/

select s.sname from student as s inner join  enrolled as e on s.snum=e.snum where e.snum='';


/*	12	*/

select count(major) as total,major from student group by major;


/*	13	*/

select e.cname from enrolled as e inner join class as c on e.cname = c.name where room='R128';


