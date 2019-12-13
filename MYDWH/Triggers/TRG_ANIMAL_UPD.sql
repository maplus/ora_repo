CREATE OR REPLACE NONEDITIONABLE trigger mydwh.trg_animal_upd
before update on mydwh.animal
references new as new old as old
for each row
begin
    :new.updated_stmp := sysdate;
    :new.updated_by := user;
end;
/