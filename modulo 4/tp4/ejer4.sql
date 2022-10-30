DROP SCHEMA IF EXISTS `alquileres` ;
CREATE SCHEMA IF NOT EXISTS `alquileres` DEFAULT CHARACTER SET utf8mb3 ;
USE `alquileres` ;

CREATE TABLE IF NOT EXISTS `alquileres`.`cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `DNI` int(11) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `alquileres`.`reservas` (
  `id` INT NOT NULL,
  `inicio` decimal(45,0) NOT NULL,
  `fin` DECIMAL(45,0) NULL DEFAULT NULL,
  `preciototal` INT NOT NULL,
  `nafta` INT NULL DEFAULT NULL,
  `autoreservado` int(10) NOT NULL,
  `cliente_id` INT NOT NULL,
  PRIMARY KEY (`id`, `cliente_id`, `autoreservado`),
  INDEX `fk_reservas_cliente1_idx` (`cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_reservas_cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `alquileres`.`cliente` (`id`))
	ENGINE = InnoDB
	DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `alquileres`.`auto` (
  `matricula` VARCHAR(45) NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `precio_hora` INT NOT NULL,
  `reservas_id` INT NOT NULL,
  PRIMARY KEY (`matricula`, `reservas_id`),
  INDEX `fk_auto_reservas_idx` (`reservas_id` ASC) VISIBLE,
  CONSTRAINT `fk_auto_reservas`
    FOREIGN KEY (`reservas_id`)
    REFERENCES `alquileres`.`reservas` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `alquileres`.`aval_cliente` (
  `id_aval` INT NOT NULL,
  `cliente_id` INT NOT NULL,
  PRIMARY KEY (`id_aval`, `cliente_id`),
  INDEX `fk_aval_cliente_cliente1_idx` (`cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_aval_cliente_cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `alquileres`.`cliente` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

ALTER TABLE auto modify matricula VARCHAR(45);

-- AGREGAR 3 CLIENTES
insert into cliente (id,nombre,DNI,telefono,direccion) values (1,'Mariela', '46106543','3764947900', 'Las Heras 546');
insert into cliente(id,nombre,DNI,telefono,direccion) values (2, 'Juan', '41321243','3762635697','Roque Perez 2307');
insert into cliente(id,nombre,DNI,telefono,direccion) values (3, 'Marcelo', '25674868','1168916139','Avenida Centenario 5987');

-- AGREGAR 3 autos
insert into auto(matricula,modelo,color,marca,precio_hora,reserva_id) values ('JKD027','siena','gris','fiat','300.0',1);
insert into auto(matricula,modelo,color,marca,precio_hora,reserva_id) values ('AF578FO','cronos','rojo','fiat','900.0',3);
insert into auto(matricula,modelo,color,marca,precio_hora,reserva_id) values ('MLD346','mobi','blanco','fiat','450.0',2);

-- AGREGAR 3 RESERVAS
select * from reservas;
insert into reservas(id,inicio,fin,preciototal,nafta,autoreservado,cliente_id) values (1,'27.10','27.10','600.0','siena',1);
insert into reservas(id,inicio,fin,preciototal,nafta,autoreservado,cliente_id) values (2,'04.06','05.07','13500.0','mobi',3);
insert into reservas(id,inicio,fin,preciototal,nafta,autoreservado,cliente_id) values (3,'26.10','26.10','900.0','cronos',2);
