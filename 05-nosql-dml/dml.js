// estrarre tutti i contatti
db.contacts.find();

// contatti in ordine alfabetico
db.contacts.find().sort({
    "name": 1
});

// ottenere il numero di telefono del 10° contatto
db.contacts.find(
    {
        "id": 10
    },
    {
        "phone": 1
    }
);

// 11° e 10° contatto hanno lo stesso numero
db.contacts.update(
    {
        "id": 11
    },
    {
        $set: {
            phone: "16301017 6802"
        }
    }
);

// quanti numeri abbiamo in rubrica?
db.runCommand({
    "distinct": "contacts",
    "key": "phone"
});

// cercare i contatti con cognome Rossi
db.contacts.find({
    "name": {
        $regex: /.* Rossi$/
    }
});

// eliminare contatti con cognome Rossi
db.contacts.remove({
    "name": {
        $regex: /.* Rossi$/
    }
});

// inserire un nuovo contatto
db.contacts.insert({
    name: "Mario Rossi",
    phone: "0039 123456",
});
