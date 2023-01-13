/*Partiendo del programa “Obtener nombres”, crear una función llamada getNombre que reciba el
arreglo de las personas y busque todas las personas de la localidad Posadas. Si encuentra debe
imprimir el nombre y el apellido de la persona.
Llamar a la función getNombre(persona);
Guardar el programa en ejercicio4.js
Al ejecutar node ejercicio4.js la salida en consola debería ser la siguiente:
Maria Nieves
Ramon Rodriguez
*/

const fs = require('fs');
const rawdata = fs.readFileSync('./personas.json', 'utf8');
var persona = JSON.parse(rawdata);
  function getNombre(buscar) {
    for (var i = 0; i < buscar["personas"].length; i++) {
      if (buscar["personas"][i]["Localidad"] === "Posadas") {
          console.log(buscar["personas"][i]["Nombre"] + " " + buscar["personas"][i]["Apellido"]);
      }
    }
  }

getNombre(persona);
