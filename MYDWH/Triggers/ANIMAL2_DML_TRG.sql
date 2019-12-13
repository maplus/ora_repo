CREATE OR REPLACE NONEDITIONABLE trigger mydwh.animal2_dml_trg
before delete or update on mydwh.animal2
for each row
begin
    if deleting then
        dbms_output.put_line('Deleting: ' || :old.animal_id || ', ' || :old.animal_name);
    elsif updating then
        dbms_output.put_line('Updating: ' || :old.animal_id || ', ' || :old.animal_name
                                || ' to ' || :new.animal_id || ', ' || :new.animal_name);
    end if;
end;
/