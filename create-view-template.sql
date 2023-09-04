
CREATE View 
AS
SELECT emp_name FROM employees


-- complex query , when we need to query from multiple table
CREATE View department_emp_count
AS
SELECT department_name, count(emp_id) from employees e
JOIN departments d on d.department_id=e.department_id
GROUP BY d.department_id


