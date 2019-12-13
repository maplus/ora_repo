CREATE OR REPLACE NONEDITIONABLE function mydwh.name_jumble_f return name_jumble_t
    pipelined as
begin
    for l_animal in (select * from animal_tmp) loop
        pipe row(
            name_jumble_o(
                l_animal.animal_name,
                reverser_f(l_animal.animal_name)
            )
        );
    end loop;
end;
/