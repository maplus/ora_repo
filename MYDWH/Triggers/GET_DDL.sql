CREATE OR REPLACE NONEDITIONABLE trigger mydwh.get_ddl
before ddl
on mydwh.schema
DISABLE declare
    l_ddl_line_count number;
    l_sql ora_name_LIST_t;
begin
    l_ddl_line_count := ora_sql_txt(l_sql);
    for idx in 1..l_ddl_line_count loop
        dbms_output.put_line(idx || ' ' || l_sql(idx));
    end loop;
    
end;
/