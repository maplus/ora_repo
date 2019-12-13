CREATE OR REPLACE NONEDITIONABLE package mydwh.debug_flags as
    show_params constant boolean :=  true;
    show_loop constant boolean := true;
    show_detail constant boolean := true;
    
    procedure debuggable(p_id number);
end;
/