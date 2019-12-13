CREATE TABLE mydwh.stock_exchange_share_valor (
  stock_exchange_share_valor_id NUMBER(*,0) NOT NULL,
  stock_exchange_id NUMBER(*,0) NOT NULL,
  share_valor_id NUMBER(*,0) NOT NULL,
  created_stmp DATE DEFAULT SYSDATE NOT NULL,
  created_by VARCHAR2(50 BYTE) DEFAULT USER NOT NULL,
  CONSTRAINT pk_stock_exchange_share_valor PRIMARY KEY (stock_exchange_share_valor_id),
  CONSTRAINT ui_stock_exchange_share_valor UNIQUE (stock_exchange_id,share_valor_id),
  CONSTRAINT fk_stock_exchange_share_valor_share_valor_id FOREIGN KEY (share_valor_id) REFERENCES mydwh.share_valor (share_valor_id),
  CONSTRAINT fk_stock_exchange_share_valor_stock_exchange_id FOREIGN KEY (stock_exchange_id) REFERENCES mydwh.stock_exchange (stock_exchange_id)
);