CREATE OR REPLACE NONEDITIONABLE trigger mydwh.animal3_compound
for update on mydwh.animal3
compound trigger
    l_var int := 1;

    before statement is
    begin
        dbms_output.put_line(l_var || '. Update compound before stmt');
        l_var := l_var + 1;
    end before statement;
    before each row is
    begin
        dbms_output.put_line(l_var || '. Update compound before each row');
        l_var := l_var + 1;
    end before each row;
    after each row is
    begin
        dbms_output.put_line(l_var || '. Update compound after each row');
        l_var := l_var + 1;
    end after each row;
    after statement is
    begin
        dbms_output.put_line(l_var || '. Update compound after stmt');
        l_var := l_var + 1;
   end after statement;
end;
/