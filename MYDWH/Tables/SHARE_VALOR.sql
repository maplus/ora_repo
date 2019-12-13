CREATE TABLE mydwh.share_valor (
  share_valor_id NUMBER(*,0) NOT NULL,
  share_valor_name VARCHAR2(4 BYTE) NOT NULL,
  share_name VARCHAR2(30 BYTE) NOT NULL,
  created_stmp DATE DEFAULT SYSDATE NOT NULL,
  created_by VARCHAR2(50 BYTE) DEFAULT USER NOT NULL,
  CONSTRAINT pk_share_valor PRIMARY KEY (share_valor_id),
  CONSTRAINT ui_share_valor UNIQUE (share_valor_name)
);