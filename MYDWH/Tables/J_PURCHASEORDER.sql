CREATE TABLE mydwh.j_purchaseorder (
  j_purchaseorder_id RAW(16) NOT NULL,
  date_loaded TIMESTAMP WITH TIME ZONE,
  po_document CLOB CONSTRAINT ensure_json_c01 CHECK (po_document IS JSON),
  CONSTRAINT j_purchaseorder_pk PRIMARY KEY (j_purchaseorder_id)
);