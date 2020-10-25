-- messaggi con numero di origine
select c.phone, m.message from contacts c join messages m on m.contact_id = c.id;

-- contatti che non hanno mandato messaggi
select c.id, c.phone from contacts c left join messages m on m.message is null;

-- ultimi 10 messaggi
select c.phone, m.message from contacts c join messages m on m.contact_id = c.id order by m.id desc limit 10;
