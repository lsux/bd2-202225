/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 10.5.7-MariaDB-1:10.5.7+maria~focal : Database - bd2_202225_27506408
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bd2_202225_27506408` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bd2_202225_27506408`;

/*Table structure for table `Clientes` */

DROP TABLE IF EXISTS `Clientes`;

CREATE TABLE `Clientes` (
  `Cedula` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `Clientes` */

insert  into `Clientes`(`Cedula`,`nombre`,`Direccion`) values 
(1100100,'Sergio Salazar Hijo','Calle Redondo, ra Edo. Carabobo'),
(1111111,'Lcda. Isabel Martos','Avenida Montenegro, 9, Ha Edo. Barinas'),
(2222222,'Nayara Esquibel Laboy','Carretera Marina Parrao. Yaracuy'),
(3333333,'Lidia Marín Hijo','Callejón Eduardo, Nro 79, Capital, 9815'),
(4444444,'Samuel Abrego','Callejón Jana Ballesteros,Edo. Mérida'),
(5555555,'Dn. Joel Feliciano','Av. Cisneros, 593, HEdo. Cojedes'),
(6666666,'Oliver Beltrán Hijo','Av. Patricia Córdo Edo. Anzoátegui'),
(7777777,'Candela Núñez','Callejón Oliver, 797, Distrito Capital, 2783'),
(8888888,'Lcdo. Leonardo Roca','Carretera Córd Edo. Amazonas, 9821'),
(9999999,'Isaac Alvaro Vargas Griego','Vereda Rodrl Valle Edo. Falcón');

/*Table structure for table `Franquicia` */

DROP TABLE IF EXISTS `Franquicia`;

CREATE TABLE `Franquicia` (
  `idFranquicia` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idFranquicia`),
  UNIQUE KEY `Nombre_UNIQUE` (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `Franquicia` */

/*Table structure for table `Inventario` */

DROP TABLE IF EXISTS `Inventario`;

CREATE TABLE `Inventario` (
  `idInventario` int(11) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `id_tienda` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`idInventario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `Inventario` */

insert  into `Inventario`(`idInventario`,`id_producto`,`id_tienda`,`cantidad`) values 
(1,10,1,20),
(2,11,2,75),
(3,12,3,411),
(4,13,4,22),
(5,14,5,25),
(6,15,6,4);

/*Table structure for table `Mercancia` */

DROP TABLE IF EXISTS `Mercancia`;

CREATE TABLE `Mercancia` (
  `idMercancia` int(11) NOT NULL,
  `id_inventario_destino` int(11) DEFAULT NULL,
  `fecha_de_recibido` date DEFAULT NULL,
  `id_distribuidor` int(11) DEFAULT NULL,
  `motivo` text DEFAULT NULL,
  `distribuidor_iddistribuidor` int(11) NOT NULL,
  `Inventario_idInventario` int(11) NOT NULL,
  PRIMARY KEY (`idMercancia`,`Inventario_idInventario`),
  KEY `fk_Mercancia_distribuidor1_idx` (`distribuidor_iddistribuidor`),
  KEY `fk_Mercancia_Inventario1_idx` (`Inventario_idInventario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `Mercancia` */

/*Table structure for table `Producto` */

DROP TABLE IF EXISTS `Producto`;

CREATE TABLE `Producto` (
  `idProducto` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `Precio` double DEFAULT NULL,
  `Inventario_idInventario` int(11) NOT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `fk_Producto_Inventario1_idx` (`Inventario_idInventario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `Producto` */

insert  into `Producto`(`idProducto`,`nombre`,`Precio`,`Inventario_idInventario`) values 
(10,'jabon',2232,1),
(11,'shampo',23.4,2),
(12,'sal',1,3),
(13,'azucar',21341,4),
(14,'escoba',43,5),
(15,'maquillaje',2333,6);

/*Table structure for table `Provedores` */

DROP TABLE IF EXISTS `Provedores`;

CREATE TABLE `Provedores` (
  `idProvedores` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idProvedores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `Provedores` */

/*Table structure for table `Provedores_has_Franquicia` */

DROP TABLE IF EXISTS `Provedores_has_Franquicia`;

CREATE TABLE `Provedores_has_Franquicia` (
  `Provedores_idProvedores` int(11) NOT NULL,
  `Franquicia_idFranquicia` int(11) NOT NULL,
  PRIMARY KEY (`Provedores_idProvedores`,`Franquicia_idFranquicia`),
  KEY `fk_Provedores_has_Franquicia_Franquicia1_idx` (`Franquicia_idFranquicia`),
  KEY `fk_Provedores_has_Franquicia_Provedores1_idx` (`Provedores_idProvedores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `Provedores_has_Franquicia` */

/*Table structure for table `Tienda` */

DROP TABLE IF EXISTS `Tienda`;

CREATE TABLE `Tienda` (
  `idtienda` int(11) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Franquicia_idFranquicia` int(11) NOT NULL,
  PRIMARY KEY (`idtienda`,`Franquicia_idFranquicia`),
  KEY `fk_Tienda_Franquicia_idx` (`Franquicia_idFranquicia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `Tienda` */

/*Table structure for table `Venta` */

DROP TABLE IF EXISTS `Venta`;

CREATE TABLE `Venta` (
  `num_factura` int(11) NOT NULL,
  `id_producto` varchar(45) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `monto_total` double DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_tienda` int(11) DEFAULT NULL,
  `Tienda_idtienda` int(11) NOT NULL,
  `Tienda_Franquicia_idFranquicia` int(11) NOT NULL,
  `fecha` varchar(45) DEFAULT NULL,
  `Clientes_Cedula` int(11) NOT NULL,
  PRIMARY KEY (`num_factura`,`Tienda_idtienda`,`Tienda_Franquicia_idFranquicia`,`Clientes_Cedula`),
  KEY `fk_Venta_Tienda1_idx` (`Tienda_idtienda`,`Tienda_Franquicia_idFranquicia`),
  KEY `fk_Venta_Clientes1_idx` (`Clientes_Cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `Venta` */

/*Table structure for table `distribuidor` */

DROP TABLE IF EXISTS `distribuidor`;

CREATE TABLE `distribuidor` (
  `iddistribuidor` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `Franquicia_idFranquicia` int(11) NOT NULL,
  PRIMARY KEY (`iddistribuidor`,`Franquicia_idFranquicia`),
  KEY `fk_distribuidor_Franquicia1_idx` (`Franquicia_idFranquicia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `distribuidor` */

insert  into `distribuidor`(`iddistribuidor`,`nombre`,`Franquicia_idFranquicia`) values 
(1,'pero',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
