CREATE OR REPLACE NONEDITIONABLE procedure mydwh.db_prc4(p_animal ANIMAL2%rowtype) as
begin
    dbms_output.put_line(p_animal.animal_name);
end;
/