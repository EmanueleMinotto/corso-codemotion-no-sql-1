// query standard
db.contacts.find({ phone: "16590424 9843" });

// analisi performance
db.contacts.find({ phone: "16590424 9843" }).explain("executionStats");

// ottimizzazione
db.contacts.createIndex({ phone: 1 });

// verifica performance
db.contacts.find({ phone: "16590424 9843" }).explain("executionStats");
