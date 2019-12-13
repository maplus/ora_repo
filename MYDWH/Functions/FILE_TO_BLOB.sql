CREATE OR REPLACE NONEDITIONABLE FUNCTION mydwh.file_to_blob(p_file_name VARCHAR2) RETURN BLOB AS
    dest_loc BLOB := EMPTY_BLOB();
    src_loc BFILE := BFILENAME('PDF_FILES', p_file_name);
BEGIN
    dbms_lob.open(src_loc, dbms_lob.lob_readonly);

    dbms_lob.createtemporary(
        lob_loc => dest_loc,
        CACHE => TRUE,
        dur => dbms_lob.session
    );

    dbms_lob.open(dest_loc, dbms_lob.lob_readwrite);

    dbms_lob.loadfromfile(
        dest_lob => dest_loc,
        src_lob => src_loc,
        amount => dbms_lob.getLength(src_loc)
    );

    dbms_lob.close(dest_loc);
    dbms_lob.close(src_loc);

    RETURN dest_loc;
END file_to_blob;
/