var reultado=0
var nmes=prompt("Ingrese número de Mes")
if(nmes==2){console.log("Mes "+nmes+" tiene 28 días")
}else {
resultado= ((nmes % 2 ) + 2 ) % 2
if (resultado==0){console.log("Mes "+nmes+" tiene 30 dias")
} else{console.log("Mes "+nmes+" tiene 31 dias")}}
