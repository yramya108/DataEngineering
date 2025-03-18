
-- 1. Find the total number of employees in each department.
-- Counts employees for each department using GROUP BY.

-- SELECT DEPARTMENT_ID, COUNT(*) FROM 
-- HR.EMPLOYEES
-- GROUP BY DEPARTMENT_ID

-- 2. Calculate the average salary in each department.
-- Computes the average salary for each department.

-- SELECT DEPARTMENT_ID, avg(SALARY) FROM 
-- HR.EMPLOYEES
-- GROUP BY DEPARTMENT_ID

-- 3. Find the department with the highest total salary.
-- Summarizes total salaries per department and selects the highest one.

-- SELECT DEPARTMENT_ID, sum(salary)as total_Sal FROM 
-- HR.EMPLOYEES
-- GROUP BY DEPARTMENT_ID
-- order by total_Sal DESC
-- fetch first 1 row only

-- 4. Determine the highest and lowest salaries for each job role.
-- Finds the highest and lowest salary within each job role.

-- select job_id, max(salary), min(salary) from hr.employees
-- group by job_id

-- 5. Find the number of employees hired in each year.
-- Extracts year from hire_date and counts employees hired per year.

-- select extract(year from hire_date ) as hire_year, count(*) from 
-- hr.EMPLOYEES group by hire_year

-- 6. Assign a rank to employees based on their salary within each department.
-- Uses RANK() to assign ranks based on salary in each department.

-- select employee_id, salary, rank() over(partition by department_id order by salary) as salary_rank 
-- from hr.employees

-- 7. Find the top 3 highest-paid employees in each department.
-- Uses RANK() to rank employees based on salary and filters top 3.
-- select employee_id, salary,salary_rank from(
-- select employee_id, salary, rank() over(partition by department_id order by salary) as salary_rank 
-- from hr.employees)
-- where salary_rank <=3

-- 8. Identify the second highest salary in each department using DENSE_RANK().
-- Uses DENSE_RANK() to identify employees with the second-highest salary per department.
-- SELECT department_id, employee_id, salary,salary_rank
-- FROM (
--     SELECT department_id, employee_id, salary, 
--            DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
--     FROM hr.employees
-- ) WHERE salary_rank = 2;

-- 9. Compute the cumulative total salary of employees ordered by hire date.
-- Uses SUM() OVER() to create a running total of salaries.

SELECT employee_id, hire_date, salary, 
       SUM(salary) OVER (ORDER BY hire_date) AS cumulative_salary
FROM hr.employees;


-- 10. Assign a row number to each employee in each department.
-- Uses ROW_NUMBER() to assign a unique row number per department.

-- select employee_id, department_id, row_number() over(partition by DEPARTMENT_ID ORDER BY EMPLOYEE_ID) AS ROW_NUM
-- FROM HR.EMPLOYEES

-- 11. Find the salary difference between each employee and the next highest-paid employee.
-- Uses LEAD() to compare an employee's salary with the next highest.

-- SELECT employee_id, salary, hire_date, 
--         LEAD(salary) OVER (ORDER BY salary DESC) - salary AS salary_diff
-- FROM hr.employees;

-- 12. Calculate the previous month’s salary for each employee using LAG().
-- Uses LAG() to get the previous salary entry for each employee.

-- SELECT employee_id, salary, hire_date, 
--        LAG(salary) OVER (PARTITION BY employee_id ORDER BY hire_date) AS prev_salary
-- FROM hr.employees;

-- 13. Identify employees whose salaries increased over time.
-- Uses LAG() to compare an employee's current and previous salaries.

-- SELECT employee_id, hire_date, salary, 
--        LAG(salary) OVER (PARTITION BY employee_id ORDER BY hire_date) AS prev_salary,
--        CASE WHEN salary > LAG(salary) OVER (PARTITION BY employee_id ORDER BY hire_date) 
--             THEN 'Increased' ELSE 'Decreased' END AS salary_trend
-- FROM hr.employees;

-- 14. Find the average salary of employees who joined in each year.
-- Computes average salary grouped by year of hire.

-- select avg(Salary), extract(year from hire_Date) as hire_year from hr.employees 
-- group by hire_year
-- order by hire_year

-- 15. Count the number of employees in each job role.
-- Counts employees for each job role using GROUP BY.

--select job_id, count(*) from hr.employees group by job_id

-- 16. Find the total salary expenditure for each manager's team.
-- Sums salaries of employees under each manager.

-- select manager_id, sum(salary) from hr.employees group by manager_id


-- 17. Find the highest-paid employee in each department.
-- Uses RANK() to find the highest-paid employee in each department.

-- select employee_id, department_id, salary,salary_rank
-- from(select employee_id, department_id, salary, 
-- RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
--     FROM hr.employees
-- ) where salary_rank=1

-- 18. Calculate the running total of salaries for employees hired in each department.
-- Uses SUM() OVER() to compute cumulative salary totals.
-- SELECT department_id, employee_id, salary, 
--        SUM(salary) OVER (PARTITION BY department_id ORDER BY hire_date) AS running_total
-- FROM hr.employees;
-- 19. Find the employees who earn above the average salary of their department.
-- Uses a subquery to filter employees earning above department average.

-- SELECT employee_id, department_id, salary
-- from hr.employees e
-- where salary>(SELECT AVG(salary) FROM hr.employees WHERE department_id = e.department_id)

-- 20. Rank employees within their department based on experience.
-- Uses RANK() to order employees by hire date per department.

-- select employee_id,department_id,rank() over (partition by department_id order by hire_date) as exp_rank
-- from hr.employees

-- 21. Find the difference between each employee’s salary and the department average.
-- Uses AVG() OVER() to compute salary difference from department average.

-- select employee_id, salary, salary - avg(salary) over(partition by department_id) as diff_sal
-- from hr.employees

-- 22. Find the department where the most employees have been hired.
-- Counts employees in each department and selects the highest.

-- select department_id, count(*) as total_hired from hr.employees 
-- GROUP BY department_id
-- ORDER BY total_hired DESC
-- fetch first 1 row only

-- 23. Identify employees who were hired in the same month and year as someone else.
-- Uses COUNT() OVER() to count employees hired in the same month-year.

-- SELECT employee_id, hire_date, 
--        COUNT(*) OVER (PARTITION BY EXTRACT(MONTH FROM hire_date), EXTRACT(YEAR FROM hire_date)) AS same_month_hires
-- FROM hr.employees;

-- 24. Calculate the moving average salary over the last 3 employees ordered by hire date.
-- Uses AVG() OVER() with ROWS BETWEEN for moving average calculation.

-- SELECT employee_id, hire_date, salary, 
--        AVG(salary) OVER (ORDER BY hire_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg_salary
-- FROM hr.employees;

-- 25. Find employees whose salary is greater than that of the average of their manager’s team.
-- Uses a subquery to compare employee salary with manager's team average.
-- SELECT e.employee_id, e.manager_id, e.salary
-- FROM hr.employees e
-- WHERE e.salary > (SELECT AVG(salary) FROM hr.employees WHERE manager_id = e.manager_id);
