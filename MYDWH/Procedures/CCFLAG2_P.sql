CREATE OR REPLACE NONEDITIONABLE procedure mydwh.ccflag2_p(p_id number) is
    l_number number(1) := 1;
begin
    $if $$DEBUG $then
        dbms_output.put_line('Passed in ' || p_id);
    $end
    l_number := l_number * 10;
exception
    when others then
        $if $$DEBUG $then
            dbms_output.put_line('l_number was ' || l_number);
        $end
        raise;
end;
/