CREATE OR REPLACE NONEDITIONABLE procedure mydwh.db_prc2(p_var in out varchar2 /*:= 'default' -- OUT and IN OUT formal parameters may not have default expressions*/) as
begin
    dbms_output.put_line(p_var);
    p_var := p_var || ' 1';
end;
/