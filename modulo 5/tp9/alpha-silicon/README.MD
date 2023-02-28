# alpha-silicon

## Para desarrollar local
- Descargar el repositorio
```sh
$ git clone git@github.com:FacundoRauber/alpha-silicon.git
```
- Restaurar la copia de la base de datos
- Dentro de l carpeta /alpha-silicon instalar los paquetes necesarios:
```sh
$ npm init
$ npm install express mysql morgan rootpath nodemon
```
- Ejecutar:
```sh
$ npm run dev
```


## Coinsideraciones
- En el archivo config.json se encuentran las configuraciones para que el sistema se conecte al motor de la base de datos y para configurar los puertos de escucha del servidor web.
- Tener en cuenta que al restaurar la base de datos el nombre de la base de datos puede ser distinto, revisar el archivo de configuración.
- Tener en cuenta que al restaurar la base de datos la clave y el usuario del motor de base de datos puede ser distinto, revisar el archivo de configuración.
- Es posible modificar el puerto de escucha del servidor web, por defecto esta en el 8080.

## Como usuar:
### Para listar todas las personas:
-- GET http://localhost:8080/api/persona

### Para buscar una persona por DNI
-- GET http://localhost:8080/api/persona/_numeroDeDNI_
- _numeroDeDNI_: es el numero de DNI de un a persona que esta guardada en la base de datos.

### Para insertar personas:
-- POST http://localhost:8080/api/persona
```json
    {
        "nombre": "Gabriela",
        "apellido": "Gutierres",
        "dni": "32337879",
       "sexo": "M",
        "fecha_nacimiento": "1998-02-03" 
    }
```
### Para editar personas:
-- PUT http://localhost:8080/api/persona/_numeroDeDNI_
- _numeroDeDNI_: es el numero de DNI de un a persona que esta guardada en la base de datos.
```json
{
        "nombre": "Gabriela",
        "apellido": "Gutierres",
        "dni": "32337879",
       "sexo": "M",
        "fecha_nacimiento": "1998-02-03",
        "estado": "0"
    }
```
### Para eliminar fisicamente una persona (en la base de datos)
DELETE http://localhost:8080/api/persona/del/_numeroDeDNI_
- _numeroDeDNI_: es el numero de DNI de un a persona que esta guardada en la base de datos.

### Para eliminar logicamente una persona (se realiza un update del estado):
DELETE http://localhost:8080/api/persona/_numeroDeDNI_
- _numeroDeDNI_: es el numero de DNI de un a persona que esta guardada en la base de datos.
