CREATE OR REPLACE NONEDITIONABLE trigger mydwh.trg_day_final
before insert on mydwh.day_final
for each row
when (new.day_final_id is null)
begin
    :new.day_final_id := seq_day_final.nextval;
end;
/