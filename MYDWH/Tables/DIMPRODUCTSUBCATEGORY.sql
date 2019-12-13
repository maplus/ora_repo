CREATE TABLE mydwh.dimproductsubcategory (
  productsubcategorykey NUMBER(*,0) NOT NULL,
  productsubcategoryalternatekey NUMBER(*,0),
  englishproductsubcategoryname VARCHAR2(50 BYTE) NOT NULL,
  spanishproductsubcategoryname VARCHAR2(50 BYTE) NOT NULL,
  frenchproductsubcategoryname VARCHAR2(50 BYTE) NOT NULL,
  productcategorykey NUMBER(*,0) NOT NULL,
  CONSTRAINT pk_dimproductsubcategory_productsubcategorykey PRIMARY KEY (productsubcategorykey),
  CONSTRAINT ak_dimproductsubcategory_productsubcategoryalternatekey UNIQUE (productsubcategoryalternatekey),
  CONSTRAINT fk_dimproductsubcategory_dimproductcategory FOREIGN KEY (productcategorykey) REFERENCES mydwh.dimproductcategory (productcategorykey)
);