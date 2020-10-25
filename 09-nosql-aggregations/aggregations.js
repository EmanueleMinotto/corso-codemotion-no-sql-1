// totale contatti
db.contacts.count();

// totale dei numeri salvati
db.contacts.distinct("phone").length;

// contatti che hanno scritto più messaggi
db.messages.aggregate([
    {
        $lookup: {
            from: "contacts",
            localField: "phone",
            foreignField: "phone",
            as: "contact"
        }
    },
    {
        $group: {
            _id: "$phone",
            totale: {
                $sum : 1
            },
            contact: {
                $first: "$contact"
            }
        }
    },
    {
        $sort: {
            totale: -1
        }
    },
    {
        $limit: 10
    }
]);
