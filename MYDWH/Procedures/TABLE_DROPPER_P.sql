CREATE OR REPLACE NONEDITIONABLE procedure mydwh.table_dropper_p(p_table varchar2) is
    e_not_exists exception;
    pragma exception_init(e_not_exists, -903);
begin
    /*execute immediate 'drop table :1' using p_table;*/
    execute immediate 'drop table ' || p_table;
exception
    when e_not_exists then
        dbms_output.put_line('Table ' || p_table || ' does not exist.');
end;
/