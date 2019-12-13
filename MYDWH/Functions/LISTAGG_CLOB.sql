CREATE OR REPLACE NONEDITIONABLE FUNCTION mydwh.listagg_clob(agg VARCHAR2)
RETURN CLOB
parallel_enable aggregate USING listagg_clob_t;
/