CREATE INDEX mydwh.txt_idx_blob ON mydwh.txt_idx(txt_blob)
INDEXTYPE IS ctxsys."CONTEXT"
PARALLEL 3;