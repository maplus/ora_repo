CREATE OR REPLACE NONEDITIONABLE package mydwh.a_pkg as
    l_var int := 11;
    l_var_const constant int := 7;    
    procedure a_prc(p_id int);
    function a_fun(p_id int) return int;
end;
/