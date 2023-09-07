-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: store
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cno` int NOT NULL AUTO_INCREMENT,
  `pno` int DEFAULT NULL,
  `pname` varchar(20) DEFAULT NULL,
  `mid` varchar(20) DEFAULT NULL,
  `pprice` int DEFAULT NULL,
  `cquantity` int DEFAULT NULL,
  `ctotalprice` int DEFAULT NULL,
  PRIMARY KEY (`cno`),
  KEY `pno` (`pno`),
  KEY `mid` (`mid`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`pno`) REFERENCES `product` (`pno`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`mid`) REFERENCES `member` (`mid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `mid` varchar(20) NOT NULL,
  `mpw` varchar(20) NOT NULL,
  `mname` varchar(20) DEFAULT NULL,
  `mbirth` date DEFAULT NULL,
  `mphone` varchar(20) DEFAULT NULL,
  `madress` varchar(45) DEFAULT NULL,
  `mposition` varchar(20) DEFAULT NULL,
  `mdiv` int DEFAULT '1',
  PRIMARY KEY (`mid`),
  CONSTRAINT `mdiv_check` CHECK ((`mdiv` in (1,2)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `ono` int NOT NULL AUTO_INCREMENT,
  `pno` int DEFAULT NULL,
  `mid` varchar(20) DEFAULT NULL,
  `cno` int DEFAULT NULL,
  `pname` varchar(20) DEFAULT NULL,
  `pprice` int DEFAULT NULL,
  `cquantity` int DEFAULT NULL,
  `mname` varchar(20) DEFAULT NULL,
  `madress` varchar(45) DEFAULT NULL,
  `mphone` varchar(20) DEFAULT NULL,
  `otext` varchar(50) DEFAULT NULL,
  `opay` int DEFAULT NULL,
  `ctotalprice` int DEFAULT NULL,
  `otime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `odiv` int DEFAULT NULL,
  PRIMARY KEY (`ono`),
  KEY `pno` (`pno`),
  KEY `mid` (`mid`),
  KEY `cno` (`cno`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`pno`) REFERENCES `product` (`pno`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`mid`) REFERENCES `member` (`mid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `order_ibfk_3` FOREIGN KEY (`cno`) REFERENCES `cart` (`cno`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='50';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `pno` int NOT NULL AUTO_INCREMENT,
  `pname` varchar(45) DEFAULT NULL,
  `pcategory` varchar(20) DEFAULT NULL,
  `pprice` int DEFAULT NULL,
  `pquantity` int DEFAULT NULL,
  `pml` int DEFAULT NULL,
  `palcohol` decimal(3,1) DEFAULT NULL,
  `pcountry` varchar(20) DEFAULT NULL,
  `ptext` varchar(200) DEFAULT NULL,
  `purl` varchar(200) DEFAULT NULL,
  `mid` varchar(20) DEFAULT NULL,
  `pdiv` int DEFAULT NULL,
  PRIMARY KEY (`pno`),
  KEY `mid` (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reply` (
  `rno` int NOT NULL AUTO_INCREMENT,
  `pno` int DEFAULT NULL,
  `mid` varchar(20) DEFAULT NULL,
  `rtext` varchar(200) DEFAULT NULL,
  `rtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rno`),
  KEY `mid` (`mid`),
  KEY `reply_ibfk_2_idx` (`pno`),
  CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `member` (`mid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-01 18:34:27
