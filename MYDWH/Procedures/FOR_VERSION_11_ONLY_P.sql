CREATE OR REPLACE NONEDITIONABLE procedure mydwh.for_version_11_only_p as
begin
    $if dbms_db_version.version <> 11 $then
        $error
            'Do not run this on anything except 11'
        $end
    $end
end;
/