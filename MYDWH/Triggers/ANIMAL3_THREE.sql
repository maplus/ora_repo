CREATE OR REPLACE NONEDITIONABLE trigger mydwh.animal3_three
before insert on mydwh.animal3
for each row
follows animal3_two
begin
    if :new.animal_id = 66 then
        :new.animal_id := 99;
    end if;
    dbms_output.put_line('three');
end;
/