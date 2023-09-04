-- Active: 1692687628032@@127.0.0.1@5432@tasks

-- ##Create Database 
CREATE DATABASE test2;


-- ## Rename DATABASE
ALTER DATABASE db1 RENAME TO db2;


-- ## Delete DATABASE
DROP DATABASE test1;


--##Create a student TABLE
CREATE Table studet(
  student_id INT,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  cgpa NUMERIC (1,2)
)

-- ## update a table name
ALTER TABLE studet RENAME TO learners;


-- ## Delete a table 
DROP TABLE learners;


-- ##Create a table with CONSTRAINT
CREATE Table users(
  user_id SERIAL PRIMARY KEY,
  user_name VARCHAR(255) UNIQUE NOT NULL,
  email VARCHAR(50) UNIQUE NOT NULL
)

-- #Composite key
CREATE Table "user1"(
  user_id SERIAL ,
  username VARCHAR(255) UNIQUE NOT NULL,
  email VARCHAR(50) UNIQUE NOT NULL,
  PRIMARY KEY(user_id, username),
  age INT DEFAULT 18
)

-- ## Composite Unique KEY [Not necessary we do upper methed by indivisual unique cmd]
CREATE Table "user2"(
  user_id SERIAL ,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(50) NOT NULL,
  PRIMARY KEY(user_id, username),
  UNIQUE(username,email)
)


-- ## Inser data in table 
INSERT INTO user1 VALUES(1,'Razu', 'razumolla@gmail.com')

-- ## Get All Data from user1 
SELECT * FROM user1; 



--  # module -30.9 --------------------------------------------------------------------------
CREATE Table user1(
  user_id SERIAL PRIMARY KEY,
  user_name VARCHAR(255) UNIQUE NOT NULL,
  email VARCHAR(50) UNIQUE NOT NULL,
  age int DEFAULT 18
-- )

-- 1
-- ##Insert Multiple row data in a table
INSERT INTO user1 (user_id, user_name, email,age) VALUES (2,'Razu 2', 'razumolla7@gmail.com',94);

-- #2
INSERT INTO user1 ( user_name, email)
 VALUES 
('Razu 3', 'razumolla7y@gmail.com'),
('Razu 4', 'razumolla75@gmail.com'),
('Razu 5', 'razumolla72@gmail.com');

-- #3
INSERT INTO user1  
VALUES  
('Razu 3', 'razumolla7y@gmail.com'), 
('Razu 4', 'razumolla75@gmail.com'), 
('Razu 5', 'razumolla72@gmail.com');



-- ##Insert all row in a table without deleting TABLE
TRUNCATE TABLE user1;


-- Module -30.10 -------------------------------------------------------------------------
-----------------
--  ## ADD a column in a TABLE
ALTER TABLE user1
ADD COLUMN password VARCHAR(255) DEFAULT 'admin' not NULL;

--  Delete a column from TABLE
ALTER TABLE user1
DROP COLUMN age;

--  Rename a column name from TABLE
ALTER TABLE user1
RENAME COLUMN demo to country;


-- # Add a demo column
ALTER TABLE user1 ADD COLUMN demo int;


-- # Change Datatype of a column
ALTER Table user1 
    alter COLUMN demo type TEXT;


-- set default VALUES
ALTER Table user1   
    alter COLUMN demo set DEFAULT 'bangladesh';

-- Remove Default VALUES
ALTER Table user1   
    alter COLUMN demo DROP DEFAULT;

-- ## Add a constraint 
ALTER Table user1 
    alter COLUMN country set not NULL;

ALTER Table user1 
    ADD constraint unique_email UNIQUE(email);



-- ## Drop a constraint 
ALTER Table user1 
    alter COLUMN country DROP not NULL;

ALTER Table user1 
    DROP constraint unique_email UNIQUE(email);

INSERT INTO user1 VALUES (3, 'Rajib', 'asdf@gmail');

SELECT * FROM user1; 




--## 31.1 foren KEY  -------------------------------------------------------------------------------

-- Department TABLE
-- Each department has many employee
CREATE Table Department(
    deptID SERIAL PRIMARY KEY,
    deptName VARCHAR(50)
);

-- inser data in TABLE
 
INSERT INTO Department values (1, 'IT');

DELETE FROM Department WHERE deptID=1;

SELECT * FROM department;


-- Employee TABLE
-- Each employee belongs to a department
CREATE Table Employee(
    empID SERIAL PRIMARY KEY,
    empName VARCHAR(50) NOT NULL,
    departmentID INT,
    constraint fk_constraint_dept
        FOREIGN KEY(departmentID)
        REFERENCES Department(deptID)
);


-- # INSERT , delete ,view data from table

INSERT INTO Employee values (1, 'Razu', 1);

DELETE from employee WHERE empID=1;

SELECT * from employee;



--  ## Module 31.2 --------------------------------------------------------------------------
CREATE Table courses(
  course_id SERIAL PRIMARY KEY,
  course_name VARCHAR(255) NOT NULL,
  description VARCHAR(255),
  published_date DATE
);



-- Date  Format: YYYY-MM-DD 
INSERT INTO 
    courses(course_name, description, published_date)
VALUES
    ('PostgresSQL for developer','A complete PostgresSQL for Developers','2020-07-13'),
    ('PostgresSQL Administration','A PostgresSQL Guide for DBA', NULL),
    ('PostgresSQL High Performance', NULL, NULL),
    ('PostgresSQL Bootcamp','A complete PostgresSQL for Developers','2022-08-30'),
    ('Mastering  PostgresSql','Mastering  PostgresSql in 21 Days','2023-06-23');



-- # update databse table Row
-- UPDATE table_name 
-- set 
-- column1= value1,
-- column2= value2,
-- WHERE condition 

UPDATE courses 
set 
course_name= 'PostgresSQL  beginner',
description = 'Dummy test'
WHERE course_id >1 or course_id <5

-- Delete a row
DELETE FROM courses
where course_id =1 ;

SELECT * FROM courses; 





-- 31-3: Select Basics -----------------------------------------------------------------------

CREATE Table if NOT exists departments(
    deptID SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

INSERT INTO 
    departments(name)
VALUES 
  ('IT'),
  ('EEE'),
  ('CSE');

CREATE Table if NOT exists employees(
    empID SERIAL PRIMARY KEY,
    name text NOT NULL,
    email TEXT not NULL,
    salary INTEGER NOT NULL,
    joining_date date not NULL,
    deptID integer not null,
    constraint fk_deptID
        FOREIGN KEY(deptID)
        REFERENCES departments(deptID)
);
INSERT INTO
  employees(name,email,salary,joining_date,deptID)
VALUES 
 ('Razu', 'raj@gmail.com',12000, '2022-07-15',1),
  ('Ovi', 'ovi@gmail.com',13000, '2023-03-05',2),
  ('Kaj', 'kaj@gmail.com',52000, '2042-07-15',3),
  ('Mah', 'mah@gmail.com',80000, '2052-04-14',1),
  ('Hni', 'hni@gmail.com',50000, '2002-07-12',3),
  ('Sallu', 'sllu@gmail.com',90000, '2025-06-25',2),
  ('Aisha', 'aisha@gmail.com', 75000, '2019-11-10', 1),
  ('Zara', 'zara@gmail.com', 62000, '2018-05-20', 2),
  ('John', 'john@gmail.com', 68000, '2020-02-15', 3),
  ('Emily', 'emily@gmail.com', 55000, '2021-08-02', 1);

--  SELECT all fields/rows
SELECT * from departments;

SELECT * FROM employees;

--  select some COLUMN
 select name,email,joining_date, salary from employees; 


-- Reduce Duplicate field data by (DISTINCT)
 SELECT DISTINCT emp_department from employees;

-- Filter by where condition 
SELECT * FROM employees
where salary > 10000;

SELECT * FROM employees
where salary > 10000 AND salary < 90000;

SELECT * FROM employees
where salary < 10000 or salary > 90000;

SELECT * FROM employees
where joining_date >= '2022-01-01';

SELECT * FROM employees
where name <> 'Eve' AND salary > 90000 OR name = 'Greta';





-- 31-4: Limit And Offset  ------------------------------------------------------
 
--  Order BY
SELECT * FROM employees
ORDER BY name ASC;

-- Offcet means 
SELECT * FROM employees
ORDER BY name DESC LIMIT 10 OFFSET 2;

-- find highest salary person
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 1;

-- find 3rd highest salary person
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 2 ;

SELECT * FROM employees; 




-- ## 31-5: More Select And Like Operator --------------------------------------------
-- In, NOT IN, BETWEEN, LIKE  

SELECT * FROM employees 
WHERE empid IN(2,3,5);


SELECT * FROM employees 
WHERE empid Not IN(2,3,5);


SELECT * FROM employees
WHERE salary BETWEEN  10000 and 20000;

SELECT * FROM employees 
WHERE name LIKE 'R%';

SELECT * FROM employees 
WHERE name LIKE '%az%';

SELECT * FROM employees 
WHERE name LIKE '%u';

-- SPECIFIC position 
SELECT * from employees where name like '__l%'; 


SELECT * from employees where name like 'R%u'; 


SELECT * from employees where deptid is not null; 

UPDATE employees 
set deptid=NULL
WHERE empid=1;


-- module 30.6 : joining -----------------------------------------------------------
 

select employee.full_name, employee.job_role, department.department_name
from employee
inner join department on department.department_id = employee.department_id

select *
from employee
left join department on department.department_id = employee.department_id


select *
from employee
RIGHT join department on department.department_id = employee.department_id

select *
from employee
FULL join department on department.department_id = employee.department_id

select *
from employee
FULL join department  

select *
from employee
CROSS join department  

-- 31.8 : AGGREGATE function --- [min, max, ave value find ]-------------------------- 

-- avg with alias name average salary
SELECT avg(salary) as AverageSalary
FROM employees;

SELECT min(salary) FROM employees;

SELECT max(salary) FROM employees;
SELECT sum(salary) FROM employees;

-- GroupBY
SELECT deptid, avg(salary) 
FROM employees 
GROUP BY deptid;

SELECT deptid, sum(salary) 
FROM employees 
GROUP BY deptid;

SELECT d.name, avg(e.salary) , sum(e.salary)
FROM employees e
FULL join departments d on e.deptid=d.deptid
GROUP BY d.name;

-- find from department
SELECT d.deptid, d.name, avg(e.salary) , sum(e.salary),min(e.salary) , count(*)
FROM departments d 
FULL join employees e on e.deptid=d.deptid
GROUP BY d.deptid 
HAVING avg(e.salary) > 55000;


SELECT * FROM employees; 




-- 31-10 Sub Queries -----------------------------------------------------------------------
SELECT * 
from employees 
WHERE salary IN(
  SELECT salary from employees WHERE name LIKE '%a%'
)

-- begger than avg salary
SELECT * 
from employees 
WHERE salary > (
  SELECT avg(salary) FROM employees
)


SELECT email, (
SELECT avg(salary) FROM employees
) FROM employees;

-- complex query in column 
select dept_id , avg_salary from (
  SELECT deptID as dep_ID as avg_salary from employees group by depid
) as tempTable 
JOIN departments d on d.depid = xxxx.deptid 




-- 31.12 Stored Procedures and Functions ----------------------------------------------

-- we can make multiple work and reusable 
-- procedule return kore na
CREATE PROCEDURE deactivate_unpaid_accounts()
LANGUAGE SQL
AS $$ 
  UPDATE accounts set account = FALSE WHERE balance = 0;               
$$

CALL deactivate_unpaid_accounts();





-- Functions return kore | procedural LANGUAGE
-- variable declare kora jai, FUNCTION declare kora jai 

CREATE PROCEDURE account_type_count(acount_type text) RETURNS INTEGER
LANGUAGE plpgsql
AS $$ 
  DECLARE account_count int;
  BEGIN
    SELECT count(*) into account_count FROM accounts WHERE accounts.account_type = $1;               
  END
$$

 



--  31-13 Triggers --------------------------------------------------------------------

CREATE Table product (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) not NULL,
  base_price FLOAT8 NOT NULL,
  final_price FLOAT8
);

INSERT INTO product(title,base_price) VALUES('Apple 2',55);

SELECT * FROM product;

 
create Trigger add_tax_trigger
AFTER
INSERT on product
for each row
EXECUTE FUNCTION update_final_price();


CREATE or REPLACE Function ()
RETURNS TRIGGER
LANGUAGE plpgsql
as $$ 
  BEGIN
    new.final_price := new.base_price * 1.05;
    RETURN new;
  END;
$$;



-- 31-14 Indexing and Optimization

 EXPLAIN ANALYSE SELECT emp_name from employees WHERE emp_name='Jhon doe'

