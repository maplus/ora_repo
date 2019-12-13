CREATE OR REPLACE NONEDITIONABLE TRIGGER mydwh.TCX_UPD_PROJ_TIMESTAMP
  AFTER INSERT OR DELETE OR UPDATE
  ON mydwh.TCX_TEAM_PROJECTS
  REFERENCING OLD AS OLD NEW AS NEW
  FOR EACH ROW
BEGIN
  UPDATE mydwh.TCX_CONFIG
     SET OBJECT_TIMESTAMP = SYSDATE
   WHERE CONFIG_ID = :NEW.CONFIG_ID;
END;
/