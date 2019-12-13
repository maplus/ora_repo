CREATE OR REPLACE NONEDITIONABLE function mydwh.reverser_f(p_str varchar2) return varchar2 is
    l_ret_val varchar2(100);
begin
    for idx in reverse 1..length(p_str) loop
        l_ret_val := l_ret_val || substr(p_str, idx, 1);
        dbms_output.put_line(idx || ', ' || l_ret_val);
    end loop;
    return l_ret_val;
end;
/