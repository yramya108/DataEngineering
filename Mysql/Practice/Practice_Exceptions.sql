CREATE OR REPLACE PROCEDURE validate_age(p_age IN NUMBER) IS
BEGIN
  IF p_age < 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Invalid age provided');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Age is valid');
  END IF;
END;

exec validate_age(-1);


--Raise exception

create or replace procedure cust_exception is
    e_custom exception;
BEGIN
    raise e_custom;
exception
    when e_custom then
        DBMS_OUTPUT.PUT_LINE('Cust exception raised');
end;

exec cust_exception;


