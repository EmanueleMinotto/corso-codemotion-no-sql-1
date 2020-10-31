-- sql attuali
insert into contacts (name, phone) values ("Mario Rossi", "0039 123457"); -- poche
select name from contacts; -- tante

-- aggiunta colonne
start transaction;
alter table contacts add column first_name varchar(255) default null, add column last_name varchar(255) default null;
commit;

-- estrarre nomi e cognomi
select substring_index(name, ' ', 1), ltrim(substring(name, position(' ' in name))) from contacts;

-- inizio aggiornamento (M records)
update contacts set first_name = substring_index(name, ' ', 1), last_name = ltrim(substring(name, position(' ' in name)));

-- inversione della priorità
start transaction;
update contacts set first_name = substring_index(name, ' ', 1), last_name = ltrim(substring(name, position(' ' in name))) where first_name is null;
alter table contacts modify column name varchar(255) generated always as (concat(first_name, ' ', last_name)) stored;
commit;

-- cambio della logica delle insert
insert into contacts (first_name, last_name, phone) values ("Mario", "Bianchi", "0039 123458");

-- cambio della logica delle select
select first_name, last_name, concat(first_name, ' ', last_name) as name from contacts;

-- eliminazione della colonna name
-- colonne first_name e last_name non più opzionali
start transaction;
alter table contacts drop column name;
alter table contacts modify column first_name varchar(255) not null, modify column last_name varchar(255) not null;
commit;
