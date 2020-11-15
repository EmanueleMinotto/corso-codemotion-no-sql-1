-- ricerca senza indice
-- messaggi contenenti la parola mauris (case insensitive)
select * from messages where message like "% mauris %";

-- messaggi contenenti la stringa mauris (case insensitive)
select * from messages where message like "%mauris%";

-- creazione dell'indice fulltext
alter table messages add fulltext index message_search (message);

-- messaggi contenenti mauris nulla ordinati in base al match
select *, (match(message) against ('mauris nulla' in natural language mode)) as match_perc from messages where match(message) against ('mauris nulla' in natural language mode) order by match_perc desc;

-- messaggi contenenti mauris ma non nulla
select *, (match(message) against ('mauris -nulla' in boolean mode)) as match_perc from messages where match(message) against ('mauris -nulla' in boolean mode) order by match_perc desc;

-- messaggi contenenti la concatenazione "mauris nulla"
select *, (match(message) against ('"mauris nulla"' in natural language mode)) as match_perc from messages where match(message) against ('"mauris nulla"' in natural language mode) order by match_perc desc;
