CREATE OR REPLACE NONEDITIONABLE procedure mydwh.savepoint_p as
begin
    savepoint in_savepoint;
    insert into animal_tmp values(100, 'Animal 100');
end;
/