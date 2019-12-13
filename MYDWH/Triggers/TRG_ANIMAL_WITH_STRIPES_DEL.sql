CREATE OR REPLACE NONEDITIONABLE trigger mydwh.trg_animal_with_stripes_del
instead of delete on mydwh.animal_with_stripes
declare
    l_animal_id int;
begin
    select animal_id
    into l_animal_id
    from animal
    where animal_name = :old.animal_name;
    
    dbms_output.put_line(l_animal_id);
    
    delete from animal_stripe where animal_id = l_animal_id;
    dbms_output.put_line('animal_stripe ' || sql%rowcount);
    delete from animal where animal_id = l_animal_id;
    dbms_output.put_line('animal ' || sql%rowcount);
end;
/