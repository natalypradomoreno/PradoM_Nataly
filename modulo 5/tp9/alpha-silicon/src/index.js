const express = require('express'); //cargo lo que requiero para levantar el servidor
const app = express();//lo asigno a app
app.use(express.json());
const morgan = require('morgan');

//configuraciones 
app.set('port', process.env.PORT || 3310);
app.use(morgan('dev'));
//rutas para la aplicación
app.use(require('./router/router'));
//inicia el servidor NODE
app.listen(app.get('port'),()=>{//listen levanta el servidor
    console.log('El servidor corriendo en el puerto '+app.get('port'));
});
