create or replace function ageLimit(age number) return varchar2 IS
BEGIN
    if age >= 18 then
        return 'yes';
    else
        return 'no';
    end if;
end; 

select ageLimit(20) from dual;

--Factorial of  num

CREATE OR REPLACE FUNCTION factorial(n number)
return number is
    output number := 1;
BEGIN
    for i in 1..n loop
        output := output * i;
    end loop;
    return output;
end; 

select factorial(5) from dual;

CREATE OR REPLACE FUNCTION add_numbers(p_num1 NUMBER, p_num2 NUMBER) RETURN NUMBER IS
BEGIN
  RETURN p_num1 + p_num2;
END;

--Write a function to return fullName of employee

create or replace function FULL_NAME(emp_id number) return varchar2 is 
fullname varchar2(100);
BEGIN
    
    select first_name||last_name into fullname from hr.employees where employee_id =id;
    return fullname;
end;
select FULL_NAME(101) from dual;

--write a function to find age if we given dob
it is throwing error, not able to get the diff of age
create or replace function AgeFun(dob varchar) return number is 
    v_age NUMBER;
    v_date DATE := TO_DATE('2025-03-21', 'YYYY-MM-DD'); -- Replace with your date
BEGIN
    v_year := EXTRACT(YEAR FROM v_date);
    --DBMS_OUTPUT.PUT_LINE('The extracted year is: ' || v_year);
    v_age := extract(year from GETDATE());
    v_age := v_year - v_age;
    return v_age;
END;
select AgeFun('2023-11-23') from dual;










