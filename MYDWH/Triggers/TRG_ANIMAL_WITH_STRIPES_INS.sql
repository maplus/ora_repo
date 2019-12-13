CREATE OR REPLACE NONEDITIONABLE trigger mydwh.trg_animal_with_stripes_ins
instead of insert on mydwh.animal_with_stripes
declare
    l_animal_id int;
begin
    l_animal_id := seq_animal_id.nextval;

    insert into animal(animal_id, animal_name)
    values(l_animal_id, :new.animal_name);
    
    insert into animal_stripe(animal_id, stripe_color)
    values(l_animal_id, :new.stripe_one);
    
    insert into animal_stripe(animal_id, stripe_color)
    values(l_animal_id, :new.stripe_two);
end;
/