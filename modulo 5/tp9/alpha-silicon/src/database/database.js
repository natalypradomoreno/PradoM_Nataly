const mysql = require('mysql');
const mysqlConeccion = mysql.createConnection({//conecta a la base de datos
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'tp_09a'//la base de datos que trabajemos
    
});
mysqlConeccion.connect(function(err){
    if(err){
        console.log('el error es ',err);
        return;
    }else{
        console.log('Mi conección se realizo correctamente');
    };
})
module.exports = mysqlConeccion;
