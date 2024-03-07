-- MariaDB dump 10.19  Distrib 10.6.16-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: scopebase
-- ------------------------------------------------------
-- Server version       10.6.16-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bridge_sample_organism`
--

DROP TABLE IF EXISTS `bridge_sample_organism`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bridge_sample_organism` (
  `sample_id` int(11) NOT NULL,
  `organism_id` int(11) NOT NULL,
  PRIMARY KEY (`sample_id`,`organism_id`),
  KEY `organism_id` (`organism_id`),
  CONSTRAINT `bridge_sample_organism_ibfk_1` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`id`),
  CONSTRAINT `bridge_sample_organism_ibfk_2` FOREIGN KEY (`organism_id`) REFERENCES `organism` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bridge_slide_organism`
--

DROP TABLE IF EXISTS `bridge_slide_organism`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bridge_slide_organism` (
  `slide_id` int(11) NOT NULL,
  `organism_id` int(11) NOT NULL,
  PRIMARY KEY (`slide_id`,`organism_id`),
  KEY `organism_id` (`organism_id`),
  CONSTRAINT `bridge_slide_organism_ibfk_1` FOREIGN KEY (`slide_id`) REFERENCES `slide` (`id`),
  CONSTRAINT `bridge_slide_organism_ibfk_2` FOREIGN KEY (`organism_id`) REFERENCES `organism` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `culture`
--

DROP TABLE IF EXISTS `culture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `culture` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `available` bit(1) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `organism_id` int(10) DEFAULT NULL,
  `culture-medium_id` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organism_id` (`organism_id`),
  KEY `culture-medium_id` (`culture-medium_id`),
  CONSTRAINT `culture_ibfk_1` FOREIGN KEY (`organism_id`) REFERENCES `organism` (`id`),
  CONSTRAINT `culture_ibfk_2` FOREIGN KEY (`culture-medium_id`) REFERENCES `culture-medium` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `culture-medium`
--

DROP TABLE IF EXISTS `culture-medium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `culture-medium` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(254) DEFAULT NULL,
  `note` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fixation`
--

DROP TABLE IF EXISTS `fixation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fixation` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `literature`
--

DROP TABLE IF EXISTS `literature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `literature` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `latitude` decimal(8,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `measurement`
--

DROP TABLE IF EXISTS `measurement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measurement` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `culture_id` int(10) DEFAULT NULL,
  `T` decimal(4,1) DEFAULT NULL COMMENT '°C',
  `pH` decimal(4,2) DEFAULT NULL,
  `EC` decimal(9,3) DEFAULT NULL COMMENT 'mS/cm',
  `total-alkalinity` decimal(9,3) DEFAULT NULL COMMENT 'mg(CaCO3)/l',
  `total-hardness` decimal(9,3) DEFAULT NULL COMMENT 'mg(CaCO3)/l',
  `total-chlorine` decimal(9,3) DEFAULT NULL COMMENT 'mg/l',
  `nitrite` decimal(9,3) DEFAULT NULL COMMENT 'mg/l',
  `nitrate` decimal(9,3) DEFAULT NULL COMMENT 'mg/l',
  `note` varchar(255) DEFAULT 'NULL',
  PRIMARY KEY (`id`),
  KEY `culture_id` (`culture_id`),
  CONSTRAINT `measurement_ibfk_1` FOREIGN KEY (`culture_id`) REFERENCES `culture` (`id`),
  CONSTRAINT `measurement_ibfk_2` FOREIGN KEY (`culture_id`) REFERENCES `culture` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mounting-medium`
--

DROP TABLE IF EXISTS `mounting-medium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mounting-medium` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organism`
--

DROP TABLE IF EXISTS `organism`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organism` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note` varchar(255) DEFAULT NULL,
  `species_id` int(11) DEFAULT NULL,
  `literature_id` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `species_id` (`species_id`),
  KEY `literature_id` (`literature_id`),
  CONSTRAINT `organism_ibfk_1` FOREIGN KEY (`species_id`) REFERENCES `species` (`id`),
  CONSTRAINT `organism_ibfk_2` FOREIGN KEY (`literature_id`) REFERENCES `literature` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `preservative`
--

DROP TABLE IF EXISTS `preservative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preservative` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `protocol`
--

DROP TABLE IF EXISTS `protocol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protocol` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `literature_id` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `literature_id` (`literature_id`),
  CONSTRAINT `protocol_ibfk_1` FOREIGN KEY (`literature_id`) REFERENCES `literature` (`id`),
  CONSTRAINT `protocol_ibfk_2` FOREIGN KEY (`literature_id`) REFERENCES `literature` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sample`
--

DROP TABLE IF EXISTS `sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `fixation-time` int(11) DEFAULT NULL,
  `latitude` decimal(8,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `fixation_id` tinyint(4) DEFAULT NULL,
  `sample-type_id` tinyint(4) DEFAULT NULL,
  `preservative_id` tinyint(4) DEFAULT NULL,
  `T` decimal(4,1) DEFAULT NULL COMMENT '°C',
  `pH` decimal(4,2) DEFAULT NULL,
  `EC` decimal(9,3) DEFAULT NULL COMMENT 'mS/cm',
  `total-alkalinity` decimal(9,3) DEFAULT NULL COMMENT 'mg(CaCO3)/l',
  `total-hardness` decimal(9,3) DEFAULT NULL COMMENT 'mg(CaCO3)/l',
  `total-chlorine` decimal(9,3) DEFAULT NULL COMMENT 'mg/l',
  `nitrite` decimal(9,3) DEFAULT NULL COMMENT 'mg/l',
  `nitrate` decimal(9,3) DEFAULT NULL COMMENT 'mg/l',
  `note` varchar(255) DEFAULT NULL,
  `archived` binary(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `fixation_id` (`fixation_id`),
  KEY `sample-type_id` (`sample-type_id`),
  KEY `preservative_id` (`preservative_id`),
  CONSTRAINT `sample_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `sample_ibfk_2` FOREIGN KEY (`fixation_id`) REFERENCES `fixation` (`id`),
  CONSTRAINT `sample_ibfk_3` FOREIGN KEY (`sample-type_id`) REFERENCES `sample-type` (`id`),
  CONSTRAINT `sample_ibfk_4` FOREIGN KEY (`preservative_id`) REFERENCES `preservative` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sample-type`
--

DROP TABLE IF EXISTS `sample-type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample-type` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slide`
--

DROP TABLE IF EXISTS `slide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slide` (
  `id` int(10) NOT NULL,
  `date` date DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `mounting-medium_id` int(11) DEFAULT NULL,
  `staining_id` int(11) DEFAULT NULL,
  `sample_id` int(11) DEFAULT NULL,
  `protocol_id` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `section_id` (`section_id`),
  KEY `mounting-medium_id` (`mounting-medium_id`),
  KEY `staining_id` (`staining_id`),
  KEY `sample_id` (`sample_id`),
  KEY `protocol_id` (`protocol_id`),
  CONSTRAINT `slide_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`),
  CONSTRAINT `slide_ibfk_2` FOREIGN KEY (`mounting-medium_id`) REFERENCES `mounting-medium` (`id`),
  CONSTRAINT `slide_ibfk_3` FOREIGN KEY (`staining_id`) REFERENCES `staining` (`id`),
  CONSTRAINT `slide_ibfk_4` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`id`),
  CONSTRAINT `slide_ibfk_5` FOREIGN KEY (`protocol_id`) REFERENCES `protocol` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `species`
--

DROP TABLE IF EXISTS `species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `species` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staining`
--

DROP TABLE IF EXISTS `staining`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staining` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-07 11:32:34
