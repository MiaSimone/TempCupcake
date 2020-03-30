-- noinspection SqlDialectInspectionForFile

-- noinspection SqlNoDataSourceInspectionForFile

CREATE DATABASE  IF NOT EXISTS `olskerscupcakes`;


USE `olskerscupcakes`;

-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: olskerscupcakes
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bottoms`
--

DROP TABLE IF EXISTS `bottoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bottoms` (
  `BottomID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Price` int(11) NOT NULL,
  PRIMARY KEY (`BottomID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bottoms`
--

LOCK TABLES `bottoms` WRITE;
/*!40000 ALTER TABLE `bottoms` DISABLE KEYS */;
INSERT INTO `bottoms` VALUES (1,'Chocolate',5),(2,'Vanilla',5),(3,'Nutmeg',5),(4,'Pistacio',6),(5,'Almond',7);
/*!40000 ALTER TABLE `bottoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Email` varchar(90) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Role` varchar(20) NOT NULL,
  `Balance` int(20) NOT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Andreas Noer','andreas.noer@hotmail.dk','ally','customer',5000),(2,'Bob Nielsen','bob.nielsen@gmail.com','bobbyman','customer',500),(3,'Robin Robinson','robin@somewhere.com','batman','customer',500),(4,'Jens Jensen','jens.jensen@gmail.com','missekat','customer',500),(5,'Lars Larsen','lars.jysk@gmail.co','jyskmand','customer',500),(6,'Karl Karlsen','karl.karlsen@gmail.com','hemmeligkode','customer',500),(7,'Britta Nielsen','Britta.snyd@hotmail.com','snydsystemet','customer',500),(8,'Kim Larsen','køb.bananer@hotmail.com','herhosmig','customer',500),(9,'Ole Olesen','ole.olesen@live.dk','kode123','customer',500),(10,'Mickey Mus','mickey.mus@gmail.com','andersand','customer',500),(11,'Emilie','emilieErSej@gmail.com','Bella','customer',500),(13,'test','test@gmail.com','test','Customer',500),(14,'Fisen','Fisen@spurgt.dk','prutprut','customer',500),(15,'Kokage','Mums@outlook.com','Muuh','customer',500);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `individualorders`
--

DROP TABLE IF EXISTS `individualorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `individualorders` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderID` int(11) NOT NULL DEFAULT '0',
  `Date` timestamp DEFAULT current_timestamp,
  `Email` varchar(90) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ToppingID` int(11) NOT NULL,
  `Topping` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ToppingPrice` int(11) NOT NULL,
  `BottomID` int(11) NOT NULL,
  `Bottom` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `BottomPrice` int(11) NOT NULL,
  `Quantity` int(255) NOT NULL,
  `Sum` int(100) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `OrderID` (`OrderID`),
  KEY `ToppingID` (`ToppingID`),
  KEY `BottomID` (`BottomID`),
  CONSTRAINT `individualorders_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  CONSTRAINT `individualorders_ibfk_2` FOREIGN KEY (`ToppingID`) REFERENCES `toppings` (`ToppingID`),
  CONSTRAINT `individualorders_ibfk_3` FOREIGN KEY (`BottomID`) REFERENCES `bottoms` (`BottomID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `individualorders`
--

LOCK TABLES `individualorders` WRITE;
/*!40000 ALTER TABLE `individualorders` DISABLE KEYS */;
INSERT INTO `individualorders` VALUES (1,2,'2020-03-20','ole.olesen@live.dk',1,'Chocolate',5,1,'Chocolate',5,2,20),(2,3,'2020-03-21','ole.olesen@live.dk',4,'Crispy',6,3,'Nutmeg',5,10,110),(3,1,'2020-03-19','lars.jysk@gmail.co',7,'Orange',8,5,'Almond',7,1,15),(4,4,'2020-03-21','andreas.noer@hotmail.dk',7,'Orange',8,1,'Chocolate',5,2,26);
/*!40000 ALTER TABLE `individualorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL DEFAULT '0',
  `Email` varchar(90) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `CustomerID` int(11) NOT NULL DEFAULT '0',
  `Date` timestamp DEFAULT current_timestamp,
  PRIMARY KEY (`OrderID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'ole.olesen@live.dk',9,'2020-03-21'),(2,'lars.jysk@gmail.co',5,'2020-03-19');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `toppings`
--

DROP TABLE IF EXISTS `toppings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `toppings` (
  `ToppingID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Price` int(11) NOT NULL,
  PRIMARY KEY (`ToppingID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toppings`
--

LOCK TABLES `toppings` WRITE;
/*!40000 ALTER TABLE `toppings` DISABLE KEYS */;
INSERT INTO `toppings` VALUES (1,'Chocolate',5),(2,'Blueberry',5),(3,'Raspberry',5),(4,'Crispy',6),(5,'Strawberry',6),(6,'Rum/Raisin',7),(7,'Orange',8),(8,'Lemon',8),(9,'Blue cheese',9);
/*!40000 ALTER TABLE `toppings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Email` varchar(90) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Role` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Mia de Fries','miadefries@gmail.com','bertil3','employee'),(2,'Andreas Noer','andreas.noer@hotmail.dk','ally','customer'),(3,'Robin Robinson','robin@somewhere.com','batman','customer'),(4,'Jens Jensen','jens.jensen@gmail.com','missekat','customer'),(5,'Lars Larsen','lars.jysk@gmail.co','jyskmand','customer'),(6,'Karl Karlsen','karl.karlsen@gmail.com','hemmeligkode','customer'),(7,'Britta Nielsen','Britta.snyd@hotmail.com','snydsystemet','customer'),(8,'Kim Larsen','køb.bananer@hotmail.com','herhosmig','customer'),(9,'Ole Olesen','ole.olesen@live.dk','kode123','customer'),(10,'Mickey Mus','mickey.mus@gmail.com','andersand','customer'),(11,'Bob Nielsen','bob.nielsen@gmail.com','bobbyman','customer'),(12,'Emilie','emilieErSej@gmail.com','Bella','customer'),(13,'test','test@gmail.com','test','customer'),(14,'Fisen','Fisen@spurgt.dk','prutprut','customer'),(15,'Kokage','Mums@outlook.com','Muuh','customer');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-26 17:09:52
