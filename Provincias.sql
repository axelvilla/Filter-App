-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.24-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para provincias
CREATE DATABASE IF NOT EXISTS `provincias` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `provincias`;

-- Volcando estructura para tabla provincias.capital
CREATE TABLE IF NOT EXISTS `capital` (
  `nombre` varchar(150) NOT NULL,
  `habitantes_capital` int(11) DEFAULT NULL,
  `provincia_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`nombre`),
  KEY `provincia_id` (`provincia_id`),
  CONSTRAINT `capital_ibfk_1` FOREIGN KEY (`provincia_id`) REFERENCES `provincia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla provincias.capital: ~24 rows (aproximadamente)
INSERT INTO `capital` (`nombre`, `habitantes_capital`, `provincia_id`) VALUES
	('Caba', 3075646, 23),
	('Córdoba', 1500000, 19),
	('Corrientes', 360000, 9),
	('Formosa', 235000, 7),
	('La Plata', 800000, 22),
	('La Rioja', 205000, 24),
	('Mendoza', 1200000, 18),
	('Neuquén', 265000, 1),
	('Paraná', 250000, 21),
	('Posadas', 275000, 10),
	('Rawson', 35000, 3),
	('Resistencia', 300000, 8),
	('Río Gallegos', 98000, 4),
	('Salta', 620000, 12),
	('San Fernando del Valle de Catamarca', 160000, 14),
	('San Juan', 480000, 16),
	('San Luis', 170000, 17),
	('San Miguel de Tucumán', 830000, 13),
	('San Salvador de Jujuy', 300000, 11),
	('Santa Fe', 430000, 20),
	('Santa Rosa', 118000, 6),
	('Santiago del Estero', 320000, 15),
	('Usuahia', 82000, 5),
	('Viedma', 80000, 2);

-- Volcando estructura para tabla provincias.provincia
CREATE TABLE IF NOT EXISTS `provincia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `cantidad_habitantes` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `region_id` (`region_id`),
  CONSTRAINT `provincia_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla provincias.provincia: ~24 rows (aproximadamente)
INSERT INTO `provincia` (`id`, `nombre`, `cantidad_habitantes`, `region_id`) VALUES
	(1, 'Neuquen', 726590, 1),
	(2, 'Rio Negro', 762067, 1),
	(3, 'Chubut', 603120, 1),
	(4, 'Santa Cruz', 337226, 1),
	(5, 'Tierra del Fuego', 190641, 1),
	(6, 'La pampa', 361859, 1),
	(7, 'Formosa', 606041, 2),
	(8, 'Chaco', 1143201, 2),
	(9, 'Corrientes', 1210221, 2),
	(10, 'Misiones', 1239862, 2),
	(11, 'Jujuy', 797955, 3),
	(12, 'Salta', 1440672, 3),
	(13, 'Tucuman', 1703186, 3),
	(14, 'Catamarca', 429562, 3),
	(15, 'Santiago del Estero', 1050184, 3),
	(16, 'San Juan', 818234, 4),
	(17, 'San Luis', 540905, 4),
	(18, 'Mendoza', 2014533, 4),
	(19, 'Cordoba', 3978904, 5),
	(20, 'Santa Fe', 3397532, 5),
	(21, 'Entre Rios', 1385961, 5),
	(22, 'Buenos Aires', 17410000, 6),
	(23, 'CABA', 3075646, 6),
	(24, 'La Rioja', 383865, 3);

-- Volcando estructura para tabla provincias.region
CREATE TABLE IF NOT EXISTS `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla provincias.region: ~6 rows (aproximadamente)
INSERT INTO `region` (`id`, `nombre`) VALUES
	(1, 'Patagonia'),
	(2, 'Noreste'),
	(3, 'Noroeste'),
	(4, 'Cuyo'),
	(5, 'Centro'),
	(6, 'Buenos Aires');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
