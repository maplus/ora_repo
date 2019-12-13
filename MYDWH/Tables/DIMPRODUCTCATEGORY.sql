CREATE TABLE mydwh.dimproductcategory (
  productcategorykey NUMBER(*,0) NOT NULL,
  productcategoryalternatekey NUMBER(*,0),
  englishproductcategoryname VARCHAR2(50 BYTE) NOT NULL,
  spanishproductcategoryname VARCHAR2(50 BYTE) NOT NULL,
  frenchproductcategoryname VARCHAR2(50 BYTE) NOT NULL,
  CONSTRAINT pk_dimproductcategory_productcategorykey PRIMARY KEY (productcategorykey),
  CONSTRAINT ak_dimproductcategory_productcategoryalternatekey UNIQUE (productcategoryalternatekey)
);