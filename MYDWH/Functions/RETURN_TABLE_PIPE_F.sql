CREATE OR REPLACE NONEDITIONABLE function mydwh.return_table_pipe_f(p_id number)
    return number_t pipelined as
begin
    for counter in 1..p_id loop
        pipe row(counter);
    end loop;
    return;
end;
/