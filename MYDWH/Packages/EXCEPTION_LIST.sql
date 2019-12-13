CREATE OR REPLACE NONEDITIONABLE package mydwh.exception_list as
    e_resource_busy exception;
    pragma exception_init(e_resource_busy, -54);
    e_not_serializable exception;
    pragma exception_init(e_not_serializable, -8177);
    e_bad_savepoint exception;
    pragma exception_init(e_bad_savepoint, -1086);
end;
/