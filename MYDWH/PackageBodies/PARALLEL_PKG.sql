CREATE OR REPLACE NONEDITIONABLE package body mydwh.parallel_pkg as
    function return_table_range_f(p_refcur  number_cursors)
        return number_t
        pipelined
        parallel_enable(partition p_refcur by range(col1))
        order p_refcur by (col1) as
        l_number number;
    begin
        loop fetch p_refcur into l_number;
            exit when p_refcur%notfound;
            pipe row(l_number);
        end loop;
    end;
    
    function return_table_hash_f(p_refcur  number_cursors)
        return number_t
        pipelined
        parallel_enable(partition p_refcur by hash(col1))
        cluster p_refcur by (col1) as
        l_number number;
    begin
        loop fetch p_refcur into l_number;
            exit when p_refcur%notfound;
            pipe row(l_number);
        end loop;
    end;
end;
/