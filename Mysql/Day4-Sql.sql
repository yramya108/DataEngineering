-- select * from hr.employees ;

-- -- select count(*) from hr.employees
-- select count(department_id),count(distinct department_id) from hr.employees

-- descriptive statisitcs,aggregate functions, 
-- exploratry data analysis
--select avg(salary),min(salary),max(salary),median(salary),stddev(salary),variance(salary) from hr.employees


-- select department_id,count(*) from hr.employees group by department_id 

-- select department_id,avg(salary) from hr.employees group by department_id


-- ### find the unique job ids for each department id

-- select * from hr.employees

-- select department_id,count(distinct job_id) as uniquejobs from hr.employees group by department_id

-- select department_id,sum(salary) from hr.employees group by department_id;
-- select department_id,avg(salary) from hr.employees group by department_id;
-- select department_id,min(salary) from hr.employees group by department_id;
-- select department_id,max(salary) from hr.employees group by department_id;
-- select department_id,stddev(salary) from hr.employees group by department_id;
-- select department_id,variance(salary) from hr.employees group by department_id;

-- SELECT department_id, 
--        SUM(salary) AS total_salary,
--        AVG(salary) AS avg_salary,
--        MIN(salary) AS min_salary,
--        MAX(salary) AS max_salary,
--        STDDEV(salary) AS salary_stddev,
--        VARIANCE(salary) AS salary_variance
-- FROM hr.employees
-- GROUP BY department_id;


-- select department_id,count(*) from hr.employees group by department_id having count(*)>=5

-- show departments that has avg salary greater than 50000

-- select department_id,avg(Salary) from hr.employees group by department_id having avg(salary) between 4000 and 5000


-- select department_id,avg(Salary) from hr.employees group by department_id having avg(salary)>5000


-- get the department ids where more than 3 job_id roles are exists

-- select department_id,count(distinct job_id) from hr.employees group by department_id having count(distinct job_id)>=3


-- select department_id,count(distinct job_id) from hr.employees group by department_id

--select employee_id,salary from hr.employees order by salary desc


-- select department_id,sum(salary) as totalsales
-- from hr.employees 
-- group by department_id 
-- having sum(salary)>100000
-- order by totalsales asc


-- department where min salary>5000 and max salary>250000 order by min salary asc