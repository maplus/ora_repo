CREATE OR REPLACE NONEDITIONABLE function mydwh.ascii_animal_f
    return animal_t as
    l_animal_t animal_t := animal_t();
    l_animal_ascii varchar2(100);
begin
    for l_animal in (select * from animal) loop
        l_animal_ascii := null;
        for idx in 1..length(l_animal.animal_name) loop
            l_animal_ascii := l_animal_ascii || ascii(substr(l_animal.animal_name, idx, 1));
        end loop;
        
        l_animal_t.extend;
        l_animal_t(l_animal_t.last) := animal_o(l_animal.animal_id, l_animal.animal_name, l_animal_ascii);
    end loop;
    return l_animal_t;
end;
/