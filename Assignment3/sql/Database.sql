CREATE DATABASE  IF NOT EXISTS `1200blockbusters+` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `1200blockbusters+`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: 1200blockbusters+
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actor` (
  `fName` varchar(300) NOT NULL,
  `lName` varchar(300) NOT NULL,
  `birthday` date NOT NULL,
  `language` varchar(300) DEFAULT NULL,
  `location` varchar(300) DEFAULT NULL,
  `isPopularActor` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`fName`,`lName`,`birthday`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `actoraward`
--

DROP TABLE IF EXISTS `actoraward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actoraward` (
  `awardName` varchar(300) NOT NULL,
  `dateReceived` date NOT NULL,
  `fName` varchar(300) NOT NULL,
  `lName` varchar(300) NOT NULL,
  `birthday` date NOT NULL,
  PRIMARY KEY (`awardName`,`dateReceived`),
  KEY `fName` (`fName`,`lName`,`birthday`),
  CONSTRAINT `actoraward_ibfk_1` FOREIGN KEY (`fName`, `lName`, `birthday`) REFERENCES `actor` (`fName`, `lName`, `birthday`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `appearance`
--

DROP TABLE IF EXISTS `appearance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appearance` (
  `fName` varchar(45) NOT NULL,
  `lName` varchar(45) NOT NULL,
  `birthday` date NOT NULL,
  `title` varchar(300) NOT NULL,
  `roleName` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`fName`,`lName`,`birthday`,`title`),
  KEY `title` (`title`),
  CONSTRAINT `appearance_ibfk_1` FOREIGN KEY (`fName`, `lName`, `birthday`) REFERENCES `actor` (`fName`, `lName`, `birthday`) ON UPDATE CASCADE,
  CONSTRAINT `appearance_ibfk_2` FOREIGN KEY (`title`) REFERENCES `movie` (`title`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `awardwinningactor`
--

DROP TABLE IF EXISTS `awardwinningactor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awardwinningactor` (
  `awardName` varchar(200) NOT NULL,
  `fName` varchar(45) NOT NULL,
  `lName` varchar(45) NOT NULL,
  `birthday` date NOT NULL,
  PRIMARY KEY (`awardName`,`fName`,`lName`,`birthday`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract` (
  `contractStartDate` date NOT NULL,
  `contractEndDate` date DEFAULT NULL,
  PRIMARY KEY (`contractStartDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `direction`
--

DROP TABLE IF EXISTS `direction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direction` (
  `fName` varchar(45) NOT NULL,
  `lName` varchar(45) NOT NULL,
  `birthday` date NOT NULL,
  `title` varchar(300) NOT NULL,
  `productionCompany` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`fName`,`lName`,`birthday`,`title`),
  KEY `title` (`title`),
  CONSTRAINT `direction_ibfk_1` FOREIGN KEY (`fName`, `lName`, `birthday`) REFERENCES `director` (`fName`, `lName`, `birthday`) ON UPDATE CASCADE,
  CONSTRAINT `direction_ibfk_2` FOREIGN KEY (`title`) REFERENCES `movie` (`title`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `director` (
  `fName` varchar(300) NOT NULL,
  `lName` varchar(300) NOT NULL,
  `birthday` date NOT NULL,
  `firstFilm` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`fName`,`lName`,`birthday`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `directoraward`
--

DROP TABLE IF EXISTS `directoraward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directoraward` (
  `awardName` varchar(200) NOT NULL,
  `dateReceived` date NOT NULL,
  `fName` varchar(45) NOT NULL,
  `lName` varchar(45) NOT NULL,
  `birthday` date NOT NULL,
  PRIMARY KEY (`awardName`,`dateReceived`),
  KEY `fName` (`fName`,`lName`,`birthday`),
  CONSTRAINT `directoraward_ibfk_1` FOREIGN KEY (`fName`, `lName`, `birthday`) REFERENCES `director` (`fName`, `lName`, `birthday`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `diversity`
--

DROP TABLE IF EXISTS `diversity`;
/*!50001 DROP VIEW IF EXISTS `diversity`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `diversity` AS SELECT 
 1 AS `location`,
 1 AS `COUNT(*)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `genreType` varchar(300) NOT NULL,
  PRIMARY KEY (`genreType`),
  UNIQUE KEY `genre_idx` (`genreType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `genrefiction`
--

DROP TABLE IF EXISTS `genrefiction`;
/*!50001 DROP VIEW IF EXISTS `genrefiction`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `genrefiction` AS SELECT 
 1 AS `title`,
 1 AS `genreType`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `jacoblist`
--

DROP TABLE IF EXISTS `jacoblist`;
/*!50001 DROP VIEW IF EXISTS `jacoblist`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `jacoblist` AS SELECT 
 1 AS `fName`,
 1 AS `lName`,
 1 AS `birthday`,
 1 AS `language`,
 1 AS `location`,
 1 AS `isPopularActor`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `logincredentials`
--

DROP TABLE IF EXISTS `logincredentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logincredentials` (
  `emailAddress` varchar(300) NOT NULL,
  `password` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`emailAddress`),
  CONSTRAINT `logincredentials_chk_1` CHECK ((`emailAddress` like _utf8mb4'%_@__%.__%'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `title` varchar(300) NOT NULL,
  `originatingCountry` varchar(300) DEFAULT NULL,
  `contractStartDate` date DEFAULT NULL,
  `yearReleased` int DEFAULT NULL,
  `maturityRating` varchar(300) DEFAULT NULL,
  `duration` varchar(300) DEFAULT NULL,
  `language` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`title`),
  UNIQUE KEY `movie_idx` (`title`),
  KEY `contractStartDate` (`contractStartDate`),
  CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`contractStartDate`) REFERENCES `contract` (`contractStartDate`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `movie_chk_1` CHECK ((`yearReleased` <= 2021))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `movieaward`
--

DROP TABLE IF EXISTS `movieaward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movieaward` (
  `awardName` varchar(300) NOT NULL,
  `dateReceived` date NOT NULL,
  `title` varchar(300) NOT NULL,
  PRIMARY KEY (`dateReceived`,`awardName`),
  KEY `title` (`title`),
  CONSTRAINT `movieaward_ibfk_1` FOREIGN KEY (`title`) REFERENCES `movie` (`title`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `movieratings`
--

DROP TABLE IF EXISTS `movieratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movieratings` (
  `title` varchar(300) NOT NULL,
  `ratingCount` int NOT NULL,
  PRIMARY KEY (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `moviesgenre`
--

DROP TABLE IF EXISTS `moviesgenre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moviesgenre` (
  `title` varchar(300) NOT NULL,
  `genreType` varchar(300) NOT NULL,
  PRIMARY KEY (`title`,`genreType`),
  KEY `genreType` (`genreType`),
  CONSTRAINT `moviesgenre_ibfk_1` FOREIGN KEY (`title`) REFERENCES `movie` (`title`) ON UPDATE CASCADE,
  CONSTRAINT `moviesgenre_ibfk_2` FOREIGN KEY (`genreType`) REFERENCES `genre` (`genreType`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `title` varchar(300) NOT NULL,
  `date` varchar(300) NOT NULL,
  `emailAddress` varchar(100) NOT NULL,
  `rating` int DEFAULT NULL,
  PRIMARY KEY (`title`,`date`,`emailAddress`),
  KEY `emailAddress` (`emailAddress`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`title`) REFERENCES `movie` (`title`) ON UPDATE CASCADE,
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`emailAddress`) REFERENCES `user` (`emailAddress`) ON UPDATE CASCADE,
  CONSTRAINT `review_chk_1` CHECK (((`rating` <= 5) and (`rating` > 0)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `fName` varchar(45) NOT NULL,
  `lName` varchar(45) NOT NULL,
  `paymentMethod` varchar(45) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `emailAddress` varchar(45) NOT NULL,
  `language` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`fName`,`lName`,`emailAddress`),
  UNIQUE KEY `user_idx` (`fName`,`lName`,`emailAddress`),
  KEY `emailAddress` (`emailAddress`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`emailAddress`) REFERENCES `logincredentials` (`emailAddress`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `diversity`
--

/*!50001 DROP VIEW IF EXISTS `diversity`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `diversity` AS select `u`.`location` AS `location`,count(0) AS `COUNT(*)` from `user` `u` group by `u`.`location` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `genrefiction`
--

/*!50001 DROP VIEW IF EXISTS `genrefiction`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `genrefiction` AS select `moviesgenre`.`title` AS `title`,`moviesgenre`.`genreType` AS `genreType` from `moviesgenre` where (`moviesgenre`.`genreType` like '%Fiction%') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `jacoblist`
--

/*!50001 DROP VIEW IF EXISTS `jacoblist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `jacoblist` AS select `actor`.`fName` AS `fName`,`actor`.`lName` AS `lName`,`actor`.`birthday` AS `birthday`,`actor`.`language` AS `language`,`actor`.`location` AS `location`,`actor`.`isPopularActor` AS `isPopularActor` from `actor` where (`actor`.`fName` = 'Jacob') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-25 21:07:57
