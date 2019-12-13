CREATE INDEX mydwh.txt_idx_clob ON mydwh.txt_idx(txt_clob)
INDEXTYPE IS ctxsys."CONTEXT"
PARAMETERS ('SYNC(ON COMMIT)');