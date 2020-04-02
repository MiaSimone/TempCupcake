-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tempcupcakes
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
  `Price` double(11,2) NOT NULL,
  PRIMARY KEY (`BottomID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bottoms`
--

LOCK TABLES `bottoms` WRITE;
/*!40000 ALTER TABLE `bottoms` DISABLE KEYS */;
INSERT INTO `bottoms` VALUES (1,'Chocolate',5.00),(2,'Vanilla',5.00),(3,'Nutmeg',5.00),(4,'Pistacio',6.00),(5,'Almond',7.00);
/*!40000 ALTER TABLE `bottoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orderdetails` (
  `orderdetailID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderID` int(11) NOT NULL DEFAULT '0',
  `Date` date NOT NULL,
  `Email` varchar(90) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ToppingID` int(11) NOT NULL,
  `Topping` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ToppingPrice` double(11,2) NOT NULL,
  `BottomID` int(11) NOT NULL,
  `Bottom` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `BottomPrice` double(11,2) NOT NULL,
  `Quantity` int(255) NOT NULL,
  `Sum` double(100,2) NOT NULL,
  PRIMARY KEY (`orderdetailID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` VALUES (3,2,'2020-04-02','robin@somewhere.com',3,'Raspberry',5.00,3,'Nutmeg',5.00,3,30.00),(5,4,'2020-04-02','andreas.noer@hotmail.dk',9,'Blue cheese',9.00,5,'Almond',7.00,10,160.00),(6,0,'2020-04-02','andreas.noer@hotmail.dk',9,'Blue cheese',9.00,5,'Almond',7.00,10,160.00),(7,0,'2020-04-02','andreas.noer@hotmail.dk',9,'Blue cheese',9.00,5,'Almond',7.00,10,160.00),(8,5,'2020-04-02','LM@hell.com',5,'Strawberry',6.00,3,'Nutmeg',5.00,6,66.00),(9,0,'2020-04-02','LM@hell.com',5,'Strawberry',6.00,3,'Nutmeg',5.00,10,110.00);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(90) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `UserID` int(11) NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`OrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (2,'robin@somewhere.com',2,'2020-04-01'),(4,'andreas.noer@hotmail.dk',1,'2020-04-01'),(5,'LM@hell.com',5,'2020-04-01');
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
  `Price` double(11,2) NOT NULL,
  PRIMARY KEY (`ToppingID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toppings`
--

LOCK TABLES `toppings` WRITE;
/*!40000 ALTER TABLE `toppings` DISABLE KEYS */;
INSERT INTO `toppings` VALUES (1,'Chocolate',5.00),(2,'Blueberry',5.00),(3,'Raspberry',5.00),(4,'Crispy',6.00),(5,'Strawberry',6.00),(6,'Rum/Raisin',7.00),(7,'Orange',8.00),(8,'Lemon',8.00),(9,'Blue cheese',9.00);
/*!40000 ALTER TABLE `toppings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Email` varchar(90) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Role` varchar(20) NOT NULL,
  `Balance` double(20,2) NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (0,'Mia de Fries','miadefries@gmail.com','bertil3','employee',500.00),(1,'Andreas Noer','andreas.noer@hotmail.dk','ally','customer',100140.00),(2,'Robin Robinson','robin@somewhere.com','batman','customer',470.00),(3,'Jens Jensen','jens.jensen@gmail.com','missekat','customer',500.00),(4,'Lars Larsen','lars.jysk@gmail.com','jyskmand','customer',476.00),(5,'Lucifer Morningstar','LM@hell.com','pain','customer',324.00),(6,'Sanne Salamonsen','SSa@gmail.com','fisk','customer',500.00);
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

-- Dump completed on 2020-04-02 15:05:57
