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

/*Data for the table `Distribuye` */

/*Data for the table `Organi` */

/*Data for the table `Producto` */

insert  into `Producto`(`IdProducto`,`NombreProducto`,`PrecioProducto`) values 
(1,'Zapato',20),
(2,'Gorra',5),
(3,'Pantalon',15);

/*Data for the table `Proveedor` */

insert  into `Proveedor`(`IdProveedor`,`Nombre`) values 
(1,'Traki'),
(2,'Adidas'),
(3,'Puma');

/*Data for the table `Surte` */

/*Data for the table `Tienda` */

insert  into `Tienda`(`IdTienda`,`Ciudad`,`Direccion`,`Central`) values 
(1,'Puerto Ordaz','Alta Vista','Si\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),
(2,'Puerto Ordaz','La Churuata','No\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),
(3,'Puerto Ordaz','Villa Colombia','No\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0');

/*Data for the table `Vende` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
