CREATE OR REPLACE NONEDITIONABLE TRIGGER mydwh.TCX_CONFIG_TIMESTAMP_TRG
    BEFORE INSERT
       OR UPDATE
    ON mydwh.TCX_CONFIG
    FOR EACH ROW
    BEGIN
      :NEW.CONFIG_TIMESTAMP := SYSDATE;
END;
/