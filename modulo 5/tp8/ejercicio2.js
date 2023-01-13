'use strict';
let jsonData = require('./personas.json');
console.log(JSON.stringify(jsonData));

/* ¿Qué sucede cuando utilizamos JSON.stringify? Por que?
En este caso, en ejercicio mantiene su formato json pero lo convierte en un codigo de una sola linea.*/

'use strict';
let jsonData = require('./personas.json');
console.log(JSON.stringify(jsonData));
console.log(JSON.parse(jsonData));

/*¿Qué sucede cuando utilizamos JSON.parse? Por que?
En este caso, el último console.log me sale undefined, por error de sintaxis.

Comentar las respuestas y guardar el programa en ejercicio2.js*/

