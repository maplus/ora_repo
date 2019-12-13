CREATE OR REPLACE NONEDITIONABLE procedure mydwh.create_animal(p_id number, p_name varchar2) is
    pragma autonomous_transaction; --<<<!!!
begin
    insert into animal_tmp
    values(p_id, p_name);
    commit;
end;
/