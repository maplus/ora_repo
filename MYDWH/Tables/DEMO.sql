CREATE TABLE mydwh.demo (
  "E" NUMBER(*,0) CONSTRAINT ck_demo_less CHECK ("E" < 11),
  "TEST" VARCHAR2(1 BYTE)
);