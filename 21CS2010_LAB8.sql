-- Q1_ii
select*from xyz.employee;
Select EMP_NO, EMP_NAME, SALARY from employee;

-- Q1_iii
select avg(SALARY) from employee;

-- Q1_iv
select count(*) from employee;

-- Q1_V
select count(DISTINCT EMP_NAME) from employee;

-- Q1_vi
select EMP_NAME, sum(SALARY), count(*) from employee group by EMP_NAME;

-- Q1_vii
Select EMP_NAME, SUM(SALARY) from employee
group by(EMP_NAME)
having sum(salary) > 120000;

-- Q1_viii
select EMP_NAME from employee
order by EMP_NAME desc;

-- Q1_ix
select * from employee
where EMP_NAME = 'Amit' and salary>50000;

-- Q2
CREATE TABLE employee1 (
    FNAME VARCHAR(255),
    MNIT VARCHAR(255),
    LNAME VARCHAR(255),
  SSN VARCHAR(255),
  BDATE varchar(16),
  ADDRESS VARCHAR(255),
  SEX VARCHAR(255),
  SALARY VARCHAR(255),
  SUPERSSN VARCHAR(255),
  DNO VARCHAR(255)
   
);

insert into employee1 values('John', 'A', 'Doe', '123-45-6789', '2000-01-01', '123 Main St', 'M', '50000', '987-65-4321', '1'),
('Jane', 'B', 'Smith', '234-56-7890', '2001-02-02', '456 Elm St', 'F', '60000', '876-54-3210', '2'),
('Bob', 'C', 'Johnson', '345-67-8901', '2002-03-03', '789 Oak St', 'M', '70000', '765-43-2109', '3'),
('Sara', 'D', 'Williams', '456-78-9012', '2003-04-04', '111 Pine St', 'F', '80000', '654-32-1098', '4'),
('Tom', 'E', 'Brown', '567-89-0123', '2004-05-05', '222 Maple St', 'M', '90000', '543-21-0987', '5'),
('Lisa', 'F', 'Davis', '678-90-1234', '2005-06-06', '333 Cedar St', 'F', '100000', '432-10-9876', '6'),
('Mike', 'G', 'Miller', '789-01-2345', '2006-07-07', '444 Oak St', 'M', '110000', '321-09-8765', '7'),
('Emily', 'H', 'Wilson', '890-12-3456', '2007-08-08', '555 Pine St', 'F', '120000', '210-98-7654', '8'),
('David', 'I', 'Moore', '901-23-4567', '2008-09-09', '666 Maple St', 'M', '130000', '109-87-6543', '9'),
('Julia', 'J', 'Taylor', '012-34-5678', '2009-10-10', '777 Cedar St', 'F', '140000', '098-76-5432', '10');

create table Department(
 DNAME varchar(15),
 DNUMBER int(8),
 MGRSSN int(10),
 MGRSTARTDATE varchar(20)
 );

insert into department values('Research',5,333445555,'1966-05-22');
insert into department values('Administration',4,987654321,'1995-01-01');
insert into department values('Headquarters',1,988766565,'1981-06-19');
insert into department values('Accounts',8,988766225,'1980-08-18');
insert into department values('Research',5,333444555,'1976-09-22');
insert into department values('Research',5,333445055,'1960-03-11');
insert into department values('Headquarters',1,988788565,'1987-04-28');

-- Q2_i
UPDATE EMPLOYEE1
SET SALARY = SALARY * 1.1
WHERE DNO IN (SELECT DNUMBER
FROM DEPARTMENT
WHERE DNAME = "Research");

-- Q2_ii
select sum(salary) as TOTAL_SALARY, max(salary) as MAX_SALARY, min(salary) as MIN_SALARY, avg(salary) as AVG_SALARY
from employee1
where DNO = (select DNUMBER from DEPARTMENT where DNAME = "Accounts");

-- Q2_iii
select FNAME , LNAME
from employee1
where exists(select * from DEPARTMENT where DNO = 5);

-- Q2_iv
Select D.DNAME, count(*) as NUM_EMPLOYEES
from employee1 E 
join DEPARTMENT D on E.DNO = D.DNUMBER
group by E.DNO, DNAME
having count(*) >= 2;

-- Q2_v
select FNAME, LNAME 
from employee1
where year(BDATE)>= 1990;

-- Q2_vi
select E.FNAME , E.LNAME, D.DNAME
from employee1 E 
join department D on E.DNO = D.DNUMBER;

