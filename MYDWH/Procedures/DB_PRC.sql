CREATE OR REPLACE NONEDITIONABLE procedure mydwh.db_prc(p_var in varchar2 := 'default') as
begin
    dbms_output.put_line(p_var);
end;
/