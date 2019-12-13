CREATE OR REPLACE NONEDITIONABLE trigger mydwh.trg_share_dividend
before insert on mydwh.share_dividend
for each row
when (new.share_dividend_id is null)
begin
    :new.share_dividend_id := seq_share_dividend.nextval;
end;
/