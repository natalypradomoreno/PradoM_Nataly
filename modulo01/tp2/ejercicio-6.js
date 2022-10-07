var vocales = ["a", "e", "i", "o", "u"];
var texto = prompt("Introduce un texto");
//PASAMOS EL TEXTO A MINÚSCULAS
var textomin = texto.toLowerCase()
var posicion = 0;
var parar = false;
for (var i = 0; i < textomin.length; i++) {
//BUCLE QUE RECORRE EL ARRAY DE VOCALES
for (var x = 0; x < vocales.length; x++) {
if (vocales[x] == textomin.charAt(i)) {
posicion = i;
parar = true;
break;
}}if (parar) {break;}
} console.log("La primera vocal está en la posición " + posicion+
"("+textomin.charAt(i)+")")
