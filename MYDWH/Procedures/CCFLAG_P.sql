CREATE OR REPLACE NONEDITIONABLE procedure mydwh.ccflag_p(p_id number) is
    l_number number;
begin
    l_number := p_id;
    $if $$double_everything $then
        l_number := l_number * 2;
    $end
    dbms_output.put_line(l_number);
end;
/