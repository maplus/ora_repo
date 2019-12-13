CREATE OR REPLACE NONEDITIONABLE package mydwh.parallel_pkg as
    -- Needed to give info about types in the ref cursor.
    type number_cursors is ref cursor return bunch_of_numbers%rowtype;
    
    function return_table_range_f(p_refcur number_cursors)
        return number_t
        pipelined
        parallel_enable(partition p_refcur by range(col1))
        order p_refcur by (col1);

    function return_table_hash_f(p_refcur  number_cursors)
        return number_t
        pipelined
        parallel_enable(partition p_refcur by hash(col1))
        cluster p_refcur by (col1);
 end;
/