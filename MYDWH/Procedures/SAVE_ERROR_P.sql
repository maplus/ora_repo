CREATE OR REPLACE NONEDITIONABLE procedure mydwh.save_error_p(p_prog varchar2, p_err number) is
    pragma autonomous_transaction;
begin
    insert into error_log
    values(p_prog, sysdate, p_err);
    commit; --<<<!!!
end;
/