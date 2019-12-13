CREATE TABLE mydwh.tcx_team_projects (
  config_id NUMBER(*,0) NOT NULL,
  project_id NUMBER(*,0) NOT NULL,
  team_project VARCHAR2(255 BYTE) NOT NULL,
  vcs_provider VARCHAR2(255 BYTE),
  vcs_project VARCHAR2(2000 BYTE),
  status CHAR NOT NULL CHECK (STATUS IN ('A','I','D','F','O','U')),
  status_type VARCHAR2(30 BYTE),
  status_by VARCHAR2(128 BYTE) NOT NULL,
  status_timestamp DATE NOT NULL,
  comments VARCHAR2(255 BYTE),
  project_configuration CLOB,
  CONSTRAINT tcx_team_projects_pk PRIMARY KEY (config_id,project_id),
  CONSTRAINT tcx_team_proj_config_fk FOREIGN KEY (config_id) REFERENCES mydwh.tcx_config (config_id)
);