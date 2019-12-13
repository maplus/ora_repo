CREATE OR REPLACE NONEDITIONABLE procedure mydwh.optimize_p as
    function will_never_get_called_f
        return number as
    begin
        return 11;
    end;
begin
    dbms_output.put_line('Hello');
end;
/