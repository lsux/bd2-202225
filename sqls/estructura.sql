/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 10.5.7-MariaDB-1:10.5.7+maria~focal : Database - bd2_202225_25002638
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bd2_202225_25002638` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `bd2_202225_25002638`;

/*Table structure for table `Distribuye` */

DROP TABLE IF EXISTS `Distribuye`;

CREATE TABLE `Distribuye` (
  `IdProveedor` int(11) NOT NULL,
  `IdTienda` int(11) NOT NULL,
  PRIMARY KEY (`IdProveedor`,`IdTienda`),
  KEY `Relationship12` (`IdTienda`),
  CONSTRAINT `Relationship11` FOREIGN KEY (`IdProveedor`) REFERENCES `Proveedor` (`IdProveedor`),
  CONSTRAINT `Relationship12` FOREIGN KEY (`IdTienda`) REFERENCES `Tienda` (`IdTienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `Organi` */

DROP TABLE IF EXISTS `Organi`;

CREATE TABLE `Organi` (
  `IdTienda` int(11) NOT NULL,
  `IdProducto` int(11) NOT NULL,
  `CantidadInventario` int(11) DEFAULT NULL,
  `PrecioReferencial` double DEFAULT NULL,
  PRIMARY KEY (`IdTienda`,`IdProducto`),
  KEY `Relationship14` (`IdProducto`),
  CONSTRAINT `Relationship13` FOREIGN KEY (`IdTienda`) REFERENCES `Tienda` (`IdTienda`),
  CONSTRAINT `Relationship14` FOREIGN KEY (`IdProducto`) REFERENCES `Producto` (`IdProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `Producto` */

DROP TABLE IF EXISTS `Producto`;

CREATE TABLE `Producto` (
  `IdProducto` int(11) NOT NULL AUTO_INCREMENT,
  `NombreProducto` char(30) DEFAULT NULL,
  `PrecioProducto` double DEFAULT NULL,
  PRIMARY KEY (`IdProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `Proveedor` */

DROP TABLE IF EXISTS `Proveedor`;

CREATE TABLE `Proveedor` (
  `IdProveedor` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` char(30) DEFAULT NULL,
  PRIMARY KEY (`IdProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `Surte` */

DROP TABLE IF EXISTS `Surte`;

CREATE TABLE `Surte` (
  `IdProveedor` int(11) NOT NULL,
  `IdProducto` int(11) NOT NULL,
  `CantidadProducto` int(11) DEFAULT NULL,
  `PrecioProducto` double DEFAULT NULL,
  PRIMARY KEY (`IdProveedor`,`IdProducto`),
  KEY `Relationship8` (`IdProducto`),
  CONSTRAINT `Relationship7` FOREIGN KEY (`IdProveedor`) REFERENCES `Proveedor` (`IdProveedor`),
  CONSTRAINT `Relationship8` FOREIGN KEY (`IdProducto`) REFERENCES `Producto` (`IdProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `Tienda` */

DROP TABLE IF EXISTS `Tienda`;

CREATE TABLE `Tienda` (
  `IdTienda` int(11) NOT NULL AUTO_INCREMENT,
  `Ciudad` char(20) DEFAULT NULL,
  `Direccion` char(60) DEFAULT NULL,
  `Central` binary(20) NOT NULL,
  PRIMARY KEY (`IdTienda`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `Vende` */

DROP TABLE IF EXISTS `Vende`;

CREATE TABLE `Vende` (
  `IdTienda` int(11) NOT NULL,
  `IdProducto` int(11) NOT NULL,
  `FechaVenta` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdTienda`,`IdProducto`),
  KEY `Relationship10` (`IdProducto`),
  CONSTRAINT `Relationship10` FOREIGN KEY (`IdProducto`) REFERENCES `Producto` (`IdProducto`),
  CONSTRAINT `Relationship9` FOREIGN KEY (`IdTienda`) REFERENCES `Tienda` (`IdTienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
