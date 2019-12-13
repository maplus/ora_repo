CREATE OR REPLACE NONEDITIONABLE function mydwh.return_table_paral_f(p_refcur sys_refcursor)
    return number_t
    pipelined
    parallel_enable(partition p_refcur by any) as
    l_number number;
begin
    loop fetch p_refcur into l_number;
        exit when p_refcur%NOTFOUND;
        PIPE ROW(l_number);
    end loop;
end;
/