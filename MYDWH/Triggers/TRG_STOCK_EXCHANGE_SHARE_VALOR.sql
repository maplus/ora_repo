CREATE OR REPLACE NONEDITIONABLE trigger mydwh.trg_stock_exchange_share_valor
before insert on mydwh.stock_exchange_share_valor
for each row
when (new.stock_exchange_share_valor_id is null)
begin
    :new.stock_exchange_share_valor_id := seq_stock_exchange_share_valor.nextval;
end;
/