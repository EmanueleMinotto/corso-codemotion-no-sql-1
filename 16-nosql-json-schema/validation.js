// inserire un nuovo contatto (errato)
db.contacts.insert({
    name: "Mario Rossi",
    phone: "0039 123456",
});

// aggiungere una validazione con JSON Schema
db.runCommand({
    collMod: "contacts",
    validator: {
        $jsonSchema: {
            bsonType: "object",
            required: [ "name", "phone" ],
            properties: {
                name: {
                    bsonType: "string",
                    description: "must be a string and is required"
                },
                phone: {
                    bsonType: "string",
                    pattern : "^[0-9]{7,8} [0-9]{3,4}$",
                    description: "must be a string and is required"
                }
            }
        }
    },
    validationLevel: "moderate",
    validationAction: "error"
});

// inserire un nuovo contatto (corretto)
db.contacts.insert({
    name: "Mario Rossi",
    phone: "00391200 3456",
});
