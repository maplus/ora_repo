CREATE TABLE mydwh.animal_stripe (
  animal_stripe_id NUMBER(*,0) NOT NULL,
  animal_id NUMBER(*,0) NOT NULL,
  stripe_color VARCHAR2(30 BYTE) NOT NULL,
  CONSTRAINT pk_animal_stripe PRIMARY KEY (animal_stripe_id),
  CONSTRAINT fk_animal_stripe FOREIGN KEY (animal_id) REFERENCES mydwh.animal (animal_id)
);