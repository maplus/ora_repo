CREATE OR REPLACE NONEDITIONABLE function mydwh.return_table_pipe2_f(p_id number)
    return number_t pipelined as
begin
    for counter in 1..p_id loop
        pipe row(counter);
    end loop;
    return;
exception
    when no_data_needed then
        dbms_output.put_line('In no data needed.');
    when others then
        dbms_output.put_line('In when others.');
end;
/