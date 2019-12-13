CREATE OR REPLACE NONEDITIONABLE trigger mydwh.animal3_one
before insert on mydwh.animal3
for each row
begin
    :new.animal_id := 33;
    dbms_output.put_line('one');
end;
/