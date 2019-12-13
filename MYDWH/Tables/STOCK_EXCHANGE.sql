CREATE TABLE mydwh.stock_exchange (
  stock_exchange_id NUMBER(*,0) NOT NULL,
  stock_exchange_name VARCHAR2(4 BYTE) NOT NULL,
  created_stmp DATE DEFAULT SYSDATE NOT NULL,
  created_by VARCHAR2(50 BYTE) DEFAULT USER NOT NULL,
  CONSTRAINT pk_stock_exchange PRIMARY KEY (stock_exchange_id),
  CONSTRAINT ui_stock_exchange UNIQUE (stock_exchange_name)
);