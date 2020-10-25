// messaggi con contatto di origine
db.messages.aggregate([
    {
        $lookup: {
            from: "contacts",
            localField: "phone",
            foreignField: "phone",
            as: "contact"
        }
    }
]);

// contatti che non hanno mandato messaggi
var _phones = db.messages.find(
    {},
    {
        "phone": 1
    }
).map(function (doc) {
    return doc.phone;
});

db.contacts.find({
    "phone": {
        $nin: _phones
    }
});
