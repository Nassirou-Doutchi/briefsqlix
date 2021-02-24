-- MySQL dump 10.13  Distrib 5.7.32, for osx10.12 (x86_64)
--
-- Host: localhost    Database: sqlix
-- ------------------------------------------------------
-- Server version	5.7.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `sqlix`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `sqlix` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `sqlix`;

--
-- Table structure for table `absorber`
--

DROP TABLE IF EXISTS `absorber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `absorber` (
  `num_potion` int(11) DEFAULT NULL,
  `date_a` datetime NOT NULL,
  `num_hab` int(11) DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  PRIMARY KEY (`date_a`),
  KEY `num_hab` (`num_hab`),
  KEY `num_potion` (`num_potion`),
  CONSTRAINT `absorber_ibfk_1` FOREIGN KEY (`num_hab`) REFERENCES `habitant` (`num_hab`),
  CONSTRAINT `absorber_ibfk_2` FOREIGN KEY (`num_potion`) REFERENCES `potion` (`num_potion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absorber`
--

LOCK TABLES `absorber` WRITE;
/*!40000 ALTER TABLE `absorber` DISABLE KEYS */;
/*!40000 ALTER TABLE `absorber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorie` (
  `code_cat` char(3) NOT NULL,
  `nom_categ` varchar(50) DEFAULT NULL,
  `nb_points` int(11) DEFAULT NULL,
  PRIMARY KEY (`code_cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie`
--

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` VALUES ('BCN','Bouclier de Centurion',6),('BDN','Bouclier de Décurion',4),('BLE','Bouclier de Légionnaire',3),('BLT','Bouclier de Légat',10),('CCN','Casque de Centurion',3),('CDN','Casque de Décurion',2),('CLE','Casque de Légionnaire',1),('CLT','Casque de Légat',4);
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fabriquer`
--

DROP TABLE IF EXISTS `fabriquer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fabriquer` (
  `num_potion` int(11) NOT NULL,
  `num_hab` int(11) NOT NULL,
  PRIMARY KEY (`num_potion`,`num_hab`),
  KEY `num_hab` (`num_hab`),
  CONSTRAINT `fabriquer_ibfk_1` FOREIGN KEY (`num_hab`) REFERENCES `habitant` (`num_hab`),
  CONSTRAINT `fabriquer_ibfk_2` FOREIGN KEY (`num_potion`) REFERENCES `potion` (`num_potion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fabriquer`
--

LOCK TABLES `fabriquer` WRITE;
/*!40000 ALTER TABLE `fabriquer` DISABLE KEYS */;
/*!40000 ALTER TABLE `fabriquer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitant`
--

DROP TABLE IF EXISTS `habitant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habitant` (
  `num_hab` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `num_qualite` int(11) DEFAULT NULL,
  `num_village` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_hab`),
  KEY `num_qualite` (`num_qualite`),
  KEY `num_village` (`num_village`),
  CONSTRAINT `habitant_ibfk_1` FOREIGN KEY (`num_qualite`) REFERENCES `qualite` (`num_qualite`),
  CONSTRAINT `habitant_ibfk_2` FOREIGN KEY (`num_village`) REFERENCES `village` (`num_village`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitant`
--

LOCK TABLES `habitant` WRITE;
/*!40000 ALTER TABLE `habitant` DISABLE KEYS */;
/*!40000 ALTER TABLE `habitant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `potion`
--

DROP TABLE IF EXISTS `potion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `potion` (
  `num_potion` int(11) NOT NULL AUTO_INCREMENT,
  `lib_potion` varchar(40) DEFAULT NULL,
  `formule` varchar(30) DEFAULT NULL,
  `constituant_principal` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`num_potion`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `potion`
--

LOCK TABLES `potion` WRITE;
/*!40000 ALTER TABLE `potion` DISABLE KEYS */;
INSERT INTO `potion` VALUES (1,'Potion magique n°1',NULL,'Gui'),(2,'Potion magique n°2','4V3C2VA','Vin'),(3,'Potion magique n°3','2C1B','Calva'),(4,'Potion Zen',NULL,'Jus de Betterave'),(5,'Potion Anti Douleur','5C3J1T','Calva'),(6,'Potion magique n°1',NULL,'Gui'),(7,'Potion magique n°2','4V3C2VA','Vin'),(8,'Potion magique n°3','2C1B','Calva'),(9,'Potion Zen',NULL,'Jus de Betterave'),(10,'Potion Anti Douleur','5C3J1T','Calva');
/*!40000 ALTER TABLE `potion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province` (
  `num_province` int(11) NOT NULL AUTO_INCREMENT,
  `nom_province` varchar(30) NOT NULL DEFAULT '',
  `nom_gouverneur` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`num_province`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (1,'',''),(2,'',''),(3,'','');
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qualite`
--

DROP TABLE IF EXISTS `qualite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qualite` (
  `num_qualite` int(11) NOT NULL AUTO_INCREMENT,
  `lib_qualite` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`num_qualite`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qualite`
--

LOCK TABLES `qualite` WRITE;
/*!40000 ALTER TABLE `qualite` DISABLE KEYS */;
INSERT INTO `qualite` VALUES (1,'Chef'),(2,'Druide'),(3,'Barde'),(4,'Guerrier'),(5,'Chasseur'),(6,'Livreur de menhirs'),(7,'Facteur'),(8,'Poissonnière'),(9,'Serveuse');
/*!40000 ALTER TABLE `qualite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resserre`
--

DROP TABLE IF EXISTS `resserre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resserre` (
  `num_resserre` int(11) NOT NULL AUTO_INCREMENT,
  `nom_resserre` varchar(30) NOT NULL DEFAULT '',
  `superficie` int(11) NOT NULL DEFAULT '0',
  `num_village` int(11) NOT NULL,
  PRIMARY KEY (`num_resserre`),
  KEY `num_village` (`num_village`),
  CONSTRAINT `resserre_ibfk_1` FOREIGN KEY (`num_village`) REFERENCES `village` (`num_village`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resserre`
--

LOCK TABLES `resserre` WRITE;
/*!40000 ALTER TABLE `resserre` DISABLE KEYS */;
INSERT INTO `resserre` VALUES (1,'Albinus',720,4),(2,'Vercingetorix',500,6),(3,'Sintrof',895,1);
/*!40000 ALTER TABLE `resserre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trophee`
--

DROP TABLE IF EXISTS `trophee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trophee` (
  `num_trophee` int(11) NOT NULL AUTO_INCREMENT,
  `date_prise` datetime NOT NULL,
  `code_cat` char(3) DEFAULT NULL,
  `num_preneur` int(11) DEFAULT NULL,
  `num_resserre` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_trophee`),
  KEY `num_resserre` (`num_resserre`),
  KEY `code_cat` (`code_cat`),
  CONSTRAINT `trophee_ibfk_1` FOREIGN KEY (`num_resserre`) REFERENCES `resserre` (`num_resserre`),
  CONSTRAINT `trophee_ibfk_2` FOREIGN KEY (`code_cat`) REFERENCES `categorie` (`code_cat`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trophee`
--

LOCK TABLES `trophee` WRITE;
/*!40000 ALTER TABLE `trophee` DISABLE KEYS */;
INSERT INTO `trophee` VALUES (1,'2052-04-03 00:00:00','BLE',7,3),(2,'2052-04-03 00:00:00','BLT',11,3),(3,'2052-05-05 00:00:00','CDN',15,1),(4,'2052-05-05 00:00:00','CLE',16,2),(5,'2052-06-06 00:00:00','CCN',16,2),(6,'2052-06-06 00:00:00','BLT',8,1),(7,'2052-08-18 00:00:00','CCN',8,1),(8,'2052-09-20 00:00:00','CLT',1,3),(9,'2052-10-23 00:00:00','CDN',7,2),(10,'2052-10-23 00:00:00','CLE',16,1);
/*!40000 ALTER TABLE `trophee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `village`
--

DROP TABLE IF EXISTS `village`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `village` (
  `num_village` int(11) NOT NULL AUTO_INCREMENT,
  `nom_village` varchar(30) NOT NULL DEFAULT '',
  `nb_huttes` int(11) NOT NULL DEFAULT '0',
  `num_province` int(11) NOT NULL,
  PRIMARY KEY (`num_village`),
  KEY `num_province` (`num_province`),
  CONSTRAINT `village_ibfk_1` FOREIGN KEY (`num_province`) REFERENCES `province` (`num_province`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `village`
--

LOCK TABLES `village` WRITE;
/*!40000 ALTER TABLE `village` DISABLE KEYS */;
INSERT INTO `village` VALUES (1,'Aquilona',52,1),(2,'Lutèce',25,2),(3,'Aginum',33,3),(4,'Calendes Aquae',42,2),(5,'Condate',38,1),(6,'Gergovie',55,3),(7,'Aquae Calidae',35,2);
/*!40000 ALTER TABLE `village` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-23 20:47:07
