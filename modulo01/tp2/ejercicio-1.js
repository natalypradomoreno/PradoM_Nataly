var valores = ["verdadero", "false", 2, "hola",
"mundo", 3, "char"];
for(i=0 ; i<valores.length ; i++){
var resultado = contar(valores[i])
//imprimo valor con mayor cantidad de letras
if(resultado>valores.length){
console.log(valores[i]+" tiene " + resultado+ " letras ")
}
}
function contar(variable){
return variable.length
}
//imprimo valores de menor a mayor exceptuando los números
console.log("valores de menor a mayor: "+ valores.sort(function
(a,b){ return a.length - b.length}))
//operaciones básicas: suma, resta, división y multiplicación
let x= valores[5]
let y= valores[6];
let suma= x+y;
let resta= x-y;
let div= x/y;
let multi= x*y;
console.log("suma: "+suma+" resta: "+resta+" división: "+div+"
multiplicación: "+multi)
