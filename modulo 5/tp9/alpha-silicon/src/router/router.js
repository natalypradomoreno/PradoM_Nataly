const express = require('express'); 
const router = express();
///archivos de coneccion
const mysqlConeccion = require('../database/database');
//libreria para encriptar
const bcrypt = require('bcrypt'); 
//libreria para la generacion de nuestro token
const jwt = require('jsonwebtoken');

//ruta raiz
router.get('/',(req,res)=>{
    console.log('Entra en la dirección /');
    res.send('Pantalla de inicio');
});



//////////////////////////////
//////REGISTROS/LOGINS////////
//////////////////////////////

//////Registro de usuario/////
router.post('/registro',(req,res)=>{
    const {nickname, email,password}= req.body;
    var hash = bcrypt.hashSync(password,10);
   // res.send(hash);
    let query =`INSERT INTO usuarios (nickname,email, password) VALUES ('${nickname}','${email}','${hash}');`;
    //INSERT INTO `tp_09a`.`usuarios` (`nickname`, `email`, `password`) VALUES ('Macrina', 'macrina@gmail.com', '1234');
    mysqlConeccion.query(query, (err,rows)=>{       
        if(!err){
            res.send('Se incerto correctamente el nickname: '+nickname);
        }else{
            res.send('ocurrio un error desde el servidor'); 
        };
    });
});
///////Reset Password///////
router.put('/resetpassword/:idusuarios', (req, res)=>{
    //asigna a idusuarios el valor que recibe por el parametro
    let idusuarios= req.params.idusuarios;
    //asigna el valor que recibe  en el Body
    const { password } =req.body
    var hash = bcrypt.hashSync(password,10);
    //Generamos la Query de modificación de password
    let query=`UPDATE usuarios SET password='${hash}' WHERE idusuarios='${idusuarios}'`;
    mysqlConeccion.query(query, (err, rows)=>{
        if(!err){
            res.send('El Id que editamos es : '+idusuarios+' y cambiamos la contraseña');
        }else{
            console.log(err)
        }
    }); 
});
////////////login/////////
router.post('/login',async(req,res)=>{
    const {nickname, password}= req.body;
    if(nickname!=undefined && password!=undefined){
        mysqlConeccion.query(`select u.idusuarios, u.nickname, u.password from usuarios as u where u.estado='1' and nickname=? `,[nickname], (err,rows)=>{//query consulta
           if(!err){
                if(rows.length!=0){
                    const bcryptPassword=bcrypt.compareSync(password,rows[0].password);
                    if(bcryptPassword){
                        jwt.sign({rows},'tp09Key',(err,token)=>{//generamos nuetro token
                            res.json(
                                {
                                    exito: true,
                                    datos:rows,
                                    token: token
                                }); 
                         });
                    }else{
                        res.json({
                            exito: false,
                            mensaje: "La CONTRASEÑA es incorrecta"
                        });
                    }
                    
                }else{
                    res.json({
                        exito: false,
                        mensaje: "El nickname no existe"
                    });
                   
                }; 
            }else{
                res.json({
                    exito: false,
                    mensaje: "Error de el servidor"
                });
                res.send('Error'+err); 
            };
        });
    }else{
        res.json({
            exito: false,
            mensaje: "Falta completar datos"
        });
    };
});


//////////////////////////////
//////////Usuarios////////////
//////////////////////////////

///////Lista de Usuarios/////
router.get('/usuarios', verificarToken, (req,res)=>{
    jwt.verify(req.token, 'tp09Key',(err,valido)=>{
        if(err){
            res.sendStatus(403);
        }else{
             // res.send('el endpoint esta llegando correctamente');
         mysqlConeccion.query('select * from usuarios ', (err,rows)=>{//query consulta
            if(!err){
                res.json(rows);
            }else{
                console.log(err);
            };
        });
        }
    });
});
/////metodo para editar el estado de un usuario en particular
router.put('/usuarios/:idusuarios',verificarToken, (req, res)=>{
    //asigna a id_curso el valor que recibe por el parametro
    let idusuarios = req.params.idusuarios;
    //asigna el valor que recibe  en el Body
    console.log('es id a modificar es'+idusuarios)
    const { estado } =req.body
    jwt.verify(req.token, 'tp09Key',(err,valido)=>{
        if(err){
            res.sendStatus(403);
        }else{
            let query=`UPDATE usuarios SET estado='${estado}' WHERE idusuarios='${idusuarios}'`;
            mysqlConeccion.query(query, (err, registros)=>{
                if(!err){
                    if(estado!=0){
                        res.send('El estado del idusuario: '+idusuarios+ ' cambio de bajo a ALTO');
                    }else{
                        res.send('El estado del idusuario: '+idusuarios+ ' cambio de alto a BAJO');
                    }
                }else{
                    console.log(err)
                }
            });
        };
    });
});


//////////////////////////////
////////////CURSOS////////////
//////////////////////////////
///////Lista de cursos/////
router.get('/cursos', verificarToken, (req,res)=>{
    jwt.verify(req.token, 'tp09Key',(err,valido)=>{
        if(err){
            res.sendStatus(403);
        }else{
             // res.send('el endpoint esta llegando correctamente');
         mysqlConeccion.query('select * from cursos ', (err,rows)=>{//query consulta
            if(!err){
                res.json(rows);
            }else{
                console.log(err);
            };
        });
        }
    });
});
/////metodo para editar el estado y datos de un curso en particular
router.put('/cursos/:idcurso',verificarToken, (req, res)=>{
    //asigna a id_curso el valor que recibe por el parametro
    let idcurso = req.params.idcurso;
    //asigna el valor que recibe  en el Body
    console.log('es id a modificar es'+idcurso)
    const {nombre,descripcion,estado} =req.body
    jwt.verify(req.token, 'tp09Key',(err,valido)=>{
        if(err){
            res.sendStatus(403);
        }else{
            if(estado!=undefined){
                let query=`UPDATE cursos SET estado='${estado}' WHERE idcurso='${idcurso}'`;
                mysqlConeccion.query(query, (err, registros)=>{
                    if(!err){
                        if(estado!=0){
                            res.send('El estado del curso: '+idcurso+ ' cambio de bajo a ALTO');
                        }else{
                            res.send('El estado del curso: '+idcurso+ ' cambio de alto a BAJO');
                        }
                    }else{
                        console.log(err)
                    }
                });
            }else{
                let query=`UPDATE cursos SET nombre='${nombre}', descripcion='${descripcion}' WHERE idcurso='${idcurso}'`;
                mysqlConeccion.query(query, (err, registros)=>{
                    if(!err){
                        res.send('El curso: '+idcurso+ ' recibio modificaciones');
                    }else{
                        console.log(err)
                    }
                });
            };
            
        };
    });
});
////metodo para incertar curso
router.post('/cursos',verificarToken,(req,res)=>{
    const {nombre,descripcion} = req.body
    jwt.verify(req.token, 'tp09Key',(err,valido)=>{
        if(err){
            res.sendStatus(403);
        }else{
            let query =`INSERT INTO cursos (nombre,descripcion) VALUES ('${nombre}','${descripcion}')`;
            mysqlConeccion.query(query, (err,rows)=>{
            if(!err){
                res.send('Se inserto correctamente el curso: '+nombre+' descripcion: '+descripcion);
            }else{
                console.log(err);
                res.send('El error es: '+ err);
            };
              });
        }
    });
});


//////////////////////////////
////////////MATERIAS///////////////
///////Lista de materias/////
router.get('/materias', verificarToken, (req,res)=>{
    jwt.verify(req.token, 'tp09Key',(err,valido)=>{
        if(err){
            res.sendStatus(403);
        }else{
             // res.send('el endpoint esta llegando correctamente');
         mysqlConeccion.query('select * from materias ', (err,rows)=>{//query consulta
            if(!err){
                res.json(rows);
            }else{
                console.log(err);
            };
        });
        }
    });
});
/////metodo para editar el estado y datos de una materia en particular
router.put('/materias/:idmaterias',verificarToken, (req, res)=>{
    //asigna a id_curso el valor que recibe por el parametro
    let idmaterias = req.params.idmaterias;
    //asigna el valor que recibe  en el Body
    console.log('es id a modificar es'+idmaterias)
    const {nombre,objetivo,plan_estudio,estado} =req.body
    jwt.verify(req.token, 'tp09Key',(err,valido)=>{
        if(err){
            res.sendStatus(403);
        }else{
            if(estado!=undefined){
                let query=`UPDATE materias SET estado='${estado}' WHERE idmaterias='${idmaterias}'`;
                mysqlConeccion.query(query, (err, registros)=>{
                    if(!err){
                        if(estado!=0){
                            res.send('El estado de la materia: '+idmaterias+ ' cambio de bajo a ALTO');
                        }else{
                            res.send('El estado de la materia: '+idmaterias+ ' cambio de alto a BAJO');
                        }
                    }else{
                        console.log(err)
                    }
                });
            }else{
                let query=`UPDATE materias SET nombre='${nombre}', objetivo='${objetivo}', plan_estudio='${plan_estudio}' WHERE idmaterias='${idmaterias}';`;
                mysqlConeccion.query(query, (err, registros)=>{
                    if(!err){
                        res.send('La materia: '+idmaterias+' recibio modificaciones');
                    }else{
                        console.log(err)
                    }
                });
            };
            
        };
    });
});
////metodo para incertar materia
router.post('/materias',verificarToken,(req,res)=>{
    const {nombre,objetivo,plan_estudio} = req.body
    jwt.verify(req.token, 'tp09Key',(err,valido)=>{
        if(err){
            res.sendStatus(403);
        }else{
            let query =`INSERT INTO materias (nombre, objetivo, plan_estudio) VALUES ('${nombre}','${objetivo}','${plan_estudio}')`;
            mysqlConeccion.query(query, (err,rows)=>{
            if(!err){
                res.send('Se inserto correctamente el curso: '+nombre+' Objetivo: '+objetivo+' Plan de estudio: '+plan_estudio);
            }else{
                console.log(err);
                res.send('El error es: '+ err);
            };
            });
        }
    });
});

//////////////////////////////
////////////SEDES/////////////
///////Lista de sedes/////
router.get('/sedes', verificarToken, (req,res)=>{
    jwt.verify(req.token, 'tp09Key',(err,valido)=>{
        if(err){
            res.sendStatus(403);
        }else{
             // res.send('el endpoint esta llegando correctamente');
         mysqlConeccion.query('select * from sedes ', (err,rows)=>{//query consulta
            if(!err){
                res.json(rows);
            }else{
                console.log(err);
            };
        });
        }
    });
});
/////metodo para editar el estado y datos de una sede en particular
router.put('/sedes/:idsedes',verificarToken, (req, res)=>{
    //asigna a idsedes el valor que recibe por el parametro
    let idsedes = req.params.idsedes;
    //asigna el valor que recibe  en el Body
    console.log('es id a modificar es'+idsedes)
    const {nombre,direccion,localidad,cod_postal,telcontacto1,telcontacto2,estado} =req.body
    jwt.verify(req.token, 'tp09Key',(err,valido)=>{
        if(err){
            res.sendStatus(403);
        }else{
            if(estado!=undefined){
                let query=`UPDATE sedes SET estado='${estado}' WHERE idmaterias='${idsedes}'`;
                mysqlConeccion.query(query, (err, registros)=>{
                    if(!err){
                        if(estado!=0){
                            res.send('El estado de la sede: '+idsedes+ ' cambio de bajo a ALTO');
                        }else{
                            res.send('El estado de la sede: '+idsedes+ ' cambio de alto a BAJO');
                        }
                    }else{
                        console.log(err)
                    }
                });
            }else{
                let query=`UPDATE sedes SET nombre='${nombre}', direccion='${direccion}', localidad='${localidad}',cod_postal='${cod_postal}',telcontacto1='${telcontacto1}',telcontacto2='${telcontacto2}' WHERE idsedes='${idsedes}';`;
                mysqlConeccion.query(query, (err, registros)=>{
                    if(!err){
                        res.send('La materia: '+idsedes+' recibio modificaciones');
                    }else{
                        console.log(err)
                    }
                });
            };
            
        };
    });
});
////metodo para incertar sedes
router.post('/sedes',verificarToken,(req,res)=>{
    const {nombre,direccion,localidad,cod_postal,telcontacto1,telcontacto2} = req.body
    jwt.verify(req.token, 'tp09Key',(err,valido)=>{
        if(err){
            res.sendStatus(403);
        }else{
            let query =`INSERT INTO sedes (nombre,direccion,localidad,cod_postal,telcontacto1,telcontacto2) VALUES ('${nombre}','${direccion}','${localidad}','${cod_postal}','${telcontacto1}','${telcontacto2}')`;
            mysqlConeccion.query(query, (err,rows)=>{
            if(!err){
                res.send('Se inserto correctamente la sede: '+nombre+' Dirección: '+direccion);
            }else{
                console.log(err);
                res.send('El error es: '+ err);
            };
            });
        }
    });
});




////////////////Funcion para token///////////////
function verificarToken(req, res, next){
    const BearerHeader= req.headers['authorization'];
    if(typeof BearerHeader!=='undefined'){
        const bearerToken=BearerHeader.split(" ")[1];
        req.token=bearerToken;
        next();
    }else{
        res.sendStatus(403);//403 da error de autenticación en este caso
       // res.send('Ocurrio un error en el servidor');
       //console.log('ocurrio un error')
    }
}

module.exports = router;
