-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: dv1663
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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `C_ID` varchar(255) NOT NULL,
  `CourseName` varchar(255) DEFAULT NULL,
  `Req_Points` int DEFAULT NULL,
  `Req_Programming_Points` int DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES ('DV1493','Datorteknik',0,16),('DV1574','Programmering och problemlösning med Python',0,0),('DV1601','Användbarhet och interaktionsdesign',0,6),('DV1625','Datastrukturer och algoritmer',0,8),('DV1626','Programmering i C++',0,2),('DV1629','Operativsystem',0,13),('DV1655','Kompilator- och översättarteknik',0,18),('DV1663','Databasteknik',0,12),('DV2606','Multiprocessorprogrammering',60,24),('DV2619','Tillämpad artificiell intelligens',0,18),('DV2626','Maskininlärning',0,6),('ET2625','Robotik',0,12),('FY1430','Fysik, dipoler och elektromagnetiska vågor',8,0),('FY1431','Fysik grundkurs',0,0),('IY1402','Industriell ekonomi, översiktskurs',0,0),('IY1425','Affärsstrategier för digital transformation',18,0),('IY1430','ICT startups och högteknologiskt entreprenörskap',6,0),('IY1431','Projektledning och Ledarskap i Mjukvaruutveckling',6,0),('MA1444','Analys 1',0,0),('MA1445','Analys 2',0,0),('MA1446','Diskret matematik',0,0),('MA1447','Flervariabelanalys',0,0),('MA1448','Linjär algebra 1',0,0),('MA1486','Matematisk problemlösning',0,0),('MS1405','Matematisk statistik',0,0),('PA1450','Programvaruutveckling',0,6),('PA1454','Programvaruarkitektur och kvalitet',0,28),('PA1459','Objektorienterad Design',0,7),('PA1461','Ingenjörsarbete inom ICT - Introduktion',0,0),('PA1463','Kravhantering',0,12),('PA1465','Testning av mjukvara',0,18),('PA1466','Global mjukvaruutveckling',0,6),('PA1467','Hållbarhet i och för mjukvaruutveckling',14,0),('PA1468','Säkerhet och mjukvaruutveckling',0,18),('PA1469','Utveckling av mobila applikationer',60,0),('PA1475','Projekt i systemteknik',0,8),('PA2554','Forskningsmetodik i Programvaruteknik och Datavetenskap',120,0),('PA2558','Evolution och Underhåll av Mjukvara - Projekt',120,30),('PA2562','Säker mjukvaruutveckling',45,0),('PA2567','Avancerat mjukvaruprojekt i team',0,25),('PA2570','Människan i mjukvaruutveckling',0,6),('PA2571','Värdedriven mjukvaruutveckling',0,12),('PA2572','Datadriven mjukvaruutveckling',0,30),('PA2573','Ekosystem och system-av-system',0,18),('PA2577','Tillämpad Cloud Computing och Big Data',90,30),('TE1423','Teknikutveckling, digitalisering och samhällsförändring',0,0);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-26 15:48:36
