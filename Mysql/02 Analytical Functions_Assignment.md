# Oracle SQL Analytical and Window Function Queries for Employee Table

```sql
-- 1. Find the total number of hr.employees in each department.
-- Counts hr.employees for each department using GROUP BY.
select department_id, COUNT(*) AS total_employees
FROM hr.employees
GROUP BY department_id;

-- 2. Calculate the average salary in each department.
-- Computes the average salary for each department.
select department_id, AVG(salary) AS avg_salary
FROM hr.employees
GROUP BY department_id;

-- 3. Find the department with the highest total salary.
-- Summarizes total salaries per department and selects the highest one.
select department_id, SUM(salary) AS total_salary
FROM hr.employees
GROUP BY department_id
ORDER BY total_salary DESC
FETCH FIRST 1 ROW ONLY;

-- 4. Determine the highest and lowest salaries for each job role.
-- Finds the highest and lowest salary within each job role.

select job_id, MAX(salary) AS max_salary, MIN(salary) AS min_salary
FROM hr.employees
GROUP BY job_id;

-- 5. Find the number of hr.employees hired in each year.
-- Extracts year from hire_date and counts hr.employees hired per year.
select EXTRACT(YEAR FROM hire_date) AS hire_year, COUNT(*) AS total_employees
FROM hr.employees
GROUP BY EXTRACT(YEAR FROM hire_date)
ORDER BY hire_year;

-- 6. Assign a rank to hr.employees based on their salary within each department.
-- Uses RANK() to assign ranks based on salary in each department.
select department_id, employee_id, salary, 
       RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
FROM hr.employees;

-- 7. Find the top 3 highest-paid hr.employees in each department.
-- Uses RANK() to rank hr.employees based on salary and filters top 3.
select department_id, employee_id, salary
FROM (
    select department_id, employee_id, salary, 
           RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
    FROM hr.employees
) where salary_rank <= 3;

-- 8. Identify the second highest salary in each department using DENSE_RANK().
-- Uses DENSE_RANK() to identify hr.employees with the second-highest salary per department.
select department_id, employee_id, salary
FROM (
    select department_id, employee_id, salary, 
           DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
    FROM hr.employees
) where salary_rank = 2;

-- 9. Compute the cumulative total salary of hr.employees ordered by hire date.
-- Uses SUM() OVER() to create a running total of salaries.
select employee_id, hire_date, salary, 
       SUM(salary) OVER (ORDER BY hire_date) AS cumulative_salary
FROM hr.employees;

-- 10. Assign a row number to each employee in each department.
-- Uses ROW_NUMBER() to assign a unique row number per department.
select department_id, employee_id, 
       ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY employee_id) AS row_num
FROM hr.employees;

-- 11. Find the salary difference between each employee and the next highest-paid employee.
-- Uses LEAD() to compare an employee's salary with the next highest.
select employee_id, salary, 
       LEAD(salary) OVER (ORDER BY salary DESC) - salary AS salary_diff
FROM hr.employees;

-- 12. Calculate the previous month’s salary for each employee using LAG().
-- Uses LAG() to get the previous salary entry for each employee.
select employee_id, salary, hire_date, 
       LAG(salary) OVER (PARTITION BY employee_id ORDER BY hire_date) AS prev_salary
FROM hr.employees;

-- 13. Identify hr.employees whose salaries increased over time.
-- Uses LAG() to compare an employee's current and previous salaries.
select employee_id, hire_date, salary, 
       LAG(salary) OVER (PARTITION BY employee_id ORDER BY hire_date) AS prev_salary,
       CASE WHEN salary > LAG(salary) OVER (PARTITION BY employee_id ORDER BY hire_date) 
            THEN 'Increased' ELSE 'Decreased' END AS salary_trend
FROM hr.employees;

-- 14. Find the average salary of hr.employees who joined in each year.
-- Computes average salary grouped by year of hire.
select EXTRACT(YEAR FROM hire_date) AS hire_year, AVG(salary) AS avg_salary
FROM hr.employees
GROUP BY EXTRACT(YEAR FROM hire_date)
ORDER BY hire_year;

-- 15. Count the number of hr.employees in each job role.
-- Counts hr.employees for each job role using GROUP BY.
select job_id, COUNT(*) AS total_employees
FROM hr.employees
GROUP BY job_id;

-- 16. Find the total salary expenditure for each manager's team.
-- Sums salaries of hr.employees under each manager.
select manager_id, SUM(salary) AS total_team_salary
FROM hr.employees
GROUP BY manager_id;

-- 17. Find the highest-paid employee in each department.
-- Uses RANK() to find the highest-paid employee in each department.
select department_id, employee_id, salary
FROM (
    select department_id, employee_id, salary,
           RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
    FROM hr.employees
) where salary_rank = 1;

-- 18. Calculate the running total of salaries for hr.employees hired in each department.
-- Uses SUM() OVER() to compute cumulative salary totals.
select department_id, employee_id, salary, 
       SUM(salary) OVER (PARTITION BY department_id ORDER BY hire_date) AS running_total
FROM hr.employees;

-- 19. Find the hr.employees who earn above the average salary of their department.
-- Uses a subquery to filter hr.employees earning above department average.
select employee_id, department_id, salary
FROM hr.employees e
where salary > (select AVG(salary) FROM hr.employees where department_id = e.department_id);

-- 20. Rank hr.employees within their department based on experience.
-- Uses RANK() to order hr.employees by hire date per department.
select employee_id, department_id, hire_date, 
       RANK() OVER (PARTITION BY department_id ORDER BY hire_date ASC) AS experience_rank
FROM hr.employees;

-- 21. Find the difference between each employee’s salary and the department average.
-- Uses AVG() OVER() to compute salary difference from department average.
select employee_id, department_id, salary, 
       salary - AVG(salary) OVER (PARTITION BY department_id) AS salary_diff
FROM hr.employees;

-- 22. Find the department where the most hr.employees have been hired.
-- Counts hr.employees in each department and selects the highest.
select department_id, COUNT(*) AS total_hired
FROM hr.employees
GROUP BY department_id
ORDER BY total_hired DESC
FETCH FIRST 1 ROW ONLY;

-- 23. Identify hr.employees who were hired in the same month and year as someone else.
-- Uses COUNT() OVER() to count hr.employees hired in the same month-year.

select employee_id, hire_date, 
       COUNT(*) OVER (PARTITION BY EXTRACT(MONTH FROM hire_date), EXTRACT(YEAR FROM hire_date)) AS same_month_hires
FROM hr.employees;

-- 24. Calculate the moving average salary over the last 3 hr.employees ordered by hire date.
-- Uses AVG() OVER() with ROWS BETWEEN for moving average calculation.
select employee_id, hire_date, salary, 
       AVG(salary) OVER (ORDER BY hire_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg_salary
FROM hr.employees;

-- 25. Find hr.employees whose salary is greater than that of the average of their manager’s team.
-- Uses a subquery to compare employee salary with manager's team average.
select e.employee_id, e.manager_id, e.salary
FROM hr.employees e
where e.salary > (select AVG(salary) FROM hr.employees where manager_id = e.manager_id);
