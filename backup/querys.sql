CREATE DATABASE ERP;  

CREATE USER 'test'@'localhost' IDENTIFIED BY '123456789';
GRANT ALL ON *.* TO 'test'@'localhost';


CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cod_cliente` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `estado` enum('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`)
) ENGINE=in

CREATE TABLE `facturas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nro_fact` decimal(10,0) NOT NULL,
  `fec_fact` datetime NOT NULL,
  `nombre_cli` varchar(100) NOT NULL,
  `dir_cli` varchar(100) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `cuentas_cobrar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `num_fact` int NOT NULL,
  `nombre_cli` varchar(100) NOT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `estado` enum('PAGADO','PENDIENTE') NOT NULL DEFAULT 'PENDIENTE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*-------------------------------------------------------*/

select * from clientes c;

select * from facturas f;

select * from cuentas_cobrar cc; 


insert into clientes (cod_cliente, nombre, direccion, estado)
	values 	 (10001, 'DANIEL ALFONSO SUAREZ CANTILLO', 'CALLE ANDALUCIA, 55', 'ACTIVO'),
			 (10002, 'MARIA CAMILA PEREZ VILLALOBO', 'CALLE GODELLA, 87', 'ACTIVO'),
			(10003, 'ANDREINA TOMAS TRUYOL', 'CALLE LATINA, 5', 'ACTIVO'),
		(10004, 'MAURICIO MALDONADO ZAPATA', 'CALLE MIRAFLORES, 45', 'ACTIVO'),
	(10005, 'INDIRA LINETH SANTAMARIA SOTO', 'CALLE MENTOR, 47', 'ACTIVO');


insert into facturas (nro_fact, fec_fact, nombre_cli, dir_cli, total) values 
		(5001, '2024-01-20 14:54:01', 'DANIEL ALFONSO SUAREZ CANTILLO', 'CALLE ANDALUCIA', 5000),
		(5002, '2024-01-21 15:14:12', 'MARIA CAMILA PEREZ VILLALOBO', 'CALLE GODELLA, 87', 7500),
		(5003, '2024-04-04 18:17:41', 'ANDREINA TOMAS TRUYOL', 'CALLE LATINA, 5', 1200),
		(5004, '2024-05-12 15:08:44', 'MAURICIO MALDONADO ZAPATA', 'CALLE MIRAFLORES, 45', 1400),
		(5005, '2024-05-16 16:24:15', 'INDIRA LINETH SANTAMARIA SOTO', 'CALLE MENTOR, 47', 750);
	
	
insert into cuentas_cobrar (nro_fact ,nombre_cli, total, estado)values 
		(5001, 'DANIEL ALFONSO SUAREZ CANTILLO',5000, 'PAGADO'),
		(5002, 'MARIA CAMILA PEREZ VILLALOBO',7500, 'PENDIENTE'),
		(5003, 'ANDREINA TOMAS TRUYOL',1200, 'PENDIENTE'),
		(5004, 'MAURICIO MALDONADO ZAPATA',1400, 'PENDIENTE'),
		(5005, 'INDIRA LINETH SANTAMARIA SOTO',750, 'PAGADO');
	
	
/* código de cliente, número de factura y número de cuenta por cobrar.*/
select cod_cliente as codigo_cliente, f.nro_fact as numero_factura , cc.id as cuentas_cobrar,cc.nro_fact  from clientes c 
left join facturas f on f.nombre_cli = c.nombre and c.direccion = f.dir_cli 
left join cuentas_cobrar cc  on cc. nro_fact  = f.nro_fact ;

/* toda la información de cuentas por cobrar junto con la tabla de clientes*/
select cc.*, c.* from cuentas_cobrar cc 
left join facturas f on f.nro_fact  = cc.nro_fact 
left join clientes c on c.nombre  = f.nombre_cli and c.direccion  =f.dir_cli;


/* toda la información de cada cliente por factura por cuenta por cobrar*/
select * from facturas f 
left join clientes c on c.nombre = f.nombre_cli  and c.direccion  = f.dir_cli 
left join cuentas_cobrar cc on cc.nro_fact = f.nro_fact 

/* modifique la estructura de la tabla de clientes para añadir un nuevo campo de nombre “fecha de alta”*/
alter table clientes add  fecha_de_alta date

/*Agrega la fecha actual a todos los registros de la tabla.*/
update  clientes set fecha_de_alta = now()



