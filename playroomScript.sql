-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: playroom
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `borrowedgame`
--

DROP TABLE IF EXISTS `borrowedgame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrowedgame` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CustomerId` int NOT NULL,
  `GameId` int NOT NULL,
  `Status` int NOT NULL DEFAULT '0',
  `BorrowDate` date NOT NULL DEFAULT (curdate()),
  `ReturnDate` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_CustomerId` (`CustomerId`),
  KEY `FK_GameId` (`GameId`),
  CONSTRAINT `FK_CustomerId` FOREIGN KEY (`CustomerId`) REFERENCES `customers` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_GameId` FOREIGN KEY (`GameId`) REFERENCES `games` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowedgame`
--

LOCK TABLES `borrowedgame` WRITE;
/*!40000 ALTER TABLE `borrowedgame` DISABLE KEYS */;
INSERT INTO `borrowedgame` VALUES (6,6,51,1,'2023-02-26','2023-02-26'),(7,6,49,1,'2023-02-26','2023-02-26'),(8,6,56,1,'2023-02-26','2023-02-26'),(9,6,46,1,'2023-02-26','2023-02-26'),(10,6,48,1,'2023-02-26','2023-02-26'),(11,6,49,1,'2023-02-26','2023-02-26'),(12,6,48,1,'2023-02-26','2023-02-26'),(13,6,49,1,'2023-02-26','2023-02-26'),(14,6,48,1,'2023-02-26','2023-02-26'),(15,6,48,1,'2023-02-26','2023-02-26'),(16,6,48,0,'2023-02-26',NULL),(17,6,54,1,'2023-02-26','2023-02-26'),(18,6,55,0,'2023-02-26',NULL),(19,6,48,0,'2023-02-26',NULL),(20,6,49,0,'2023-02-26',NULL);
/*!40000 ALTER TABLE `borrowedgame` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Password` varchar(10) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `PhoneNumber` varchar(10) NOT NULL,
  `GamesNumber` int NOT NULL,
  `Status` int NOT NULL DEFAULT '0',
  `CustomerTypeId` int NOT NULL,
  `userName` varchar(20) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_CustomerType` (`CustomerTypeId`),
  CONSTRAINT `FK_CustomerType` FOREIGN KEY (`CustomerTypeId`) REFERENCES `customertypes` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (6,'Rachel26!','Rachel Choter',' בני ברק','0548523852',4,0,1,'Rachel Choter'),(7,'1234','manager','elad','0548523852',1,0,2,'dsafsd');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customertypes`
--

DROP TABLE IF EXISTS `customertypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customertypes` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customertypes`
--

LOCK TABLES `customertypes` WRITE;
/*!40000 ALTER TABLE `customertypes` DISABLE KEYS */;
INSERT INTO `customertypes` VALUES (1,'משומעם'),(2,'חכם');
/*!40000 ALTER TABLE `customertypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `MinimalAge` int NOT NULL DEFAULT '0',
  `MaximalAge` int NOT NULL DEFAULT '99',
  `Company` varchar(50) NOT NULL,
  `GameTypeId` int NOT NULL,
  `MinutesDuration` int NOT NULL DEFAULT '0',
  `ExistingNumber` int NOT NULL DEFAULT '1',
  `imageName` varchar(60) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_GameTypeId` (`GameTypeId`),
  CONSTRAINT `FK_GameTypeId` FOREIGN KEY (`GameTypeId`) REFERENCES `gametypes` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `valid_age` CHECK (((`MinimalAge` <= 99) and (`MaximalAge` >= 0)))
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (46,'קטאן',9,99,'super',1,10,1,'katan'),(47,'מונופול',8,99,'super',3,10,120,'monopoll'),(48,'שחמט',5,99,'super',1,10,2,'chess'),(49,'טאקי',6,99,'super',4,10,6,'taki'),(50,'שרלוק',9,99,'super',6,10,2,'sharlok'),(51,'פאזל',5,99,'super',1,10,4,'pazel1500'),(52,'פאזל בעלי כנף',2,99,'super',6,10,6,'pazel24'),(53,'חתלתול',6,99,'super',4,10,7,'kitten'),(54,'שם קוד',10,99,'super',5,10,2,'codeNames'),(55,'רמיקוב',5,99,'super',5,10,5,'remmikub'),(56,'סט',7,99,'super',4,10,6,'set'),(57,'פטריית הצבע',2,4,'super',2,10,7,'mushroomColor'),(58,'המפתח להתפתחות',0,5,'super',2,10,7,'theKeyForEvolution'),(59,'טיסה 501',6,99,'super',3,10,7,'fly501'),(60,'המבוך הקסום',5,99,'super',1,10,60,'labyrinth'),(61,'מישמש',6,99,'super',1,10,60,'mishmash'),(62,'אנדרלמוסיה',7,99,'super',4,10,2,'anderlamusia'),(63,'בננה ספליט',7,99,'super',4,10,2,'bannaSplit');
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gametypes`
--

DROP TABLE IF EXISTS `gametypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gametypes` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gametypes`
--

LOCK TABLES `gametypes` WRITE;
/*!40000 ALTER TABLE `gametypes` DISABLE KEYS */;
INSERT INTO `gametypes` VALUES (1,'אסטרטגיה'),(2,'התפתחות'),(3,'מזל'),(4,'קלפים'),(5,'חשיבה'),(6,'פאזל');
/*!40000 ALTER TABLE `gametypes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-26  3:07:57
