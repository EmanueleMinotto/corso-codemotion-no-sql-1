-- totale contatti
select count(id) from contacts;

-- totale dei numeri salvati
select count(distinct phone) from contacts;

-- contatti che hanno scritto più messaggi
select count(c.id) as totale, c.id, c.name from messages m join contacts c on m.contact_id = c.id group by c.id order by totale desc
