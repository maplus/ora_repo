CREATE OR REPLACE NONEDITIONABLE trigger mydwh.trg_animal_with_stripes_upd
instead of update on mydwh.animal_with_stripes
declare
    l_animal_id int;
begin
    select animal_id
    into l_animal_id
    from animal
    where animal_name = :new.animal_name;
    
    update animal_stripe
    set stripe_color = :new.stripe_one
    where animal_id = l_animal_id and stripe_color = :old.stripe_one;

    update animal_stripe
    set stripe_color = :new.stripe_two
    where animal_id = l_animal_id and stripe_color = :old.stripe_two;
end;
/