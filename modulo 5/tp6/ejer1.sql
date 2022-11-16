
-- 1: 
create table pais (
id INT unsigned auto_increment PRIMARY KEY,
nombre varchar(100) not null,
id_pais int unsigned,
FOREIGN KEY (id_pais) REFERENCES pais(id));
create table provincia (
id INT unsigned auto_increment PRIMARY KEY,
nombre varchar(100) not null,
id_pais int unsigned,
FOREIGN KEY (id_pais) REFERENCES pais(id));
create table localidad (
id int unsigned auto_increment PRIMARY KEY,
nombre varchar(100) not null,
cp varchar(100) not null,
id_provincia int unsigned,
FOREIGN KEY (id_provincia) REFERENCES provincia(id));
-----------------------------
ALTER TABLE localidad add column(
id_pais int unsigned,
FOREIGN KEY (id_pais) REFERENCES pais(id));
ALTER TABLE localidad add column(
estado enum("A","B"));
-------------------------
-- 2: 
alter table empleados add column (
direccion varchar(100),
id_localidad int unsigned,
email varchar(100),
telefono int,
fecha_ingreso date,
tms timestamp,
FOREIGN KEY (id_localidad) REFERENCES localidad(id));

-- 3: 
alter table departamentos add column (
gasto double,
tms timestamp);

-- 4:
insert into pais (nombre) values ('Argentina');
insert into pais (nombre) values ('Chile');
insert into pais (nombre) values ('Peru');
insert into pais (nombre) values ('Italia');
insert into pais (nombre) values ('Brasil');

insert into provincia (nombre, id_pais) values ('Buenos Aires','1');
insert into provincia (nombre, id_pais) values ('Misiones','1');
insert into provincia (nombre, id_pais) values ('Distrito Federal','5');
insert into provincia (nombre, id_pais) values ('Roma','4');
insert into provincia (nombre, id_pais) values ('Amazonas','3');
insert into provincia (nombre, id_pais) values ('Corrientes','1');

insert into localidad (nombre, cp, id_provincia,id_pais,estado) values ('Apostoles','N3350', '2','1','A');
insert into localidad (nombre, cp, id_provincia,id_paisestado) values ('25 de Mayo','N3363','2','1','A');
insert into localidad (nombre,cp, id_provincia,estado) values ('Chachapoyas','01000', '5','A');
insert into localidad (nombre, cp, id_provincia,estado) values ('Lacio','00010', '4','A');
insert into localidad (nombre, cp, id_provincia,estado) values ('Morón','B1708' , '1','A');
insert into localidad (nombre, cp, id_provincia,id_pais,estado) values ('Posadas','3300' , '2','1','A');

insert into departamentos (nombre, presupuesto, estado, gasto, tms) values ('marketing', '35000', True, '2455.0', '2022-01-01 20:17:00');
insert into departamentos (nombre, presupuesto, estado, gasto, tms) values ('finanzas', '310000', True, '10000.0', '2022-09-23 16:58:30');
insert into departamentos (nombre, presupuesto, estado, gasto, tms) values ('soporte', '23456', True, '1065.0', '2022-02-28 07:00:00');
insert into departamentos (nombre, presupuesto, estado, gasto, tms) values ('atención al cliente', '989809', True, '2455.0', '2002-01-01 20:17:00');
insert into departamentos (nombre, presupuesto, estado, gasto, tms) values ('equipo de desarrollo', '765500', True, '24990.0', '2015-01-01 09:09:09');
insert into departamentos (nombre, presupuesto, estado, gasto, tms) values ('ventas', '3333333', True, '2455.0', '2004-10-26 20:17:00');

insert into empleados (cuil_cuit, nombre, apellido, id_departamento, estado, direccion, id_localidad, telefono) values ('20461067430', 'Marcela', 'Meditio', '2',True, 'Av Centenario 5000', '1', '376485877'); 
insert into empleados (cuil_cuit, nombre, apellido, id_departamento, estado, direccion, id_localidad, telefono) values ('27364674560', 'Agustin', 'Ramirez', '2',True, 'Salta 1977', '2', '156894653'); 
insert into empleados (cuil_cuit, nombre, apellido, id_departamento ) values ('20476578900', 'Yolanda', 'Yiyel', '3');
insert into empleados (cuil_cuit, nombre, apellido, id_departamento ) values ('26444444892', 'Angelaa', 'Prado', '2');
insert into empleados (cuil_cuit, nombre, apellido, id_departamento ) values ('26461666550', 'Martina', 'Panigio', '4');

-- 5: 
rename table pedidos to movimientos;

-- 6: 
create table productos (
id int unsigned auto_increment PRIMARY KEY,
nombre varchar(100) not null,
descripcion varchar(100),
stock int,
precio int,
estado boolean, 
tms timestamp);
create table marca (
id int unsigned auto_increment PRIMARY KEY,
 nombre varchar(100) not null,
 descripción varchar(100),
 imagen varchar(2000) , 
 estado boolean,
 tms timestamp);
 create table proveedores (
 id int unsigned auto_increment PRIMARY KEY,
 razon_social varchar(100),
 nombre varchar(100) not null ,
 apellido varchar(100),
 naturaleza varchar(45),
cuit int,
estado boolean,
tms timestamp);
create table Cajas (
id int unsigned auto_increment PRIMARY KEY,
horainicio datetime,
horacierre datetime,
 estado boolean, 
 tms timestamp);

 alter table productos add column (
 id_marca int unsigned,
 FOREIGN KEY (id_marca) REFERENCES marca(id));
  alter table marca add column (
 id_proveedor int unsigned,
 FOREIGN KEY (id_proveedor) REFERENCES proveedores(id));
  alter table proveedores add column (
 id_localidad int unsigned,
 FOREIGN KEY (id_localidad) REFERENCES localidad(id));
 
 -- 7: 
 insert into proveedores(razon_social, nombre, apellido, naturaleza, cuit, id_localidad, estado) values ('S.A', 'California', 'Supermercados', 'juridica','30-53952341-0', '6', true);
insert into proveedores(razon_social, nombre, apellido, naturaleza, cuit, id_localidad, estado) values ('S.A', 'Neumaticos', 'Posadas', 'juridica','30-56066416-4', '6', true);
insert into proveedores(razon_social, nombre, naturaleza, cuit, id_localidad, estado) values ('S.R.L', 'Grupo Nordeste', 'juridica','30-70859799-2', '6', true);
insert into proveedores(razon_social, nombre, apellido, naturaleza, cuit, id_localidad, estado) values ('S.A', 'Frigorificos', 'Apostoles', 'juridica','30-61537679-1', '1', true);
insert into proveedores(razon_social, nombre, naturaleza, cuit, id_localidad, estado) values ('S.A', 'SLM', 'juridica','30-64700935-9', '5', true);

insert into marca(nombre, descripción, id_proveedor, estado) values ('TodoModa','venta de acccesorios','1',true);
insert into marca(nombre, descripción, id_proveedor, estado) values ('Pirelli','neumaticos','2',true);
insert into marca(nombre, descripción, id_proveedor, estado) values ('California','venta de esenciales para vida','1',true);
insert into marca(nombre, descripción, id_proveedor, estado) values ('El nono','venta de carnes y afines','4',true);
insert into marca(nombre, descripción, id_proveedor, estado) values ('Frigorifico Garcia','venta de carnes y afines','4',true);
insert into marca(nombre, descripción, id_proveedor, estado) values ('Calibar','cafe/bar en sucursal California','1',true);

insert into productos(nombre, descripcion, id_marca, stock, precio) values ('Budin','budin saborizado con esencia de naranja','3','46','134');
insert into productos(nombre, descripcion, id_marca, stock, precio) values ('Aritos Perla','aritos fantasia con pelotita tipo perla fantasia','1','122','600');
insert into productos(nombre, descripcion, id_marca, stock, precio) values ('Asado','tipo de corte de carne vacuna','4','23','1000');
insert into productos(nombre, descripcion, id_marca, stock, precio) values ('Sanguchito de J/Q','sanguchito de jamón y queso','6','3','370');
insert into productos(nombre, descripcion, id_marca, stock, precio) values ('Neumatico para auto Siena','neumático para auto siena','2','12','6000');
insert into productos(nombre, descripcion, id_marca, stock, precio) values ('Factura','Factura medialuna','6','24','100');

insert into cajas(horainicio, horacierre, estado) values ('1900-01-01 07:00:00','1900-01-01 22:00:00', '1');
insert into cajas(horainicio, horacierre, estado) values ('1900-01-01 07:00:00','1900-01-01 22:00:00', '0');
insert into cajas(horainicio, horacierre, estado) values ('1900-01-01 07:00:00','1900-01-01 22:00:00', '1');
insert into cajas(horainicio, horacierre, estado) values ('1900-01-01 07:00:00','1900-01-01 22:00:00', '0');
insert into cajas(horainicio, horacierre, estado) values ('1900-01-01 07:00:00','1900-01-01 22:00:00', '0');

-- 8:
select d.nombre as nombre, d.presupuesto as presupuesto, d.gasto as gastos,(d.presupuesto - d.gasto) as diferencia from departamentos d where estado = 1;

-- 9: 
select * from localidad; 
select localidad.nombre from localidad inner join provincia where localidad.id= provincia.id group by id_provincia;

-- 10:
UPDATE empleados e set telefono= "376494899" where e.idemplaedo="1";
UPDATE empleados e set e.fecha_ingreso= "2020-03-30", e.id_localidad="2" where e.idemplaedo="3"; 

-- 11: 
select * from vendedores;
INSERT INTO vendedores(nombre, apellido, cuitcuil,comisión) VALUES ('Ramon','Gaona','27254986240','1');
INSERT INTO vendedores(nombre, apellido, cuitcuil,comisión) VALUES ('Nicole','Ramirez','20440987260','2');
INSERT INTO vendedores(nombre, apellido, cuitcuil,comisión) VALUES ('Araceli','Aral','27461077772','1');
INSERT INTO vendedores(nombre, apellido, cuitcuil,comisión) VALUES ('Martina','Villa','20987547830','2');
INSERT INTO vendedores(nombre, apellido, cuitcuil,comisión) VALUES ('Daniel','Prado','27264986140','2');

-- 12: 
alter table movimientos add column (
id_producto int unsigned,
estado boolean,
tms timestamp,
tipo_movimiento enum("Ingreso", "Egreso","Pedido"),
FOREIGN KEY (id_producto) REFERENCES productos(id));

-- 13: 
select * from movimientos;
INSERT INTO movimientos(cantidad, fecha, id_cliente,id_vendedor, id_producto,estado,tipo_movimiento) VALUES ('15.00','2002-11-16','2','1','1','1','Ingreso');
INSERT INTO movimientos(cantidad, fecha, id_cliente,id_vendedor, id_producto,estado,tipo_movimiento) VALUES ('374.2','2002-11-16','2','3','2','1','Ingreso');
INSERT INTO movimientos(cantidad, fecha, id_cliente,id_vendedor, id_producto,estado,tipo_movimiento) VALUES ('2999','2022-11-15','2','1','1','1','Ingreso');
INSERT INTO movimientos(cantidad, fecha, id_cliente,id_vendedor, id_producto,estado,tipo_movimiento) VALUES ('4', '3333.33', '2021-10-26', '1', '2', '4', '0', 'Egreso');
INSERT INTO movimientos(cantidad, fecha, id_cliente,id_vendedor, id_producto,estado,tipo_movimiento) VALUES ('5', '1', '2021-10-25', '1', '2', '4', '1', 'Egreso');

-- 14: 
UPDATE movimientos m set estado= 0 where m.id= 2;
UPDATE movimientos m set estado= 0 where m.id= 1;
UPDATE localidad l set estado='B' where l.id="1";
UPDATE localidad l set estado='B' where l.id="2" ;
UPDATE localidad l set estado='B' where l.id="6" ;

-- 15: 
UPDATE productos set stock= stock+1 where id= "1";
UPDATE productos set stock= stock+1 where id= "2";
UPDATE productos set stock= stock+1 where id= "3";
UPDATE productos set stock= stock-1 where id= "4";
UPDATE productos set stock= stock-1 where id= "5";

-- 16:
CREATE TABLE parametros(
id int unsigned auto_increment PRIMARY KEY,
 tms varchar(100),
cosas json, 
id_usuario int unsigned );

-- 17: 
INSERT INTO parametros VALUES ("1",null,{ "idDeLaCosa": "101", "permisos":"PUT, GET"}, "1");
INSERT INTO parametros VALUES ("2",null,{"vistasPermitidas":"menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente","grupo": "ventas"},"2");
INSERT INTO parametros VALUES ("3",null, {"zonaHoraria": "America/Argentina/BuenosAires"},"3");
INSERT INTO parametros VALUES ("4",null,{"fechaInicioActividades": 01/01/2019, "mesAperturaCaja": "Enero", "mesCierreCaja":"Diciembre"},"4");
INSERT INTO parametros VALUES ("1",null, {"balancesAniosAnteriores": {"2019": {"ingreso": "7374901.93","egreso":"3732538,75"},"2020":{"ingreso": "27442665,12","egreso": "8522331,82"},"2021": {"ingreso":"31634912,57","egreso": "9757142,66"}}},"5");
