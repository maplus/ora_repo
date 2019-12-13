CREATE TABLE mydwh.animal (
  animal_id NUMBER(*,0) NOT NULL,
  animal_name VARCHAR2(50 BYTE) NOT NULL,
  created_stmp DATE DEFAULT sysdate NOT NULL,
  created_by VARCHAR2(50 BYTE) DEFAULT user NOT NULL,
  updated_stmp DATE,
  updated_by VARCHAR2(50 BYTE),
  animal_species VARCHAR2(30 BYTE),
  CONSTRAINT pk_animal PRIMARY KEY (animal_id),
  CONSTRAINT ui_animal UNIQUE (animal_name)
);