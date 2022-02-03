-- Dumping database structure for vorpv2
CREATE DATABASE IF NOT EXISTS `vorpv2` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `vorpv2`;

-- Dumping structure for table vorpv2.posters
CREATE TABLE IF NOT EXISTS `notepad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `text_content` varchar(255) DEFAULT NULL,
  `charidentifier` varchar(255) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;