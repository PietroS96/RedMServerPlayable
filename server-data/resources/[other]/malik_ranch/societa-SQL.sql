-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versione server:              10.4.10-MariaDB - mariadb.org binary distribution
-- S.O. server:                  Win64
-- HeidiSQL Versione:            10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dump della struttura del database vorpv2
CREATE DATABASE IF NOT EXISTS `vorpv2` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `vorpv2`;

-- Dump della struttura di tabella vorpv2.societa
CREATE TABLE IF NOT EXISTS `societa` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `nomesocieta` longtext NOT NULL,
  `soldi` int(11) NOT NULL DEFAULT 0,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '{}' CHECK (json_valid(`items`)),
  `percentualem` int(10) unsigned NOT NULL DEFAULT 0,
  `latte` int(10) unsigned NOT NULL DEFAULT 0,
  `percentualep` int(11) NOT NULL DEFAULT 0,
  `lana` int(11) NOT NULL DEFAULT 0,
  `percentualeg` int(11) NOT NULL DEFAULT 0,
  `uova` int(11) NOT NULL DEFAULT 0,
  `percentualepig` int(11) NOT NULL DEFAULT 0,
  `salamelle` int(11) NOT NULL DEFAULT 0,
  UNIQUE KEY `id` (`id`),
  KEY `nomesocieta` (`nomesocieta`(768))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dump dei dati della tabella vorpv2.societa: ~1 rows (circa)
/*!40000 ALTER TABLE `societa` DISABLE KEYS */;
INSERT INTO `societa` (`id`, `nomesocieta`, `soldi`, `items`, `percentualem`, `latte`, `percentualep`, `lana`, `percentualeg`, `uova`, `percentualepig`, `salamelle`) VALUES
	(1, 'societa_ranch', 0, '{}', 0, 0, 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `societa` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
