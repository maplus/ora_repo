CREATE TABLE mydwh.animal2 (
  animal_name VARCHAR2(50 BYTE),
  animal_id NUMBER(*,0) NOT NULL,
  CONSTRAINT pk_animal2 PRIMARY KEY (animal_id)
);