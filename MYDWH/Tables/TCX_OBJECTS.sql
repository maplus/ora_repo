CREATE TABLE mydwh.tcx_objects (
  config_id NUMBER(*,0) NOT NULL,
  project_id NUMBER(*,0) NOT NULL,
  object_id NUMBER(*,0) NOT NULL,
  object_type VARCHAR2(30 BYTE) NOT NULL,
  object_owner VARCHAR2(128 BYTE) NOT NULL,
  object_name VARCHAR2(128 BYTE) NOT NULL,
  object_source_filename VARCHAR2(300 BYTE) NOT NULL,
  vcs_project VARCHAR2(2000 BYTE),
  team_project VARCHAR2(255 BYTE) NOT NULL,
  vcs_source_filename VARCHAR2(2000 BYTE) NOT NULL,
  number_of_locks NUMBER(*,0) NOT NULL CHECK (NUMBER_OF_LOCKS >= 0),
  exclusive_lock CHAR NOT NULL CHECK (EXCLUSIVE_LOCK IN ('Y','N')),
  last_checkout_dbuser VARCHAR2(128 BYTE),
  last_checkout_vcsuser VARCHAR2(128 BYTE),
  last_checkout_osuser VARCHAR2(128 BYTE),
  last_checkout_timestamp DATE,
  last_checkout_vcs_revision VARCHAR2(30 BYTE),
  last_checkout_tc_revision VARCHAR2(30 BYTE) NOT NULL,
  last_checkout_comments VARCHAR2(200 BYTE),
  last_checkin_dbuser VARCHAR2(128 BYTE),
  last_checkin_vcsuser VARCHAR2(128 BYTE),
  last_checkin_osuser VARCHAR2(128 BYTE),
  last_checkin_vcs_revision VARCHAR2(30 BYTE),
  last_checkin_tc_revision VARCHAR2(30 BYTE) NOT NULL,
  last_checkin_timestamp DATE,
  last_checkin_comments VARCHAR2(200 BYTE),
  status CHAR NOT NULL CHECK (STATUS IN ('A','I','D','F','O','U')),
  status_type VARCHAR2(30 BYTE),
  status_by VARCHAR2(128 BYTE) NOT NULL,
  status_timestamp DATE NOT NULL,
  object_atttributes CLOB,
  comments VARCHAR2(255 BYTE),
  CONSTRAINT tcx_objects_pk PRIMARY KEY (config_id,project_id,object_id),
  CONSTRAINT tcx_tc_obj_team_proj_fk FOREIGN KEY (config_id,project_id) REFERENCES mydwh.tcx_team_projects (config_id,project_id)
);