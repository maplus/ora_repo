CREATE OR REPLACE NONEDITIONABLE TYPE mydwh.listagg_clob_t AS OBJECT(
    t_varchar2 VARCHAR2(32767),
    t_clob CLOB,
    STATIC FUNCTION odciaggregateinitialize(sctx IN OUT listagg_clob_t) RETURN NUMBER,
    MEMBER FUNCTION odciaggregateiterate(self IN OUT listagg_clob_t, a_val VARCHAR2) RETURN NUMBER,
    MEMBER FUNCTION odciaggregateterminate(self IN OUT listagg_clob_t, returnvalue OUT CLOB, flags IN NUMBER) RETURN NUMBER,
    MEMBER FUNCTION odciaggregatemerge(self IN OUT listagg_clob_t, ctx2 IN OUT listagg_clob_t) RETURN NUMBER
)
/
CREATE OR REPLACE TYPE BODY mydwh.listagg_clob_t IS
    STATIC FUNCTION odciaggregateinitialize(sctx IN OUT listagg_clob_t)
    RETURN NUMBER IS
    BEGIN
        sctx := listagg_clob_t(NULL, NULL);
        RETURN odciconst.success;
    END;

    MEMBER FUNCTION odciaggregateiterate(self IN OUT listagg_clob_t, a_val VARCHAR2)
    RETURN NUMBER IS
        PROCEDURE add_val(p_val VARCHAR2) IS
        BEGIN
            IF NVL(LENGTHB(self.t_varchar2), 0) + LENGTHB(p_val) <= 4000 THEN
            -- Strange limit, the max size of self.t_varchar2 is 29993
            -- If you exceeds this number you get ORA-22813: operand value exceeds system limits
            -- with 29993 you get JSON-output as large 58894 bytes
            -- with 4000 you get JSON-output as large 1063896 bytes, probably max more
                IF self.t_varchar2 IS NULL THEN
                    self.t_varchar2 := self.t_varchar2 || p_val;
                ELSE
                    self.t_varchar2 := self.t_varchar2 || ',' || p_val;
                END IF;
            ELSE
                IF self.t_clob IS NULL THEN
                    dbms_lob.createtemporary(self.t_clob, true, dbms_lob.call);
                    dbms_lob.writeappend(self.t_clob, LENGTH(self.t_varchar2), self.t_varchar2);
                ELSE
                    dbms_lob.writeappend(self.t_clob, LENGTH(self.t_varchar2 +1), ','||self.t_varchar2);
                END IF;
                self.t_varchar2 := p_val;
            END IF;
        END;
    BEGIN
        add_val(a_val);
        RETURN odciconst.success;
    END;

    MEMBER FUNCTION odciaggregateterminate(self IN OUT listagg_clob_t, returnvalue OUT CLOB, flags IN NUMBER)
    RETURN NUMBER IS
    BEGIN
        IF self.t_clob IS NULL THEN
            dbms_lob.createtemporary(self.t_clob, TRUE, dbms_lob.call );
        END IF;
        IF self.t_varchar2 IS NOT NULL THEN
            dbms_lob.writeappend(self.t_clob, LENGTH(self.t_varchar2), self.t_varchar2);
        END IF;
        returnvalue := self.t_clob;
        RETURN odciconst.success;
    END;

    MEMBER FUNCTION odciaggregatemerge(self IN OUT listagg_clob_t, ctx2 IN OUT listagg_clob_t)
    RETURN NUMBER
    IS
    BEGIN
        IF self.t_clob IS NULL THEN
            dbms_lob.createtemporary( self.t_clob, TRUE, dbms_lob.call );
        END IF;
        IF self.t_varchar2 IS NOT NULL THEN
            dbms_lob.writeappend( self.t_clob, LENGTH( self.t_varchar2 ), self.t_varchar2 );
        END IF;
        IF ctx2.t_clob IS NOT NULL THEN
            dbms_lob.append( self.t_clob, ctx2.t_clob );
            dbms_lob.freetemporary( ctx2.t_clob );
        END IF;
        IF ctx2.t_varchar2 IS NOT NULL THEN
            dbms_lob.writeappend( self.t_clob, LENGTH( ctx2.t_varchar2 ), ctx2.t_varchar2 );
            ctx2.t_varchar2 := NULL;
        END IF;
        RETURN odciconst.success;
    END;
END;
/