CREATE TABLE mydwh.employee (
  employee_id NUMBER(*,0) NOT NULL,
  firstname VARCHAR2(50 BYTE) NOT NULL,
  lastname VARCHAR2(50 BYTE) NOT NULL,
  salesterritory_id NUMBER(*,0),
  salary NUMBER
);