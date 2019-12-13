CREATE OR REPLACE NONEDITIONABLE trigger mydwh.animal2_dml_trg_raise2
before update of animal_id on mydwh.animal2
referencing OLD as old_rec NEW as new_rec
for each row
when (old_rec.animal_id is null or old_rec.animal_id <= 0)
begin
    raise_application_error(-20000, 'Updating for ' || :old_rec.animal_id || ' not allowed');
end;
/