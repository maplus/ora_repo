CREATE OR REPLACE NONEDITIONABLE trigger mydwh.trg_share_valor_id
before insert on mydwh.share_valor
for each row
when (new.share_valor_id is null)
begin
    :new.share_valor_id := seq_share_valor.nextval;
end;
/