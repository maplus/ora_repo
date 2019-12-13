CREATE TABLE mydwh.tcx_config (
  config_id NUMBER(*,0) NOT NULL,
  config_description VARCHAR2(255 BYTE) NOT NULL,
  config_timestamp DATE,
  object_timestamp DATE,
  dbid NUMBER,
  dbname VARCHAR2(255 BYTE),
  status CHAR NOT NULL CHECK (STATUS IN ('A','I','D','F','O','U')),
  status_type VARCHAR2(30 BYTE),
  status_by VARCHAR2(128 BYTE) NOT NULL,
  status_timestamp DATE NOT NULL,
  enforce_dblocks CHAR DEFAULT 'N' NOT NULL CHECK (ENFORCE_DBLOCKS IN ('Y','N')),
  tc_obj_store CLOB,
  comments VARCHAR2(255 BYTE),
  CONSTRAINT tcx_config_pk PRIMARY KEY (config_id)
);