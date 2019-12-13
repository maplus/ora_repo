CREATE OR REPLACE NONEDITIONABLE package body mydwh.debug_flags as
    procedure debuggable(p_id number) is
        l_number number := 1;
    begin
        $if debug_flags.show_detail $then
            dbms_output.put_line($$plsql_code_type);
            $if dbms_db_version.ver_le_9 $then
                null;
            $else
                dbms_output.put_line($$plsql_optimize_level);
            $end
        $end
        $if debug_flags.show_params $then
            dbms_output.put_line('p_id ' || p_id);
        $end
        for idx in 1..p_id loop
            l_number := l_number * p_id;
            $if debug_flags.show_loop $then
                dbms_output.put_line(idX || ' l_number ' || l_number);
            $end
        end loop;
    end;
end;
/