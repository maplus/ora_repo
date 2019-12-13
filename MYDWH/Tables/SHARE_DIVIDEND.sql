CREATE TABLE mydwh.share_dividend (
  share_dividend_id NUMBER(*,0) NOT NULL,
  share_valor_id NUMBER(*,0) NOT NULL,
  dividend NUMBER NOT NULL,
  dividend_date DATE NOT NULL,
  created_stmp DATE DEFAULT SYSDATE NOT NULL,
  created_by VARCHAR2(50 BYTE) DEFAULT USER NOT NULL,
  CONSTRAINT pk_share_dividend PRIMARY KEY (share_dividend_id),
  CONSTRAINT ui_share_dividend UNIQUE (share_valor_id,dividend,dividend_date),
  CONSTRAINT fk_share_dividend_share_valor_id FOREIGN KEY (share_valor_id) REFERENCES mydwh.share_valor (share_valor_id)
);