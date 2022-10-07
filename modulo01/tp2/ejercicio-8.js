var cantidadNumeros = 100;
var myArray = []
while(myArray.length < cantidadNumeros ){
var numeroAleatorio = Math.ceil(Math.random()*cantidadNumeros);
var existe = false;
for(var i=0;i<myArray.length;i++){
if(myArray [i] == numeroAleatorio){
existe = true;
break;}}
if(!existe){
myArray[myArray.length] = numeroAleatorio;}}
document.write("números aleatorios : " + myArray+ "</br>");
