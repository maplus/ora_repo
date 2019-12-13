CREATE OR REPLACE NONEDITIONABLE procedure mydwh.db_prc3(p_var_in in varchar2 := 'default',
                                    p_var_out out varchar2) as
begin
    dbms_output.put_line(p_var_in);
    p_var_out := p_var_in || ' 1';
end;
/