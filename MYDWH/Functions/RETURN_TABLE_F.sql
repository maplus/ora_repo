CREATE OR REPLACE NONEDITIONABLE function mydwh.return_table_f(p_id number) return number_t
    deterministic as
    l_number_t number_t := number_t();
begin
    l_number_t.extend(p_id);
    for idx in 1..l_number_t.count loop
        l_number_t(idx) := idx;
    end loop;
    return l_number_t;
end;
/