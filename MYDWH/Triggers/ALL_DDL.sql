CREATE OR REPLACE NONEDITIONABLE trigger mydwh.all_ddl
before ddl
on mydwh.schema
DISABLE begin
    dbms_output.put_line('That is a ' || ora_sysevent);
end;
/