#### Ejercicio 1
Investigar y dar una definición con sus palabras los siguientes términos:
- REST
- API
- Endpoint
- Encabezados (headers)

____
- **REST**: viene de "Representational State Transfer", o "Transferencia de representacion de estado".Es una interfaz para poder conectar varios sistemas por protocolo HTTP, un servicio REST no posee estado (_stateless_) por lo que entre dos llamadas se pierden todos los datos.
Esto quiere decir, que para recordar los datos entre llamadas, se deben almacenar en algun lado (generalmente en memoria) para poder utilizarlos entre peticiones.

- **API**: viene de "Application Programming Interface" o "Interfaz de programacion de aplicaciones". Es un conjunto de definiciones y protocolos que se usa para diseñar e integrar el software de aplicaciones.
Permite que sus productos y servicios se comuniquen con otros sin necesidad de saber como estan programados o implementados. Permite ahorrar tiempo, dinero asi como tambien otorgar flexibilidad ya que simplifica el diseño, la administracion y demas.

- **ENDPOINT**: es el final de una comunicacion. Cuando una API interactua con otro sistema, los puntos de contacto serian considerados endpoints los cuales pueden ser URLs de un servidor o un servicio.
Cada endpoint viene siendo la locacion en donde la API puede acceder a los recursos que necesita para realizar una funcion.

- **HEADERS**: los headers permiten al cliente y al servidor enviar informacion adicional junto con la peticion o respuesta.
