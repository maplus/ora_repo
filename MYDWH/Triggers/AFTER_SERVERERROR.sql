CREATE OR REPLACE NONEDITIONABLE trigger mydwh.after_servererror
after servererror on mydwh.schema -- database
begin
    dbms_output.put_line('User ' || ora_login_user || ' Event ' || ora_sysevent);
    dbms_output.put_line('Error stack levels ' || ora_server_error_depth);
    for idx in 1..ora_server_error_depth loop
        dbms_output.put_line(ora_server_error_depth || ' ' || ora_server_error_msg(idx));
        dbms_output.put_line('Param count ' || ora_server_error_num_params(idx));
        if ora_server_error_num_params(idx) > 0 then
            for idx2 in 1..ora_server_error_num_params(idx) loop
                dbms_output.put_line(ora_server_error_param(idx, idx2));
            end loop;
        end if;
    end loop;
end;
/