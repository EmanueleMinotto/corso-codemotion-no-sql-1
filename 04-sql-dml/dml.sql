-- estrarre tutti i contatti
select * from contacts;

-- contatti in ordine alfabetico
select * from contacts order by name asc;

-- ottenere il numero di telefono del 10° contatto
select phone from contacts where id = 10;

-- 11° e 10° contatto hanno lo stesso numero
update contacts set phone = "16301017 6802" where id = 11;

-- quanti numeri abbiamo in rubrica?
select distinct phone from contacts;

-- cercare i contatti con cognome Rossi
select * from contacts where name like "% Rossi";

-- eliminare contatti con cognome Rossi
-- aggiungere il limit per sicurezza
delete from contacts where name like "% Rossi" limit 2;

-- inserire un nuovo contatto
insert into contacts (name, phone) values ("Mario Rossi", "0039 123456");
