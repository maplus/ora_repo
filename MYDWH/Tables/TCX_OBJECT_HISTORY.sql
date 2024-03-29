CREATE TABLE mydwh.tcx_object_history (
  config_id NUMBER(*,0) NOT NULL,
  project_id NUMBER(*,0) NOT NULL,
  object_id NUMBER(*,0) NOT NULL,
  transaction_id NUMBER(*,0) NOT NULL,
  transaction_type VARCHAR2(30 BYTE) NOT NULL,
  tc_action VARCHAR2(30 BYTE) NOT NULL,
  tc_revision VARCHAR2(30 BYTE) NOT NULL,
  vcs_revision VARCHAR2(30 BYTE),
  vcs_provider VARCHAR2(255 BYTE),
  vcpid NUMBER(*,0),
  vcs_project VARCHAR2(2000 BYTE),
  db_user VARCHAR2(128 BYTE),
  vcs_user VARCHAR2(128 BYTE),
  os_user VARCHAR2(128 BYTE),
  checkout_timestamp DATE,
  checkin_timestamp DATE,
  transaction_timestamp DATE NOT NULL,
  cx_runname VARCHAR2(100 BYTE),
  completed CHAR DEFAULT 'N' NOT NULL CHECK ( COMPLETED IN ('Y','N')),
  comments VARCHAR2(255 BYTE),
  sys_comments VARCHAR2(255 BYTE),
  CONSTRAINT tcx_object_hist_pk PRIMARY KEY (config_id,project_id,object_id,transaction_id),
  CONSTRAINT tcx_objhist_obj_proj_fk FOREIGN KEY (config_id,project_id,object_id) REFERENCES mydwh.tcx_objects (config_id,project_id,object_id)
);