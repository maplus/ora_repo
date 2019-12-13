CREATE OR REPLACE NONEDITIONABLE trigger mydwh.animal3_two
before insert on mydwh.animal3
for each row
follows animal3_one
begin
    if :new.animal_id = 33 then
        :new.animal_id := 66;
    end if;
    dbms_output.put_line('two');
end;
/