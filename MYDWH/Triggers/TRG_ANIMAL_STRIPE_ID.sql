CREATE OR REPLACE NONEDITIONABLE trigger mydwh.trg_animal_stripe_id
before insert ON mydwh.animal_stripe
REFERENCING NEW AS NEW OLD AS OLD
for each row
WHEN (new.animal_stripe_id is null)
begin
    :new.animal_stripe_id := seq_animal_stripe_id.nextval;
end;
/