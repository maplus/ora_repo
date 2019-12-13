CREATE OR REPLACE NONEDITIONABLE package mydwh.cursors as
    type number_cursor is ref cursor return bunch_of_numbers%rowtype;
    type vc2_10_t is table of varchar2(10);

    function return_table_f(p_curs number_cursor)
        return number_t
        pipelined
        parallel_enable (partition p_curs by range(col1))
        order p_curs by (col1);

    function return_chr_f(p_curs number_cursor)
        return vc2_10_t
        pipelined;
end;
/