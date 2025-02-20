-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: directanime_dw_db
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `media_downloads`
--

DROP TABLE IF EXISTS `media_downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_downloads` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` int DEFAULT NULL,
  `imdb_rating` float DEFAULT NULL,
  `genre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('series','movie','OVA','Especial') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_downloads`
--

LOCK TABLES `media_downloads` WRITE;
/*!40000 ALTER TABLE `media_downloads` DISABLE KEYS */;
INSERT INTO `media_downloads` VALUES (111,'Haikyuu!! Movie: Gomisuteba no Kessen',NULL,4,'Deportes, Escolares','movie'),(112,'Gridman Universe',NULL,3.5,'Acción, Ciencia Ficción, Mecha','movie'),(113,'Blue Lock: Episode Nagi',NULL,3.7,'Deportes, Shounen','movie'),(114,'Haikyuu!! Movie: Gomisuteba no Kessen',NULL,4,'Deportes, Escolares','movie'),(115,'Gridman Universe',NULL,3.5,'Acción, Ciencia Ficción, Mecha','movie'),(116,'Blue Lock: Episode Nagi',NULL,3.7,'Deportes, Shounen','movie'),(117,'Haikyuu!! Movie: Gomisuteba no Kessen',NULL,4,'Deportes, Escolares','movie'),(118,'Gridman Universe',NULL,3.5,'Acción, Ciencia Ficción, Mecha','movie'),(119,'Blue Lock: Episode Nagi',NULL,3.7,'Deportes, Shounen','movie'),(120,'Jibaku Shounen Hanako-kun 2',NULL,4.4,'Escolares, Sobrenatural','series'),(121,'Sentai Red Isekai de Boukensha ni Naru',NULL,3.9,'Acción, Aventuras, Comedia, Fantasía, Shounen','series'),(122,'A-Rank Party wo Ridatsu shita Ore wa, Moto Oshiego-tachi to Meikyuu Shinbu wo Mezasu.',NULL,4.2,'Acción, Aventuras, Fantasía','series'),(123,'Jibaku Shounen Hanako-kun 2',NULL,4.4,'Escolares, Sobrenatural','series'),(124,'Sentai Red Isekai de Boukensha ni Naru',NULL,3.9,'Acción, Aventuras, Comedia, Fantasía, Shounen','series'),(125,'A-Rank Party wo Ridatsu shita Ore wa, Moto Oshiego-tachi to Meikyuu Shinbu wo Mezasu.',NULL,4.2,'Acción, Aventuras, Fantasía','series'),(126,'Haikyuu!! Movie: Gomisuteba no Kessen',NULL,4,'Deportes, Escolares','movie'),(127,'Gridman Universe',NULL,3.5,'Acción, Ciencia Ficción, Mecha','movie'),(128,'Blue Lock: Episode Nagi',NULL,3.7,'Deportes, Shounen','movie'),(129,'Haikyuu!! Movie: Gomisuteba no Kessen',NULL,4,'Deportes, Escolares','movie'),(130,'Gridman Universe',NULL,3.5,'Acción, Ciencia Ficción, Mecha','movie'),(131,'Blue Lock: Episode Nagi',NULL,3.7,'Deportes, Shounen','movie'),(132,'Haikyuu!! Movie: Gomisuteba no Kessen',NULL,4,'Deportes, Escolares','movie'),(133,'Gridman Universe',NULL,3.5,'Acción, Ciencia Ficción, Mecha','movie'),(134,'Blue Lock: Episode Nagi',NULL,3.7,'Deportes, Shounen','movie'),(135,'Spy x Family Movie: Code: White',NULL,4.7,'Acción, Comedia, Shounen','movie'),(136,'Psycho-Pass Movie: Providence',NULL,4.6,'Acción, Ciencia Ficción, Misterio, Psicológico, Suspenso','movie'),(137,'One Piece Film: Red',NULL,4.1,'Acción, Aventuras, Comedia, Drama, Fantasía, Shounen','movie'),(138,'Black Clover: Mahou Tei no Ken',NULL,4.6,'Acción, Comedia, Fantasía, Shounen','movie'),(139,'5-toubun no Hanayome Movie',NULL,4.6,'Comedia, Escolares, Harem, Romance, Shounen','movie'),(140,'Kimi wo Aishita Hitori no Boku e',NULL,4.2,'Ciencia Ficción, Romance','movie'),(141,'Boku ga Aishita Subete no Kimi e',NULL,4.5,'Ciencia Ficción, Romance','movie'),(142,'Tensei shitara Slime Datta Ken Movie: Guren no Kizuna-hen',NULL,4.4,'Acción, Aventuras, Comedia, Fantasía','movie'),(143,'Watashi ni Tenshi ga Maiorita! Precious Friends',NULL,4.6,'Comedia','movie'),(144,'Kaguya-sama wa Kokurasetai: First Kiss wa Owaranai',NULL,4.8,'Comedia, Drama, Escolares, Romance, Seinen','movie'),(145,'Isekai Quartet Movie: Another World',NULL,4.7,'Comedia, Fantasía, Parodia','movie'),(146,'Yuru Camp△ Movie',NULL,4.7,'Recuentos de la vida','movie'),(147,'Jujutsu Kaisen 0 Movie',NULL,4.8,'Acción, Escolares, Fantasía, Shounen','movie'),(148,'Sword Art Online: Progressive Movie - Hoshi Naki Yoru no Aria',NULL,4.7,'Acción, Aventuras, Fantasía','movie'),(149,'Boku no Hero Academia the Movie 3: World Heroes\' Mission',NULL,4.5,'Acción, Shounen, Superpoderes','movie'),(150,'Fate/Grand Order: Shuukyoku Tokuiten - Kani Jikan Shinden Solomon',NULL,4.5,'Acción, Fantasía, Sobrenatural','movie'),(151,'Nanatsu no Taizai Movie 2: Hikari ni Norowareshi Mono-tachi',NULL,4.3,'Acción, Aventuras, Fantasía, Sobrenatural','movie'),(152,'Kimetsu no Yaiba Movie: Mugen Ressha-hen',NULL,4.7,'Acción, Demonios, Historico, Shounen, Sobrenatural','movie'),(153,'Evangelion 3.0+1.0 Thrice Upon a Time',NULL,4.8,'Acción, Drama, Mecha, Psicológico, Sobrenatural','movie'),(154,'Yes ka No ka Hanbun ka',NULL,4.3,'Drama, Yaoi','movie'),(155,'Given Movie',NULL,4.7,'Drama, Música, Recuentos de la vida, Romance, Yaoi','movie');
/*!40000 ALTER TABLE `media_downloads` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-19  1:13:22
