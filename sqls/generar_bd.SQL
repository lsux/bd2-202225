/*
Created: 4/5/2022
Modified: 4/5/2022
Model: MySQL 8.0
Database: MySQL 8.0
*/

-- Create tables section -------------------------------------------------

-- Table Tienda

CREATE TABLE `Tienda`
(
  `IdTienda` Int NOT NULL AUTO_INCREMENT,
  `Ciudad` Char(20),
  `Direccion` Char(60),
  `Central` Binary(20) NOT NULL,
  PRIMARY KEY (`IdTienda`)
)
;

-- Table Producto

CREATE TABLE `Producto`
(
  `IdProducto` Int NOT NULL AUTO_INCREMENT,
  `NombreProducto` Char(30),
  `PrecioProducto` Double,
  PRIMARY KEY (`IdProducto`)
)
;

-- Table Proveedor

CREATE TABLE `Proveedor`
(
  `IdProveedor` Int NOT NULL AUTO_INCREMENT,
  `Nombre` Char(30),
  PRIMARY KEY (`IdProveedor`)
)
;

-- Table Surte

CREATE TABLE `Surte`
(
  `IdProveedor` Int NOT NULL,
  `IdProducto` Int NOT NULL,
  `CantidadProducto` Int,
  `PrecioProducto` Double
)
;

ALTER TABLE `Surte` ADD PRIMARY KEY (`IdProveedor`, `IdProducto`)
;

-- Table Vende

CREATE TABLE `Vende`
(
  `IdTienda` Int NOT NULL,
  `IdProducto` Int NOT NULL,
  `FechaVenta` Timestamp NULL
)
;

ALTER TABLE `Vende` ADD PRIMARY KEY (`IdTienda`, `IdProducto`)
;

-- Table Distribuye

CREATE TABLE `Distribuye`
(
  `IdProveedor` Int NOT NULL,
  `IdTienda` Int NOT NULL
)
;

ALTER TABLE `Distribuye` ADD PRIMARY KEY (`IdProveedor`, `IdTienda`)
;

-- Table Organi

CREATE TABLE `Organi`
(
  `IdTienda` Int NOT NULL,
  `IdProducto` Int NOT NULL,
  `CantidadInventario` Int,
  `PrecioReferencial` Double
)
;

ALTER TABLE `Organi` ADD PRIMARY KEY (`IdTienda`, `IdProducto`)
;

-- Create foreign keys (relationships) section -------------------------------------------------

ALTER TABLE `Surte` ADD CONSTRAINT `Relationship7` FOREIGN KEY (`IdProveedor`) REFERENCES `Proveedor` (`IdProveedor`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Surte` ADD CONSTRAINT `Relationship8` FOREIGN KEY (`IdProducto`) REFERENCES `Producto` (`IdProducto`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Vende` ADD CONSTRAINT `Relationship9` FOREIGN KEY (`IdTienda`) REFERENCES `Tienda` (`IdTienda`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Vende` ADD CONSTRAINT `Relationship10` FOREIGN KEY (`IdProducto`) REFERENCES `Producto` (`IdProducto`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Distribuye` ADD CONSTRAINT `Relationship11` FOREIGN KEY (`IdProveedor`) REFERENCES `Proveedor` (`IdProveedor`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Distribuye` ADD CONSTRAINT `Relationship12` FOREIGN KEY (`IdTienda`) REFERENCES `Tienda` (`IdTienda`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Organi` ADD CONSTRAINT `Relationship13` FOREIGN KEY (`IdTienda`) REFERENCES `Tienda` (`IdTienda`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Organi` ADD CONSTRAINT `Relationship14` FOREIGN KEY (`IdProducto`) REFERENCES `Producto` (`IdProducto`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

