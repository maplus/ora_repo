CREATE OR REPLACE NONEDITIONABLE trigger mydwh.animal2_test_trg
before insert or update or delete on mydwh.animal2
begin
    if inserting then
        dbms_output.put_line('inserting');
    elsif updating then
        dbms_output.put_line('updating');
    elsif deleting then
        dbms_output.put_line('deleting');
    else
        dbms_output.put_line('unknown');
    end if;
end;
/