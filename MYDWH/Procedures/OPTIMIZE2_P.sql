CREATE OR REPLACE NONEDITIONABLE procedure mydwh.optimize2_p as
    l_number number;
    function call_f return number is
    begin
        return 11;
    end;
begin
    l_number := call_f;
end;
/