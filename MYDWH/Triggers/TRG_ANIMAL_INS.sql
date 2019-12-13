CREATE OR REPLACE NONEDITIONABLE trigger mydwh.trg_animal_ins
before insert on mydwh.animal
REFERENCING NEW AS NEW OLD AS OLD
for each row
when (new.animal_id is null)
begin
    :new.animal_id := seq_animal_id.nextval;
/* BAD DESIGN >>> use default values instead!!!
              >>> & the creator fields should also be filed when animal_id is not null
    :new.created_stmp := sysdate;
    :new.created_by := user;
*/
end;

-- https://stackoverflow.com/questions/1614233/is-there-an-automatic-modification-time-stamp-type-for-oracle-columns
/