'use strict';
const fs = require('fs');
fs.readFile('personas.json', (err, data) => {
if (err) throw err;
console.log(JSON.parse(data));
});

/* a)Modificar el programa lector 3, reemplazar la anteúltima línea por:*/

console.log(JSON.stringify(data));

/* ¿Qué sucede cuando utilizamos JSON.stringify? En este caso vueve a convertir m formato json a un formato objeto entendible por el servidor.

b) Agregar debajo: */

console.log(data);

/* ¿Que sucede? Por que? Convierte en hexagesimal

Comentar las respuestas y guardar el programa en ejercicio3.js
