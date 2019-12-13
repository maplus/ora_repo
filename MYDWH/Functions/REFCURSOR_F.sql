CREATE OR REPLACE NONEDITIONABLE function mydwh.refcursor_f return sys_refcursor is
    l_refcur sys_refcursor;
begin
    open l_refcur for select * from animal;
    return l_refcur;
end;
/