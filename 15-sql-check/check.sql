-- controllo sul formato del telefono
alter table contacts add constraint phone_number_format check (regexp_like(phone, '^[0-9]{7,8} [0-9]{3,4}$'));

-- inserimento non valido
insert into contacts (first_name, last_name, phone) values ("Mario", "Rossi", "003912003456");

-- inserimento valido
insert into contacts (first_name, last_name, phone) values ("Mario", "Rossi", "00391200 3456");
