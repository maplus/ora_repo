CREATE OR REPLACE NONEDITIONABLE package body mydwh.a_pkg as
    l_var_private int := 12;
    l_var_const_private int := 12;

    procedure a_prc(p_id int) is
    begin
        dbms_output.put_line('p_id ' || p_id);
    end;
    
    function a_fun_private(p_id int) return int is
    begin
        return p_id + l_var_private;
    end;
    
    function a_fun(p_id int) return int is
    begin
        return a_fun_private(p_id);
    end;
end;
/