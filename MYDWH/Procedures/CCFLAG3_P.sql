CREATE OR REPLACE NONEDITIONABLE procedure mydwh.ccflag3_p(p_id number) is
    l_number number(1) := 1;
begin
    $if $$DEBUG $then
        dbms_output.put_line($$plsql_line || ' of ' || $$plsql_unit);
    $end
    l_number := l_number * 10;
    $if $$DEBUG $then
        dbms_output.put_line($$plsql_line || ' of ' || $$plsql_unit);
    $end
exception
    when others then
        $if $$DEBUG $then
            dbms_output.put_line($$plsql_line || ' of ' || $$plsql_unit);
        $end
        raise;
end;
/