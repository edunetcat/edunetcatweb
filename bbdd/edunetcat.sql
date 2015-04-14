-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: edunetcat
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `assignatures`
--

DROP TABLE IF EXISTS `assignatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignatures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomAssignatura` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignatures`
--

LOCK TABLES `assignatures` WRITE;
/*!40000 ALTER TABLE `assignatures` DISABLE KEYS */;
INSERT INTO `assignatures` VALUES (1,'Matematiques'),(2,'Historia'),(3,'Fisica'),(4,'Quimica');
/*!40000 ALTER TABLE `assignatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignaturescentre`
--

DROP TABLE IF EXISTS `assignaturescentre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignaturescentre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idAssignatura` int(11) DEFAULT NULL,
  `idCentre` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcentre_idx` (`idCentre`),
  KEY `FKassignatura` (`idAssignatura`),
  CONSTRAINT `FKassignatura` FOREIGN KEY (`idAssignatura`) REFERENCES `assignatures` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKcentre` FOREIGN KEY (`idCentre`) REFERENCES `centres` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignaturescentre`
--

LOCK TABLES `assignaturescentre` WRITE;
/*!40000 ALTER TABLE `assignaturescentre` DISABLE KEYS */;
INSERT INTO `assignaturescentre` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1);
/*!40000 ALTER TABLE `assignaturescentre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaluacio`
--

DROP TABLE IF EXISTS `avaluacio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avaluacio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idAlumne` int(11) NOT NULL,
  `idItems` int(11) NOT NULL,
  `descripcioItem` varchar(100) DEFAULT NULL,
  `nota` int(11) DEFAULT NULL,
  `pesNotaFinal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alumneFK_idx` (`idAlumne`),
  KEY `FKItems_idx` (`idItems`),
  CONSTRAINT `alumneFK` FOREIGN KEY (`idAlumne`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKItems` FOREIGN KEY (`idItems`) REFERENCES `itemsavaluació` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaluacio`
--

LOCK TABLES `avaluacio` WRITE;
/*!40000 ALTER TABLE `avaluacio` DISABLE KEYS */;
/*!40000 ALTER TABLE `avaluacio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centres`
--

DROP TABLE IF EXISTS `centres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `centres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `adreça` varchar(100) DEFAULT NULL,
  `telefon` varchar(410) DEFAULT NULL,
  `poblacio` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centres`
--

LOCK TABLES `centres` WRITE;
/*!40000 ALTER TABLE `centres` DISABLE KEYS */;
INSERT INTO `centres` VALUES (1,'centre01','C/ Centre01','93721111111','Barcelona');
/*!40000 ALTER TABLE `centres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `correus`
--

DROP TABLE IF EXISTS `correus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `correus` (
  `idMissatge` int(11) NOT NULL,
  `IdReceptor` int(11) NOT NULL,
  `IdEmissor` int(11) DEFAULT NULL,
  `Llegit` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idMissatge`,`IdReceptor`),
  KEY `FKEmissor_idx` (`IdEmissor`),
  KEY `FKReceptor_idx` (`IdReceptor`),
  CONSTRAINT `FKMissatge` FOREIGN KEY (`idMissatge`) REFERENCES `missatges` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKEmissor` FOREIGN KEY (`IdEmissor`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKReceptor` FOREIGN KEY (`IdReceptor`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correus`
--

LOCK TABLES `correus` WRITE;
/*!40000 ALTER TABLE `correus` DISABLE KEYS */;
/*!40000 ALTER TABLE `correus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curs`
--

DROP TABLE IF EXISTS `curs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `idCentre` int(11) NOT NULL,
  `idAssignatura` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`idCentre`),
  KEY `assignatures_idx` (`idAssignatura`),
  CONSTRAINT `assignatures` FOREIGN KEY (`idAssignatura`) REFERENCES `assignaturescentre` (`idAssignatura`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curs`
--

LOCK TABLES `curs` WRITE;
/*!40000 ALTER TABLE `curs` DISABLE KEYS */;
INSERT INTO `curs` VALUES (1,'Curs01',1,1),(2,'Curs01',1,2),(3,'Curs01',1,3),(4,'Curs02',1,2),(5,'Curs02',1,3),(6,'Curs02',1,4);
/*!40000 ALTER TABLE `curs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expedient`
--

DROP TABLE IF EXISTS `expedient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expedient` (
  `idAlumne` int(11) NOT NULL,
  `idAssignatura` int(11) NOT NULL,
  `estat` varchar(10) DEFAULT NULL,
  `any` year(4) NOT NULL,
  `nota` int(11) DEFAULT NULL,
  `semestre` varchar(10) NOT NULL,
  `idCentre` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAlumne`,`idAssignatura`,`any`,`semestre`),
  KEY `alumneassignatura_idx` (`idAssignatura`),
  CONSTRAINT `alumneassignatura` FOREIGN KEY (`idAssignatura`) REFERENCES `assignaturescentre` (`idAssignatura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `assignaturaAlumne` FOREIGN KEY (`idAlumne`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expedient`
--

LOCK TABLES `expedient` WRITE;
/*!40000 ALTER TABLE `expedient` DISABLE KEYS */;
INSERT INTO `expedient` VALUES (1,1,'Superada',2013,5,'2',1),(1,2,'Cursant',2013,0,'2',1),(1,3,'Cursant',2013,0,'2',1),(2,3,'Cursant',2013,0,'2',1),(2,4,'Cursant',2013,0,'2',1);
/*!40000 ALTER TABLE `expedient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historialassignatures`
--

DROP TABLE IF EXISTS `historialassignatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historialassignatures` (
  `idProfessor` int(11) DEFAULT NULL,
  `idAssignatura` int(11) NOT NULL,
  `any` year(4) NOT NULL,
  `semestre` varchar(45) NOT NULL,
  `idCentre` varchar(45) NOT NULL,
  PRIMARY KEY (`any`,`idAssignatura`,`idCentre`,`semestre`),
  KEY `assignaturaProfessor_idx` (`idAssignatura`),
  KEY `rofessorAssignatura` (`idProfessor`),
  CONSTRAINT `rofessorAssignatura` FOREIGN KEY (`idProfessor`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `assignaturaProfessor` FOREIGN KEY (`idAssignatura`) REFERENCES `assignaturescentre` (`idAssignatura`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historialassignatures`
--

LOCK TABLES `historialassignatures` WRITE;
/*!40000 ALTER TABLE `historialassignatures` DISABLE KEYS */;
INSERT INTO `historialassignatures` VALUES (7,1,2013,'2','1'),(8,2,2013,'2','1'),(9,3,2013,'2','1');
/*!40000 ALTER TABLE `historialassignatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemsavaluació`
--

DROP TABLE IF EXISTS `itemsavaluació`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemsavaluació` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idAssignatura` int(11) NOT NULL,
  `idCentre` int(11) NOT NULL,
  `Descripcio` varchar(100) DEFAULT NULL,
  `dataEntrega` date DEFAULT NULL,
  PRIMARY KEY (`id`,`idAssignatura`,`idCentre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemsavaluació`
--

LOCK TABLES `itemsavaluació` WRITE;
/*!40000 ALTER TABLE `itemsavaluació` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemsavaluació` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `missatges`
--

DROP TABLE IF EXISTS `missatges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `missatges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcio` varchar(100) DEFAULT NULL,
  `DataEnvio` date DEFAULT NULL,
  `HoraEnvio` datetime DEFAULT NULL,
  `Missatge` varchar(1000) DEFAULT NULL,
  `ArxiuAdjunt` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `missatges`
--

LOCK TABLES `missatges` WRITE;
/*!40000 ALTER TABLE `missatges` DISABLE KEYS */;
/*!40000 ALTER TABLE `missatges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `NIF` varchar(10) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `cognoms` varchar(255) DEFAULT NULL,
  `dataNaixement` date DEFAULT NULL,
  `adreça` varchar(255) DEFAULT NULL,
  `població` varchar(255) DEFAULT NULL,
  `codiPostal` varchar(5) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `idTipusUsuari` int(11) NOT NULL,
  `idCEntre` int(11) DEFAULT NULL,
  `nivell` int(11) DEFAULT NULL,
  `authKey` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TipusUsuari_idx` (`idTipusUsuari`),
  KEY `centre_idx` (`idCEntre`),
  CONSTRAINT `TipusUsuari` FOREIGN KEY (`idTipusUsuari`) REFERENCES `tipususuari` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `centre` FOREIGN KEY (`idCEntre`) REFERENCES `centres` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'mail1@gmail.com','111111111A','Albert','Acognom Acognom','0000-00-00','Carrer A 1','Barna','08111','aaa',1,1,1,''),(2,'mail2@gmail.com','222222222B','Bernat','Bcognom Bcognom','0000-00-00','Carrer B 2','Barna','08111','bbb',1,1,1,''),(3,'mail3@gmail.com','333333333C','Carles','Ccognom Ccognom','0000-00-00','Carrer C 3','Barna','08111','ccc',1,1,1,''),(4,'mail4@gmail.com','444444444D','Daniel','Dcognom Dcognom','0000-00-00','Carrer D 4','Barna','08111','ddd',1,1,1,''),(5,'mail5@gmail.com','555555555E','Emili','Ecognom Ecognom','0000-00-00','Carrer E 5','Barna','08111','eee',2,1,3,''),(6,'mail6@gmail.com','666666666F','Francesc','Fcognom Fcognom','0000-00-00','Carrer F 6','Barna','08111','fff',2,1,3,''),(7,'mail7@gmail.com','777777777G','Guillem','Gcognom Gcognom','0000-00-00','Carrer G 7','Barna','08111','ggg',2,1,3,''),(8,'mail8@gmail.com','888888888H','Hugo','Hcognom Hcognom','0000-00-00','Carrer H 8','Barna','08111','hhh',3,1,6,''),(9,'mail9@gmail.com','999999999I','Isaac','Icognom Icognom','0000-00-00','Carrer I 9','Barna','08111','iii',3,1,6,''),(10,'mail10@gmail.com','100000000J','Joan','Jcognom Jcognom','0000-00-00','Carrer J 10','Barna','08111','jjj',3,1,6,''),(11,'mail11@gmail.com','110000000J','Kilian','Kcognom Kcognom','0000-00-00','Carrer K 11','Barna','08111','kkk',4,1,9,'');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacions`
--

DROP TABLE IF EXISTS `relacions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacions` (
  `idPersona` int(11) NOT NULL,
  `idPersonaDescendent` int(11) NOT NULL,
  PRIMARY KEY (`idPersona`,`idPersonaDescendent`),
  KEY `relacio_idx` (`idPersonaDescendent`),
  CONSTRAINT `relacio` FOREIGN KEY (`idPersonaDescendent`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacions`
--

LOCK TABLES `relacions` WRITE;
/*!40000 ALTER TABLE `relacions` DISABLE KEYS */;
/*!40000 ALTER TABLE `relacions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipususuari`
--

DROP TABLE IF EXISTS `tipususuari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipususuari` (
  `id` int(11) NOT NULL,
  `nomTipusUsuari` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipususuari`
--

LOCK TABLES `tipususuari` WRITE;
/*!40000 ALTER TABLE `tipususuari` DISABLE KEYS */;
INSERT INTO `tipususuari` VALUES (1,'alumne'),(2,'pare/mare'),(3,'professor'),(4,'administrador');
/*!40000 ALTER TABLE `tipususuari` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-03 11:51:07
