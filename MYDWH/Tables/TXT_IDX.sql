CREATE TABLE mydwh.txt_idx (
  txt_id NUMBER(*,0) NOT NULL,
  txt_v2 VARCHAR2(4000 BYTE),
  txt_clob CLOB,
  txt_blob BLOB,
  CONSTRAINT txt_idx_pk PRIMARY KEY (txt_id)
);