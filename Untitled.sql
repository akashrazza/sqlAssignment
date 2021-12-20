
-- Q1
create table Products(
	ProductID int,
    ProductName varchar(25),
    Description varchar(25),
    cost int
);
insert into Products values (1,'Mobile','Mobile Phone',4300);
insert into Products values (2,'Laptop','Lenove Laptop',30300);
insert into Products values (3,'PC','PC Acer',114300);
insert into Products values (4,'Cloths','Cotton Cloths',600);
insert into Products values (5,'Medicine','Good Medicine',700);

select * from Products;

-- Q2
create table Customer (
	CustomerId int,
    CustomerName varchar(25),
    Address varchar(25),
    City varchar(25),
    PostalCode varchar(25),
    Country varchar(25)
);
alter table Customer modify column PostalCode int;
Insert into Customer values(1,'Raja','Mahadeva','Siwan',841226,'India');
Insert into Customer values(2,'Gyan','Patna','Patna',104110,'India');
Insert into Customer values(3,'Nikhil','Jaipur','Jaipur',100140,'India');
Insert into Customer values(4,'Test','Jaipur','Jaipur',200110,'India');
Insert into Customer values(5,'Test1','Mahadeva','Siwan',841226,'India');

select * from Customer;


-- Q3
create table Purchase(
	CustomerId int,
    ProductID int
);

Insert into Purchase values(1,3);
Insert into Purchase values(3,2);
Insert into Purchase values(1,5);
Insert into Purchase values(3,1);
Insert into Purchase values(2,4);
Insert into Purchase values(4,2);

-- Q3
select DISTINCT city from Customer;

-- Q4
select DISTINCT count(city) as Count from Customer;

-- Q5
select * from Products where cost >  15000 or cost = 15000;

-- Q7
select * from Customer where  CustomerId IN (select CustomerID from Purchase);

-- Q8
select * from Products where ProductID IN (select ProductID from Purchase);

-- Q9
select  CustomerName,Country from Customer where Country='India';

-- Q10
select CustomerName from Customer order by CustomerName;

-- Q11
select CustomerName from Customer order by CustomerName asc;

-- Q12
select CustomerName from Customer order by Country desc;

-- Q13
Insert into Customer(CustomerId,CustomerName,Address,City,PostalCode,Country) values(6,'Test2','Test Place','New York',841226,'US');
Insert into Customer(CustomerId,CustomerName,Address,City,Country) values(6,'Test3','Test Place','New York','US');
select * from Customer where PostalCode is null;

-- Q14
select * from Customer where PostalCode is not null;

SET SQL_SAFE_UPDATES = 0;

-- Q15
update Products set ProductName="Vivo Mobile" where ProductName = "Mobile";
select * from Products;

-- Q16
update Products set Description = "Test Update" where ProductID=3 and ProductName="PC";

-- Q17
delete from Customer where CustomerId=6 and CustomerName="Test2";
-- Q18
delete from Customer;
select * from Customer;

-- Q19
select ProductID,ProductName,cost from Products order by cost desc limit 0,1;
-- Q20
select ProductID,ProductName,cost from Products order by cost desc limit 0,1;


-- Q21
select ProductID,ProductName,cost from Products order by cost asc limit 0,1;


-- Q22
 select CustomerName,Exp from Customer inner join  (select CustomerId,Sum(cost) as Exp from Purchase pu inner join Products pr on pr.ProductID=pu.ProductID group by customerId) d on d.CustomerId=Customer.CustomerId;

-- Q23 
Alter table Customer change column PostalCode PinCode int;

-- Q24
Alter table Products add column Rating int;

-- Q25
create table student_table (
	id int,
    name varchar(25),
    stream varchar(25),
    marks int
);

insert into student_table values (1,'Raja','CS',43);
insert into student_table values (2,'Gyan','CS',43);
insert into student_table values (3,'Prakesh','CS',43);
insert into student_table values (4,'Syandeep','CS',43);

delete from student_table;
drop table student_table;

-- Q26
set autocommit=0;
Insert into Customer values(9,'Test3','Test3 Palace','NewYork',12344,'US');
select * from Customer;
rollback;
select * from Customer;

-- Q27
select CustomerName,Products from Customer c inner join (select count(*) as Products,CustomerId from Purchase group by CustomerId) d on d.CustomerId=c.CustomerId;

-- Q28
select d.CustomerId,d.CustomerName,ProductName from Products inner join (select c.CustomerId,c.CustomerName,p.ProductID from Purchase p inner join Customer c on p.CustomerId=c.CustomerId) d on d.ProductId=Products.ProductID; 

-- Q29
create table emp_table(
	emp_id int,
    name varchar(25),
    address varchar(25),
    city varchar(25),
    state varchar(25),
    country varchar(25),
    primary key(emp_id)
);

insert into emp_table values(1,'Raja','Mahadeva','siwan','Bihar','India');
insert into emp_table values(2,'Test1','Address Test 1','siwan1','Bihar','India');
insert into emp_table values(3,'Test2','Address Test 2','siwan2','UP','India');
insert into emp_table values(4,'Test3','Address Test 3','siwan3','New Yory','US');
create table dept(
	dept_id int,
    dept_name varchar(25),
    emp_id int,
    foreign key(emp_id) references emp_table(emp_id) 
    );
insert into dept values(1,'CSE',1);
insert into dept values(1,'Maths',3);
insert into dept values(1,'ECE',2);
insert into dept values(1,'MECH',4);

select name,dept_name from dept inner join emp_table on emp_table.emp_id=dept.emp_id;