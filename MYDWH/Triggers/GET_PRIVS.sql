CREATE OR REPLACE NONEDITIONABLE TRIGGER mydwh.get_privs
BEFORE GRANT --DDL
ON mydwh.SCHEMA
DISABLE DECLARE
    l_ddl_line_count NUMBER;
    l_privs ORA_NAME_LIST_T;
BEGIN
    l_ddl_line_count := ORA_PRIVILEGE_LIST(l_privs);
    FOR idx IN 1..l_ddl_line_count LOOP
        dbms_output.put_line(idx || ' ' || l_privs(idx));
    END LOOP;
/*exception
    when others then
        dbms_output.put_line('test ' || ORA_PRIVILEGE_LIST(l_privs));*/
end;
/