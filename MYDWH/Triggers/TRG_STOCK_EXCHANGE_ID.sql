CREATE OR REPLACE NONEDITIONABLE trigger mydwh.trg_stock_exchange_id
before insert on mydwh.stock_exchange
for each row
when (new.stock_exchange_id is null)
begin
    :new.stock_exchange_id := seq_stock_exchange.nextval;
end;
/