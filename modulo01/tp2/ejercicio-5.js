var palabra = prompt();
var palabraArray = palabra.split('');
var upperCount = 0;
var lowerCount = 0;
palabraArray.forEach(function(element) {
if (element == element.toUpperCase()) {upperCount++;
} if (element == element.toLowerCase()){
lowerCount++;}}); if (upperCount > 0 && lowerCount == 0)
alert('Todo el string esta compuesto de mayúsculas');
else if (lowerCount > 0 && upperCount == 0) alert('Todo el string
esta compuesto de minúsculas');
else alert('El string esta compuesto por mayúsculas y
minúsculas');}
