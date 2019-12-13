CREATE OR REPLACE NONEDITIONABLE trigger mydwh.no_ddl
before ddl
on mydwh.schema
DISABLE begin
    --raise_application_error(-20000, 'no ddl allowed');
    dbms_output.put_line('you should not execute ddl...');
end;
/