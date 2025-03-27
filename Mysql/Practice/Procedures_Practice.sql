--Procedures

-- create or replace PROCEDURE print_hello is
-- begin
--     DBMS_OUTPUT.PUT_LINE('Hello, World!');
-- end;
-- -- 1. Print Hello World
-- EXEC print_hello;

-- Addition of two numbers
-- create or replace PROCEDURE addNumbers(x in NUMBER, y in NUMBER) is
--     z NUMBER;
-- begin
--     z := x+y;
--     DBMS_OUTPUT.PUT_LINE('addition of two number ' || z);
-- end;


-- EXEC addNumbers(1,3);


-- create or replace PROCEDURE get_employee_name(p_id in number) is
-- v_name hr.employees.emp_name%TYPE;
-- BEGIn
--     SELECT emp_name INTO v_name FROM hr.employees WHERE emp_id = p_id;
--   DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_name);
-- end;
-- exec get_employee_name(101);

-- LOOP example

-- Create or replace procedure forLoop( ind number) is
-- begin
--     for i in 1..ind LOOP
--         dbms_output.put_line('print loop :' || i);
--     end loop;
-- end;
-- exec forLoop(2);

-- Count of employees

-- create or replace procedure EMp_Count is 
-- total number;
-- BEGIN
--     select count(*) into total from hr.employees;
--     dbms_output.put_line('total employees:' || total );
-- end;


-- CREATE OR REPLACE PROCEDURE show_date IS
-- BEGIN
--   DBMS_OUTPUT.PUT_LINE('Today''s Date: ' || SYSDATE);
-- END;


-- WHile loop example
-- create or replace procedure while_loop_exp IS
-- i number := 1;
-- BEGIN
--     while i <= 5 loop
--         DBMS_output.put_line('iterate :' || i);
--         i := i+1;
--     end loop;
-- end;

-- exec while_loop_exp;


-- Use case statement

create or replace procedure grade(marks in number) is
BEGIN
        case 
            when marks >=90 THEN DBMS_OUTPUT.PUT_LINE('Grade: A');
            when marks >=70 THEN DBMS_OUTPUT.PUT_LINE('Grade: B');
            when marks >=60 THEN DBMS_OUTPUT.PUT_LINE('Grade: c');
        else DBMS_OUTPUT.PUT_LINE('Grade: D');
    end case;
end;
exec grade(80);
