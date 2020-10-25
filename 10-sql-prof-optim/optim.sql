-- query standard
select * from contacts where phone = "16590424 9843";

-- analisi performance
explain select * from contacts where phone = "16590424 9843";

-- ottimizzazione
create index phone_search on contacts (phone);

-- verifica performance
explain select * from contacts where phone = "16590424 9843";
