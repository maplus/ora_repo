CREATE OR REPLACE NONEDITIONABLE function mydwh.animal_count_f
    return number result_cache is
    l_ret_val number;
begin
    SELECT COUNT(*)
    into l_ret_val
    FROM animal;
    return l_ret_val;
end;
/