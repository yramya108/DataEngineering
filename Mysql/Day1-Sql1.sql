-- select count(*) from hr.employees


-- #### operators
-- #### inbuilt functions



-- select * from hr.EMPLOYEES

-- select 'data' from dual




-- #### arithmetic operators

-- select 10+5 as addition,
-- 10-5 as subtraction,
-- 10*5 as multiplication,
-- 10/5 as division
--  from dual



-- ### Comparision operators


-- select * from hr.employee where salary>10000;
-- select * from hr.employee where salary<10000;
-- select * from hr.employee where salary>=10000;
-- select * from hr.employee where salary<=10000;
-- select * from hr.employee where salary<>10000;
-- select * from hr.employee where salary=10000;



-- #### logical operators  (and or not)

--  select * From hr.employees where salary>20000 and department_id=90
 -- select * From hr.employees where salary>10000 or department_id=90
--  select * From hr.employees where not department_id=90 

-- select * from hr.employees

-- ### concatenation

-- select first_name || ' ' || last_name  fullname from hr.employees


-- #### Between operator,in ,like operators

--select * from hr.employees where salary between 10000 and 30000 
--- between both boundaries are inclusive



--select 100 between 5 and 15 as  output from dual



-- select * from hr.employees

-- select * from hr.employees where department_id in (90,100,110)

--select * from hr.employees where first_name like 'S%'
-- select * from hr.employees where first_name like '%s'
-- select * from hr.employees where first_name like '%am%'
-- select * from hr.employees where first_name like '__e__'

select * from hr.employees where first_name like 'N%a'