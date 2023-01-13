const fs = require('fs');
let rawdata = fs.readFileSync('./personas.json');
let persona = JSON.parse(rawdata);
console.log(persona);
