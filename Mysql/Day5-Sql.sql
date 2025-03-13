-- -- select employee_id,first_name,salary, rank() over(order by salary ) from hr.employees

-- -- select employee_id,first_name,salary, dense_rank() over(order by salary ) from hr.employees

-- -- select employee_id,first_name,salary, row_number() over(order by salary ) from hr.employees

-- SELECT 
--     employee_id, 
--     first_name, 
--     salary,
--     RANK() OVER (ORDER BY salary DESC) AS rank_salary,
--     DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank_salary,
--     ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_number_salary,
--     LAG(salary) OVER (ORDER BY salary DESC) AS previous_salary,
--     LEAD(salary) OVER (ORDER BY salary DESC) AS next_salary
-- FROM hr.employees;




-- -- select employee_id,DEPARTMENT_ID,job_id,salary,
-- -- rank()over(partition by DEPARTMENT_ID,JOB_ID order by salary desc) from hr.employees



-- -- ##### inline queries  (derived Tables)

-- SELECT EMPLOYEE_ID, salary
-- FROM (SELECT EMPLOYEE_ID, salary FROM hr.employees WHERE salary > 5000)

-- --- subqueries  ### Scalar subuery
-- select employee_id from hr.employees whee salary >(select avg(salary) from hr.employees)


-- --- mutli row subquery

-- select employee_id from hr.employees where department_id in 
-- (select department_id from hr.employees where employee_id=101)

--  -- common table expression (CTE)

-- with cte ( select employee_id ,salary, rank() over(partition by department_id order by salary) as rk 
-- from hr.employees)
-- select employee_id from cte where rk=1




WITH ranksalaries AS (
    SELECT employee_id, department_id,salary, 
           RANK() OVER (PARTITION BY department_id ORDER BY salary) AS rk
    FROM hr.employees
)
SELECT employee_id ,department_id,salary FROM ranksalaries WHERE rk = 1;