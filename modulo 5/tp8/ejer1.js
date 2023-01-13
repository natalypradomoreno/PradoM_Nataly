const fs = require('fs');
let rawdata = fs.readFileSync('./personas.json');
console.log(JSON.stringify(rawdata));


/* ¿Qué sucede cuando utilizamos JSON.stringify? Por que?
¿Qué sucede cuando utilizamos JSON.parse? Por que?
Comentar las respuestas y guardar el programa en ejercicio1.js

Cuando usamos .stringify lo que hace es convertir un objeto o valor de JavaScript en una cadena de texto JSON a un servidor web. Cuando lo usamos con este ejercicio,
lo convierte en una cadena de número entendibles solamente para el servidor.

Cuando usamos .parse lo que hace en cambio es comvertir una cadena de exto JSON del servidor web a un objeto/valor de JS. 
Con este ejercicio, al ser formato JS, mantienen el mismo, siendo entendible para el usuario. */
