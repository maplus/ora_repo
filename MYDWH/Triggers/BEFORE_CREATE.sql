CREATE OR REPLACE NONEDITIONABLE trigger mydwh.before_create
before create
on mydwh.schema
DISABLE begin
    dbms_output.put_line('You created a ' || ORA_DICT_OBJ_TYPE || 
                            ' object, named ' || ORA_DICT_OBJ_NAME);
end;
/