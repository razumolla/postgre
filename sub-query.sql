
-- 
SELECT * from employees WHERE salary IN(
  SELECT salary from employees WHERE name LIKE '%a%'
)

