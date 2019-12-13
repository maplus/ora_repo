CREATE OR REPLACE NONEDITIONABLE function mydwh.return_table2_f(p_id number)
    return numbers_t as
    l_numbers numbers_t := numbers_t();
begin
    l_numbers.extend(P_id);
    for idx in 1..l_numbers.count loop
        l_numbers(idx) := numbers_o(idx, idx * -1);
    end loop;
    return l_numbers;
end;
/