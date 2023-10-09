CREATE DATABASE  IF NOT EXISTS `bookshop` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bookshop`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: bookshop
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
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'J.K.Rowling','2023-10-03 16:50:48','2023-10-03 16:50:48'),(2,'Gabriel Garcia Marquez','2023-10-03 20:49:09','2023-10-03 20:49:09'),(3,'William Shakespeare','2023-10-03 20:50:51','2023-10-03 20:50:51'),(4,'Fernando Contreras Castro','2023-10-04 11:33:10','2023-10-04 11:33:10'),(5,'Paulo Coelho','2023-10-04 12:06:15','2023-10-04 12:06:15');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` int NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `num_of_pages` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Harry Potter',1030,'2023-10-03 16:49:15','2023-10-03 16:49:15'),(2,'El coronel no tiene quien le escriba',2000,'2023-10-03 21:18:30','2023-10-03 21:18:30'),(3,'Romeo y Julieta',5000,'2023-10-04 10:58:02','2023-10-04 10:58:02'),(4,'Hamlet',3000,'2023-10-04 10:59:12','2023-10-04 10:59:12'),(5,'El quijote',6000,'2023-10-04 11:20:29','2023-10-04 11:20:29'),(6,'Unica mirando al mar',2000,'2023-10-04 11:22:08','2023-10-04 11:22:08'),(7,'Mamita Yunai',2000,'2023-10-04 11:47:23','2023-10-04 11:47:23'),(8,'Veronica decide morir',1000,'2023-10-04 12:06:37','2023-10-04 12:06:37');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `authors_id` int NOT NULL,
  `books_id` int NOT NULL,
  KEY `fk_favorites_authors_idx` (`authors_id`),
  KEY `fk_favorites_books1_idx` (`books_id`),
  CONSTRAINT `fk_favorites_authors` FOREIGN KEY (`authors_id`) REFERENCES `authors` (`id`),
  CONSTRAINT `fk_favorites_books1` FOREIGN KEY (`books_id`) REFERENCES `books` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (1,1),(2,1),(1,2),(3,4),(3,3),(3,2),(3,1),(1,4),(1,5),(1,7),(2,7),(2,6),(3,8),(2,8),(2,5);
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-05 17:52:49
