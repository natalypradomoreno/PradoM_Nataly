const fs = require('fs');
const rawdata = fs.readFileSync('./personas.json', 'utf8');
var persona = JSON.parse(rawdata);
for(var i=0;i<persona['personas'].length;i++){
console.log(persona['personas'][i]['nombre']);
}
