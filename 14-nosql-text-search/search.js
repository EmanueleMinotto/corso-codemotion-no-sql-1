// ricerca senza indice
// messaggi contenenti la parola mauris (case sensitive)
db.messages.find({
    "message": {
        $regex: /.+ mauris .+/
    }
});

// messaggi contenenti la parola mauris (case insensitive)
db.messages.find({
    "message": {
        $regex: /.+ mauris .+/i
    }
});

// creazione dell'indice fulltext
db.messages.createIndex({
    message: "text"
});

// ricerca avanzata
db.messages.find({
    $text: {
        $search: "mauris"
    }
});

// ricerca avanzata con score
db.messages.find(
    {
       $text: {
           $search: "mauris"
       }
    },
    {
        score: {
            $meta: "textScore"
        }
    }
);
