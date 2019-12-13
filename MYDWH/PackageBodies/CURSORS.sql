CREATE OR REPLACE NONEDITIONABLE package body mydwh.cursors as
    function return_table_f(p_curs number_cursor)
        return number_t
        pipelined
        parallel_enable (partition p_curs by range(col1))
        order p_curs by (col1) as
        l_number number;
    begin
        loop fetch p_curs into l_number;
            exit when p_curs%notfound;
            pipe row(l_number);
        end loop;
    end;
    
    function return_chr_f(p_curs number_cursor)
        return vc2_10_t
        pipelined as
        l_vc2_10 varchar2(10);
    begin
        loop fetch p_curs into l_vc2_10;
            exit when p_curs%notfound;
            pipe row(chr(l_vc2_10));
        end loop;
    end;
end;
/