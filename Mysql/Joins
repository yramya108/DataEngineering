-- 1.retrieve employee_names and their department_names using inner join
-- select * from hr.employees
-- select e.employee_id,e.first_name,d.department_name
-- from hr.employees e
-- inner join hr.departments d on d.department_id=e.department_id

-- 2.retrieve all employees and their respective department names (including those without a department) using left join
-- select e.employee_id,e.first_name,d.department_name
-- from hr.employees e
-- left join hr.departments d on e.department_id=d.department_id

-- 3.retrieve all departments and their respective employee names (including those without a employees) using right join
-- select e.employee_id,e.first_name,d.department_name
-- from hr.employees e
-- right join hr.departments d on e.department_id=d.department_id

-- 4.retrieve all employees and their  department names  using full outer join
-- select e.employee_id,e.first_name,d.department_name
-- from hr.employees e
-- full outer join hr.departments d on e.department_id=e.department_id

-- 5.retrieve employees who do not belong to any department using left join with null check or left outer join
-- select e.employee,e.first_name
-- from hr.employees e
-- left join hr.departments d on e.department_id=d.DEPARTMENT_ID
-- where d.department_id is null

-- 6.retrieve departments that have no emplyees using right outer join with null check
-- select d.department_id,d.department_name
-- from hr.employees e
-- right join hr.departments d on e.department_id=d.DEPARTMENT_ID
-- where e.employee_id is null

-- 7. Doubt
-- 8.retrieve employees along with job title suing inner join
-- select e.employee_id,e.first_name,j.job_title
-- from hr.employees e
-- inner join hr.jobs j on e.job_id=j.job_id

-- select * from hr.locations
-- 9.retrieve employee along with the location of thier department using inner join
-- select e.employee_id,e.first_name,l.city
-- from hr.employees e
-- inner join hr.departments d on e.department_id=d.DEPARTMENT_ID
-- inner join hr.locations l on d.location_id=l.location_id

-- 10. Doubt
-- retrieve employees who have not assigned to any project using left join
-- select e.employee_id,e.first_name
-- from hr.employees e
-- left join

-- 20.retrieve employees who earn more than their departments avg salary using inner join and a subquery
-- select e.employee_id,e.first_name,e.salary
-- from hr.EMPLOYEES e
-- inner join hr.departments d on e.department_id=d.DEPARTMENT_ID
-- where e.salary >(select avg(salary) from hr.employees where department_id=e.department_id)

-- 24.retrieve employees who work in a city where their department is located using inner join
-- select e.employee_id,e.first_name,d.department_id,l.city
-- from hr.employees e
-- inner join hr.departments d on d.department_id = e.DEPARTMENT_ID
-- inner join hr.locations l on d.location_id=l.location_id

-- 27.retrieve employees and their departments names where employees belong to a specific region using inner join
select * from hr.locations
