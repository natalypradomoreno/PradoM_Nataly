-- consignas:
-- 1: Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.
select * from pedidos order by pedidos.fecha desc;
-- 2: Devuelve todos los datos de los dos pedidos de mayor valor
select * from pedidos order by pedidos.cantidad desc limit 2;
-- 3: Devuelve un listado con los identificadores de los clientes que han realizado algún pedido.
select distinct clientes.id as identificador from clientes inner join pedidos where pedidos.id_cliente=clientes.id;
-- 4: Devuelve un listado de todos los pedidos que se realizaron durante el año 2022, cuya
-- cantidad total sea superior a $500.
select * from pedidos where extract(year from pedidos.fecha)=2022 and pedidos.cantidad>500.0;
-- 5:  Devuelve un listado con el nombre y apellido de los vendedores que tienen una comisión entre 0.05 y 0.11.
select v.nombre, v.apellido from vendedores as v where v.comisión between 0.05 and 0.11;
-- 6: Devuelve el valor de la comisión de mayor valor que existe en la tabla vendedores
select v.comisión from vendedores as v order by v.comisión desc limit 1;
-- 7: Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo cuitcuil no es
-- NULL. El listado deberá estar ordenado alfabéticamente por apellido y nombre.
select clientes.id, clientes.nombre, clientes.apellido from clientes where clientes.cuitcuil >0;
-- 8: Devuelve un listado de los nombres de los clientes que empiezan por “A” y terminan por “n” y
-- también los nombres que empiezan por “P”. El listado deberá estar ordenado alfabéticamente.
select clientes.nombre from clientes where clientes.nombre like 'A%' and clientes.nombre like '%n' or clientes.nombre like 'P%' order by clientes.nombre asc;
-- 9: Devuelve un listado de los nombres de los clientes que no empiezan por “A”. El listado deberá estar ordenado alfabéticamente.
select clientes.nombre from clientes where clientes.nombre not like 'A%' order by clientes.nombre asc;
-- 10: Devuelve un listado con los nombres de los vendedores que terminan por “el” o “o”. Tenga en cuenta que se deberán eliminar los nombres repetidos.
select distinct vendedores.nombre from vendedores where vendedores.nombre like '%el' or vendedores.nombre like'%o';
-- 11: Devuelve un listado con el identificador, nombre y apellido de todos los clientes que han realizado algún pedido.
--  El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos
select  distinct clientes.id, clientes.nombre, clientes.apellido from clientes inner join pedidos where pedidos.id_cliente=clientes.id order by clientes.id, clientes.nombre, clientes.apellido asc;
-- 12: Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. 
-- El resultado debe mostrar todos los datos de los pedidos y del cliente. 
select * from pedidos inner join clientes where pedidos.id_cliente=clientes.id;
-- El listado debe mostrar los datos de los clientes ordenados alfabéticamente.
select * from pedidos inner join clientes where pedidos.id_cliente=clientes.id order by clientes.nombre, clientes.apellido, clientes.cuitcuil, clientes.ciudad, clientes.categoría asc;
-- 13: Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y
-- con los datos de los vendedores asociados a cada pedido
select * from clientes left join pedidos on pedidos.id_vendedor=clientes.id inner join vendedores where vendedores.id= pedidos.id_vendedor;
-- 14: Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2022, cuyo
-- monto esté entre $300 y $1000
select * from clientes inner join pedidos where extract(year from pedidos.fecha)=2022 and pedidos.cantidad between 300.0 and 1000.0;
-- 15: Devuelve el nombre y apellido de todos los vendedores que han participado en algún pedido
-- realizado por María Santana
select vendedores.nombre, vendedores.apellido from vendedores left join pedidos on vendedores.id=pedidos.id_vendedor where pedidos.id_cliente= 6;
-- 17: Devuelve el nombre de todos los clientes que han realizado algún pedido con el vendedor
-- Daniel Sáez.
select clientes.nombre from clientes left join pedidos on clientes.id=pedidos.id_cliente where pedidos.id_vendedor=1;
-- 18: Devuelve un listado con todos los clientes junto con los datos de los pedidos que han
-- realizado. Este listado también debe incluir los clientes que no han realizado ningún pedido.
-- El listado debe estar ordenado alfabéticamente por el apellido y nombre de los clientes.
select clientes.nombre, clientes.apellido, pedidos.* from clientes left join pedidos on clientes.id=pedidos.id_cliente order by clientes.nombre, clientes.apellido asc;
-- 19: Devuelve un listado con todos los vendedores junto con los datos de los pedidos que han
-- realizado. Este listado también debe incluir los vendedores que no han realizado ningún pedido. 
-- El listado debe estar ordenado alfabéticamente por el apellido y nombre de los vendedores.
select vendedores.nombre, vendedores.apellido, pedidos.* from vendedores inner join pedidos on vendedores.id= pedidos.id_vendedor order by vendedores.nombre, vendedores.apellido asc;
-- 20: .Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido
select * from clientes where id not in (select pedidos.id_cliente from pedidos);
-- 21: Devuelve un listado que solamente muestre los vendedores que no han realizado ningún pedido.
select * from vendedores where id not in (select pedidos.id_vendedor from pedidos);
-- 22: Devuelve un listado con los clientes que no han realizado ningún pedido y de los vendedores
-- que no han participado en ningún pedido. Ordene el listado alfabéticamente por el apellido y
-- el nombre. En el listado deberá diferenciar de algún modo los clientes y los vendedores.
select clientes.* from clientes where id not in (select pedidos.id_cliente from pedidos)
union select * from vendedores where id not in(select pedidos.id_vendedor from pedidos);
-- 23: Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
select sum(pedidos.cantidad) as total from pedidos;
-- 24: Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
select sum(pedidos.cantidad/2) as total from pedidos;
-- 25: Calcula el número total de vendedores distintos que aparecen en la tabla pedido
select sum(distinct pedidos.id_vendedor) as vendedores from pedidos;
-- 26: Calcula el número total de clientes que aparecen en la tabla cliente
select count(clientes.id) as total from clientes;
-- 27: Calcula cuál es la mayor cantidad que aparece en la tabla pedido
select max(pedidos.cantidad) as maximo from pedidos;
-- 28: Calcula cuál es la menor cantidad que aparece en la tabla pedido.
select min(pedidos.cantidad) as minimo from pedidos;
-- 29: Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente
select max(clientes.categoría) as maximo from clientes;
-- 30: .Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. 
-- Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes
-- cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para cada
-- uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del
-- cliente, nombre, apellido, la fecha y el valor de la cantidad.
select clientes.id, clientes.nombre, clientes.apellido, pedidos.fecha, pedidos.cantidad from clientes join pedidos where clientes.id = pedidos.id_cliente  order by clientes.nombre, clientes.apellido, clientes.id asc;
-- 31: Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno
-- de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de $2000 .
select * from clientes join pedidos where clientes.id=pedidos.id_cliente and pedidos.fecha>2000;
-- 32: Calcula el máximo valor de los pedidos realizados para cada uno de los vendedores durante la
-- fecha 2021-08-17. Muestra el identificador del vendedor, nombre, apellido y total.
select vendedores.id, vendedores.nombre, vendedores.apellido, (max(pedidos.cantidad)) as maximo from vendedores join pedidos where vendedores.id=pedidos.id_vendedor and pedidos.fecha='2021-08-17'  order by vendedores.nombre, vendedores.apellido asc;
-- 33: .Devuelve un listado con el identificador de cliente, nombre y apellido y el número total de
-- pedidos que ha realizado cada uno de los clientes. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.
--  Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.
select clientes.id, clientes.nombre,clientes.apellido, count(pedidos.id_cliente) as cantidad, pedidos.fecha from clientes left join pedidos on pedidos.id_cliente = clientes.id group by clientes.id;
-- 34: .Devuelve un listado con el identificador de cliente, nombre, apellido y el número total de
-- pedidos que ha realizado cada uno de clientes durante el año 2020 
select clientes.id, clientes.nombre, clientes.apellido, count(pedidos.cantidad) as total from clientes left join pedidos on pedidos.id_cliente = clientes.id where pedidos.fecha between '2020-01-01' and '2020-12-31';
-- 35: Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año
select distinct year(pedidos.fecha) as año, max(pedidos.cantidad) as maximo from pedidos group by año;
-- 36: Devuelve el número total de pedidos que se han realizado cada año.
select distinct year(pedidos.fecha) as año, count(pedidos.cantidad) as total from pedidos group by año;
-- 37: Devuelve un listado con todos los pedidos que ha realizado Adela Salas. (Sin utilizar INNER JOIN).
select * from pedidos where pedidos.id_cliente=2;
-- 38: Devuelve el número de pedidos en los que ha participado el vendedor Daniel Sáe. (Sin utilizar INNER JOIN)
select count(pedidos.id) as total from pedidos where pedidos.id_vendedor=1;
-- 39: Devuelve los datos del cliente que realizó el pedido más caro en el año 2020. (Sin utilizar INNER JOIN)
select clientes.*, max(pedidos.cantidad) from clientes join pedidos where pedidos.fecha between '2020-01-01' and '2020-12-31';
-- 40: Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana
select pedidos.fecha, min(pedidos.cantidad) as minimo from pedidos where (select clientes.id from clientes where clientes.nombre = 'Pepe');
-- 41: Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
select * from clientes where clientes.id not in (select pedidos.id_cliente from pedidos);
-- 42: Devuelve un listado de los vendedores que no han realizado ningún pedido. (Utilizando IN o NOT IN).
select * from vendedores where vendedores.id not in(select pedidos.id_vendedor from pedidos);
-- 43: Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS)
select * from clientes where not exists (select pedidos.id_cliente from pedidos where pedidos.id_cliente=clientes.id);
-- 44: Devuelve un listado de los vendedores que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
select * from vendedores where not exists (select pedidos.id_vendedor from pedidos where pedidos.id_vendedor=vendedores.id);
