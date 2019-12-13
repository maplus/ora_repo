CREATE TABLE mydwh.day_final (
  day_final_id NUMBER(*,0) NOT NULL,
  share_valor_id NUMBER(*,0) NOT NULL,
  score NUMBER NOT NULL,
  score_day DATE NOT NULL,
  created_stmp DATE DEFAULT SYSDATE NOT NULL,
  created_by VARCHAR2(50 BYTE) DEFAULT USER NOT NULL,
  CONSTRAINT pk_day_final_id PRIMARY KEY (day_final_id),
  CONSTRAINT ui_day_final UNIQUE (share_valor_id,score,score_day),
  CONSTRAINT fk_day_final_share_valor_id FOREIGN KEY (share_valor_id) REFERENCES mydwh.share_valor (share_valor_id)
);