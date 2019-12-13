CREATE OR REPLACE NONEDITIONABLE package mydwh.cur_pkg as
    cursor get_animal(p_id int) is
    select * from animal where animal_id = p_id;
end;
/