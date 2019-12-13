CREATE OR REPLACE NONEDITIONABLE trigger mydwh.after_logon
after logon on mydwh.schema
begin
    insert into logon_log(username, logon_timestamp)
    values(ora_login_user, systimestamp);
    
end;
/