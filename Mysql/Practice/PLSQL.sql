
DECLARE
    count_num number := 10;
    a number :=0;
    b number :=1;
BEGIN
    for i in 2..10 loop
        if i=0 then
            dbms_output.PUT_LINE(0);
        elsif i=1 then
            dbms_output.PUT_LINE(1);
        elsif i >=2 then
            dbms_output.PUT_LINE((i-1)+(i-2));
        end if;
        end loop;
end;
print counter 5 times with index
DECLARE
    counter number := 1;
BEGIN  
    while counter <= 5 LOOP
        dbms_output.PUT_LINE('counter val' || counter);
        counter := counter+1;
    end loop;
END;


print even numbers
DECLARE
    cout number := 10;
    i NUMBER := 1;
BEGIN
    for i in 1..cout LOOP
        if mod(i,2) = 0 then
            dbms_output.PUT_LINE('even num' || i);
        end if;
    end loop;
end;

print odd numbers
DECLARE
    cout number := 10;
    i NUMBER := 1;
BEGIN
    while i <= cout loop
        if mod(i,2) != 0 then
            dbms_output.PUT_LINE('odd num' || i);
        end if;
            i :=i+1;
    end loop;
end;


continue and exit

DECLARE
   ind NUMBER := 1;
BEGIN
   WHILE ind <= 5 LOOP
      IF ind = 3 THEN
         ind := ind + 1;
         CONTINUE;
      END IF;

      DBMS_OUTPUT.PUT_LINE('Number: ' || ind);
      ind := ind + 1;
   END LOOP;
END;


DECLARE
   i NUMBER := 1;
BEGIN
   WHILE i <= 5 LOOP
      IF i = 3 THEN
         i := i + 1;
         exit;
      END IF;

      DBMS_OUTPUT.PUT_LINE('Number: ' || i);
      i := i + 1;
   END LOOP;
END;

multiples of 10
DECLARE
   i NUMBER := 1;
BEGIN
   for i in 1..100 loop
        if mod(i,10) =0 then
                DBMS_OUTPUT.PUT_LINE('multiples of 10' || ':'|| i);
        end if;
   END LOOP;
END;

 
