CREATE TABLE mydwh.factproductinventory (
  productkey NUMBER(*,0) NOT NULL,
  movementdate DATE NOT NULL,
  unitcost NUMBER NOT NULL,
  unitsin NUMBER(*,0) NOT NULL,
  unitsout NUMBER(*,0) NOT NULL,
  unitsbalance NUMBER(*,0) NOT NULL,
  CONSTRAINT fk_factproductinventory_dimproduct FOREIGN KEY (productkey) REFERENCES mydwh.dimproduct (productkey) DISABLE NOVALIDATE
);