
--  Module - 31.9 --  practice tasks -------------------------------------------- 
-- Task 1 
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO employees (emp_id, emp_name, department, salary)
VALUES
    (1, 'John Doe', 'HR', 50000.00),
    (2, 'Jane Smith', 'IT', 60000.00),
    (3, 'Michael Johnson', 'Finance', 55000.00),
    (4, 'Emily Brown', 'HR', 52000.00);

-- solution of task 1
SELECT emp_name, salary
FROM employees
WHERE department='HR'  






-- Task 2 -------
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    total_amount DECIMAL(10, 2)
);

INSERT INTO orders (order_id, customer_id, total_amount)
VALUES
    (101, 1, 200.00),
    (102, 2, 300.00),
    (103, 1, 150.00),
    (104, 3, 400.00),
    (105, 2, 250.00);

select * from orders;

-- solution of task 2
SELECT customer_id, avg(total_amount) as average_total_amount
FROM orders
GROUP BY customer_id 
HAVING avg(total_amount) >= 250; 



-- Task 3 ----- 
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    age INT,
    gender VARCHAR(10)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    credits INT
);

INSERT INTO students (student_id, student_name, age, gender)
VALUES
    (1, 'Alice', 22, 'Female'),
    (2, 'Bob', 21, 'Male'),
    (3, 'Charlie', 23, 'Male');

INSERT INTO courses (course_id, course_name, credits)
VALUES
    (101, 'Mathematics', 3),
    (102, 'History', 4),
    (103, 'Physics', 3);

-- Enrollment table with student-course relationships
CREATE TABLE enrollment (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT
);

INSERT INTO enrollment (enrollment_id, student_id, course_id)
VALUES
    (1, 1, 101),
    (2, 1, 102),
    (3, 2, 103),
    (4, 3, 101);

-- solution of task 3

SELECT s.student_name, cr.course_name, cr.credits
FROM students s
JOIN enrollment e on e.student_id = s.student_id
JOIN courses cr on cr.course_id = e.course_id





-- Task -4: -----------
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE salaries (
    emp_id INT,
    salary DECIMAL(10, 2)
);

INSERT INTO employees (emp_id, emp_name, department_id)
VALUES
    (1, 'John Doe', 1),
    (2, 'Jane Smith', 2),
    (3, 'Michael Johnson', 1),
    (4, 'Emily Brown', 3);

INSERT INTO departments (department_id, department_name)
VALUES
    (1, 'HR'),
    (2, 'IT'),
    (3, 'Finance');

INSERT INTO salaries (emp_id, salary)
VALUES
    (1, 50000.00),
    (2, 60000.00),
    (3, 55000.00),
    (4, 52000.00);

--  solution of task 4 :
SELECT d.department_name, avg(s.salary)
FROM employees e 
JOIN departments d on d.department_id=e.department_id
JOIN salaries s on s.emp_id=e.emp_id
GROUP BY d.department_name
ORDER BY avg(s.salary) DESC






--  Task 5 : 
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES
    (101, 1, '2023-01-05', 200.00),
    (102, 2, '2023-01-06', 300.00),
    (103, 1, '2023-02-10', 150.00),
    (104, 3, '2023-02-15', 400.00),
    (105, 2, '2023-03-20', 250.00); 

-- solution of task 5
SELECT to_char(order_date, 'Month') , sum(total_amount), count(*)
from orders 
GROUP BY to_char(order_date, 'Month') 
ORDER BY extract(Month FROM min(order_date));





-- Task 6: 
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT
);

CREATE TABLE salaries (
    emp_id INT,
    salary DECIMAL(10, 2)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO employees (emp_id, emp_name, department_id)
VALUES
    (1, 'John Doe', 1),
    (2, 'Jane Smith', 2),
    (3, 'Michael Johnson', 1),
    (4, 'Emily Brown', 3);

INSERT INTO salaries (emp_id, salary)
VALUES
    (1, 50000.00),
    (2, 60000.00),
    (3, 55000.00),
    (4, 52000.00);

INSERT INTO departments (department_id, department_name)
VALUES
    (1, 'HR'),
    (2, 'IT'),
    (3, 'Finance');

-- Solution of task 6 
SELECT d.department_name , avg(s.salary), count(*) as employee_count
from employees e
JOIN salaries s on s.emp_id=e.emp_id
JOIN departments d on d.department_id=e.department_id
GROUP BY d.department_name 
HAVING count(*) >= 2;





--  Task -7
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    stock_quantity INT
);

INSERT INTO products (product_id, product_name, stock_quantity)
VALUES
    (101, 'Widget A', 20),
    (102, 'Widget B', 10),
    (103, 'Widget C', 15),
    (104, 'Widget D', 5);

-- slution of task 7
SELECT product_name,stock_quantity
FROM products 
WHERE stock_quantity> 5



-- Task 8

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE
);

CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_name VARCHAR(50),
    quantity INT
);

INSERT INTO customers (customer_id, customer_name, city)
VALUES
    (1, 'John Doe', 'New York'),
    (2, 'Jane Smith', 'Los Angeles'),
    (3, 'Michael Johnson', 'Chicago');

INSERT INTO orders (order_id, customer_id, order_date)
VALUES
    (101, 1, '2023-01-05'),
    (102, 2, '2023-02-10'),
    (103, 1, '2023-02-15');

INSERT INTO order_items (item_id, order_id, product_name, quantity)
VALUES
    (1, 101, 'Widget A', 2),
    (2, 101, 'Widget B', 3),
    (3, 102, 'Widget C', 1),
    (4, 103, 'Widget A', 4);

-- solution of Task 8

select c.customer_name, o.order_date, sum(oi.quantity) as total_quantity
from customers c
join orders o on o.customer_id= c.customer_id
join order_items oi on oi.order_id=o.order_id
GROUP BY c.customer_name, o.order_date
ORDER BY o.order_date;


--  Task 9

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    sale_date DATE,
    sale_amount DECIMAL(10, 2)
);

INSERT INTO sales (sale_id, product_id, sale_date, sale_amount)
VALUES
    (1, 101, '2023-01-05', 200.00),
    (2, 102, '2023-01-06', 300.00),
    (3, 101, '2023-02-10', 150.00),
    (4, 103, '2023-02-15', 400.00),
    (5, 102, '2023-03-20', 250.00);

-- solution of task 9 
select product_id, sale_amount
FROM sales 
where sale_amount >= 300;

-- Task 10

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    age INT
);

INSERT INTO students (student_id, student_name, age)
VALUES
    (1, 'Alice', 22),
    (2, 'Bob', 21),
    (3, 'Charlie', 23);

-- solution of task 10
SELECT min(s.age) as Min_age, max(s.age) as Max_age , Round(avg(s.age):: NUMERIC,2) as Avg_age
FROM students s
