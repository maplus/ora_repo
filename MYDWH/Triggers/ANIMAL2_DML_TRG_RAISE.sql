CREATE OR REPLACE NONEDITIONABLE trigger mydwh.animal2_dml_trg_raise
before update or delete on mydwh.animal2
begin
    if updating then
        raise_application_error(-20000, 'Updating not allowed');
    elsif deleting then
        raise_application_error(-20000, 'Deleting not allowed');
    end if;
end;
/