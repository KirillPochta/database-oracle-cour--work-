/
set timing on serveroutput on;
DECLARE 
   VARI INT :=0;
  BEGIN
       DBMS_OUTPUT.ENABLE (buffer_size => null) ;
       WHILE VARI != 100000
        LOOP    
            AddNewCOUNTRY(TO_CHAR(VARI),VARI);
            VARI := VARI +1;
        END LOOP;
 END; 
/
COMMIT;
SELECT COUNT(*) FROM COUNTRY;
/
declare
    t1 number := dbms_utility.get_time();
begin
    for r in (select * from COUNTRY where ID_COUNTRY > 5000 and ID_COUNTRY < 7000) loop null; end loop; 
    dbms_output.put_line('query elapsed: '||(dbms_utility.get_time() - t1)/100); 
end;
/
CREATE INDEX ID_COUNTRY ON COUNTRY(ID_COUNTRY, NAME);
/
declare
    t1 number := dbms_utility.get_time();
begin
    for r in (select * from COUNTRY where ID_COUNTRY > 5000 and ID_COUNTRY < 7000) loop null; end loop; 
    dbms_output.put_line('query elapsed: '||(dbms_utility.get_time() - t1)/100); 
end;

drop INDEX ID_COUNTRY ;


DELETE COUNTRY;

