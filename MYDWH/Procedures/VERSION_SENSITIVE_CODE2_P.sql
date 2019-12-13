CREATE OR REPLACE NONEDITIONABLE procedure mydwh.version_sensitive_code2_p as
begin
    $if dbms_db_version.ver_le_11 $then
        dbms_output.put_LINE('Version 11 code here');
    $elsif dbms_db_version.ver_le_12 $then
        dbms_output.put_LINE('Version 12 code here');
    $else
        dbms_output.put_LINE('Code only works on 11 and 12');
    $end
end;
/